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