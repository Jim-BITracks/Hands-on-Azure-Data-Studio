[Back](../readme.md)

# Chapter 6 - Reaching Beyond SQL with PowerShell, the Terminal Window, and an Extension

# ***Contents***

> Notebook:
> [Copy Table Example](CH-06-01.ipynb)

**'BACKUP and COPY' script for the *car_crash* database**

``` powershell
Invoke-Sqlcmd -Query "BACKUP DATABASE car_crash TO DISK = 'C:\temp\car_crash.bak'" -ServerInstance "localhost"
Copy-Item "C:\temp\car_crash.bak" -Destination "\\network_server\db backup"
```

## Creating a Simple Dataflow

### Dataflow Components

A great repository for PowerShell scripts has been compiled in a site called [dbatools](https://dbatools.io/) which has an extraordinary number of very helpful PowerShell cmdlets centric to SQL Server. A quick perusal of this site reveals that a script called [Copy-DbaDbTableData](https://docs.dbatools.io/#Copy-DbaDbTableData) is in fact available which will copy a table between 2 servers. 


### Getting Started
If you do not already have **PowerShell Core** [^PSCORE], you will want to install the latest version. You can use this [link](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7) to find the correct PowerShell installation for your system.

Next you'll want to download (or cut and paste from below) a copy of the PowerShell script called: "simple_dataflow.ps1". This script is also available from the book's official GitHub site: https://github.com/Jim-BITracks/Hands-on-Azure-Data-Studio under the 'scripts' folder.

**simple_dataflow.ps1**

``` powershell
[CmdletBinding()]

Param(
    [string]$src_conn,
    [string]$dest_conn,
    [string]$src_sql_command,
    [string]$dst_schema,
    [string]$dst_table,
    [string]$dest_truncate
)

#new method for BulkCopy
$source = 'namespace System.Data.SqlClient
{
	using Reflection;
	public static class SqlBulkCopyExtension
	{
		const String _rowsCopiedFieldName = "_rowsCopied";
		static FieldInfo _rowsCopiedField = null;
		public static int RowsCopiedCount(this SqlBulkCopy bulkCopy)
		{
			if (_rowsCopiedField == null) _rowsCopiedField = typeof(SqlBulkCopy).GetField(_rowsCopiedFieldName, BindingFlags.NonPublic | BindingFlags.GetField | BindingFlags.Instance);
			return (int)_rowsCopiedField.GetValue(bulkCopy);
		}
	}
}
'
Add-Type -WarningAction Ignore -IgnoreWarnings -ReferencedAssemblies System.Runtime, System.Data, System.Data.SqlClient -TypeDefinition $source
$null= [Reflection.Assembly]::LoadWithPartialName("System.Data")

# truncate destination table
if ($dest_truncate -eq "Y")
{
    $dest_conn_ = New-Object System.Data.SqlClient.SqlConnection
    $dest_conn_.ConnectionString = $dest_conn
    $dest_cmd_ = New-Object System.Data.SqlClient.SqlCommand
    $dest_cmd_.Connection = $dest_conn_
    $dest_cmd_.CommandText = "TRUNCATE TABLE [$dst_schema].[$dst_table]"
    try
    {
        $dest_conn_.Open()
        $dest_cmd_.ExecuteNonQuery()
        $dest_conn_.Close()
        Write-Output "destination truncated"
    }
    catch
    {
        $dest_conn_.Close()
        Write-Output 'Error: Truncate destination table failed!'
		return
    }
}
# set-up source connection
$src_conn_ = New-Object System.Data.SqlClient.SqlConnection
$src_conn_.ConnectionString = $src_conn
$src_cmd = New-Object System.Data.SqlClient.SqlCommand
$src_cmd.Connection = $src_conn_
$src_cmd.CommandText = $src_sql_command

# bulk copy
try
{
    $src_conn_.Open()
    [System.Data.SqlClient.SqlDataReader] $SqlTable = $src_cmd.ExecuteReader()
    $dst_bulkCopy = New-Object System.Data.SqlClient.SqlBulkCopy($dest_conn,[System.Data.SqlClient.SqlBulkCopyOptions]::Default)
    $dst_bulkCopy.DestinationTableName = "[$dst_schema].[$dst_table]" 
    $dst_bulkCopy.BatchSize = 1000000
    $dst_bulkCopy.BulkCopyTimeout = 0 # in seconds, use 3600 seconds for 1 hour 
    $dst_bulkCopy.Add_SqlRowscopied({Write-Host "$($args[1].RowsCopied) rows copied" })
    $dst_bulkCopy.WriteToServer($SqlTable)
    $src_conn_.Close()
    $rowcount_end = [System.Data.SqlClient.SqlBulkCopyExtension]::RowsCopiedCount($dst_bulkCopy)
    Write-Output "Row Count $rowcount_end"
}
catch
{
    $src_conn_.Close()
    Write-Output 'Error: Bulk Copy failed!'  $_.Exception.Message
}
```

### Specifying the 'Source' Table

### Creating the 'Destination' Table


```sql 
create database [test];
```

```sql 
use [test];

CREATE TABLE [dbo].[D_TIME](
	[TIME_KEY] [time](0) NOT NULL,
	[HOUR] [tinyint] NOT NULL,
	[MINUTE] [tinyint] NOT NULL,
	[SECOND] [tinyint] NOT NULL,
	[TIME_IN_SECONDS] [int] NOT NULL
 ) ON [PRIMARY];
```

### Running the PowerShell Script in a Notebook


``` markdown
# Copy Table Example
```

``` powershell
$src_conn = "Server=localhost;Database=car_crash;Integrated Security=True;"
$dest_conn = "Server=localhost;Database=test;Integrated Security=True;"
$src_sql_command = "SELECT * FROM edw.D_TIME"
$dst_schema = "dbo"
$dst_table = "D_TIME"
$dest_truncate = "Y"

pwsh -file "c:\hands-on-ads\simple_dataflow.ps1" -src_conn $src_conn -dest_conn $dest_conn -src_sql_command $src_sql_command -dst_schema $dst_schema -dst_table $dst_table -dest_truncate $dest_truncate
```

> This notebook file 'CH-06-01.ipynb' is also available from the book's official GitHub site: https://github.com/Jim-BITracks/Hands-on-Azure-Data-Studio under the 'CH-06' folder.

For an entertaining video comparing the **ETL vs ELT** paradigm, please review this [Pizza](https://youtu.be/kJcd6xVK2lY) video: https://youtu.be/kJcd6xVK2lY

### Running the PowerShell Script in the Terminal


``` powershell
pwsh -file "c:\hands-on-ads\simple_dataflow.ps1" -src_conn "Server=localhost;Database=car_crash;Integrated Security=True;" -dest_conn "Server=localhost;Database=test;Integrated Security=True;" -src_sql_command "SELECT * FROM edw.D_TIME" -dst_schema "dbo" -dst_table "{your table name}" -dest_truncate "N"
```

## Using the "Simple DataFlow" Extension for ADS

> Note: Chapter 8 will provide an introduction to Extensions in Azure Data Studio. In the mean time you may want to reference this [link](https://docs.microsoft.com/en-us/sql/azure-data-studio/extensions?view=sql-server-ver15) on Extending ADS.

Our "Simple Dataflow" extension for ADS can be downloaded from the book's official GitHub site: https://github.com/Jim-BITracks/Hands-on-Azure-Data-Studio under the 'extensions' folder.

## Links
[PowerShell Notebook](CH-06-01.ipynb)

[dbatools](https://dbatools.io/)

[Copy-DbaDbTableData](https://docs.dbatools.io/#Copy-DbaDbTableData)

[PowerShell Core](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7)

[ELT vs ETL](https://youtu.be/kJcd6xVK2lY)

[Extensions in ADS](https://docs.microsoft.com/en-us/sql/azure-data-studio/extensions?view=sql-server-ver15)