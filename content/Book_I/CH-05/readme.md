[Back](../readme.md)

# Chapter 5 - Getting Things Done with Notebooks
‘Jupyter Notebooks’ are a sleeping giant, poised to change about everything we do with data, analysis, and related processing. Born from Data Science, Jupyter Notebooks combine rich text, images, links, and code (for example SQL) along with persistent query results. These notebooks are fully packaged in a convenient and reusable text (json) file, which can also be stitched together forming a ‘book’ with related ‘readme’, and navigational ‘.yml’ files. This groundbreaking capability is deeply integrated into Azure Data Studio and is destined to have a broad impact with many of your SQL, Python, PowerShell, and other language interactions while working with your data and processes.

[Full text available at leanpub.com](https://leanpub.com/hands-on-ads)

# ***Content Outline, Notebooks, Code Samples, and Links***

## Notebooks:

[NYC Car Accidents](CH-05-01.ipynb)

[PowerShell Notebook](CH-05-02.ipynb)

[Python Notebook](CH-05-03.ipynb)


## Notebook Building Blocks

### Comments’ on Steroids via Markdown

### Fun with Code Cells

## Story with a SQL Notebook

```markdown
# NYC Car Accidents
## To/From Dates
```

```sql
SELECT MIN([DATE_KEY]) AS [MIN_DATE]
     , MAX([DATE_KEY]) AS [MAX_DATE]
     , DATEDIFF(YEAR, MIN([DATE_KEY]), MAX([DATE_KEY])) [SPAN_IN_YEARS]
  FROM [EDW].[F_COLLISIONS]
```

```markdown
## Car Accidents Grouped by Hour
```

```sql
SELECT DATEPART(HH,[TIME_KEY]) AS [HOUR OF THE DAY]
     , COUNT(*) AS [NUMBER OF ACCIDENTS]   
  FROM [EDW].[F_COLLISIONS]
 GROUP BY DATEPART(HH,[TIME_KEY]) 
 ORDER BY [HOUR OF THE DAY]
```

```markdown
## Car Accidents with Fatalities, Grouped by Hour
```

```sql
SELECT DATEPART(HH,[TIME_KEY]) AS [HOUR OF THE DAY]
     , COUNT(*) AS [ACCIDENTS WITH FATALITIES]
  FROM [EDW].[F_COLLISIONS]
 WHERE [NUMBER_OF_PERSONS_KILLED] > 0
 GROUP BY DATEPART(HH,[TIME_KEY]) 
 ORDER BY [HOUR OF THE DAY];
```

```markdown
## Car Accidents with Fatalities as a percentage, Grouped by Hour
```

```sql
WITH [count_fatalities] AS
(
SELECT DATEPART(HH,[TIME_KEY]) AS [HOUR OF THE DAY]
     , COUNT(*) AS [ACCIDENTS WITH FATALITIES]
  FROM [EDW].[F_COLLISIONS]
 WHERE [NUMBER_OF_PERSONS_KILLED] > 0
 GROUP BY DATEPART(HH,[TIME_KEY]) 
)
, [count_accidents] as
(
SELECT DATEPART(HH,[TIME_KEY]) AS [HOUR OF THE DAY]
     , COUNT(*) AS [NUMBER OF ACCIDENTS]   
  FROM [EDW].[F_COLLISIONS]
 GROUP BY DATEPART(HH,[TIME_KEY]) 
)
SELECT a.[HOUR OF THE DAY]
     , (( 0. + f.[ACCIDENTS WITH FATALITIES] ) / a.[NUMBER OF ACCIDENTS]) * 100 AS [PERCENT WITH FATALITIES]
  FROM [count_accidents] a
  JOIN [count_fatalities] f
    ON f.[HOUR OF THE DAY] = a.[HOUR OF THE DAY]
 ORDER BY [HOUR OF THE DAY];
```

## Kernel Options

### Simple PowerShell Notebook

```markdown
# PowerShell Notebook
## Copy SQL backup files from source to a destination server
```

```powershell
Copy-Item "\\src_computer_name\db backup\*.BAK" -Destination "\\dst_computer_name\db backup"
```

### Simple Python Notebook

```markdown
# Python Notebook
## Platform Information
```

``` python
import os
import platform
print ('Python version: ' + platform.python_version())
print (os.path.dirname(sys.executable))
```

```markdown
## Find Files
```

``` python
import fnmatch
import os
 
rootPath = '/'
pattern = '*.json'
 
for root, dirs, files in os.walk(rootPath):
    for filename in fnmatch.filter(files, pattern):
        print( os.path.join(root, filename))
```

## More to Come

## Links
[SQL Notebook](CH-05-01.ipynb)

[PowerShell Notebook](CH-05-02.ipynb)

[Supporting Video](https://youtu.be/IKj66u6Lyd4)

[Markdown Cheatsheet](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf)

[Markdown Formatting Examples](https://www.google.com/search?q=markdown)

[ADS Multi-Kernel Feature Request](https://github.com/microsoft/azuredatastudio/issues/5451)

[Latest Azure Data Studio Updates](https://docs.microsoft.com/en-us/sql/azure-data-studio/release-notes-azure-data-studio?view=sql-server-ver15)

[Changing the "Python kernel" in ADS](https://docs.microsoft.com/en-us/sql/azure-data-studio/notebooks-tutorial-python-kernel?view=sql-server-ver15#change-the-python-kernel)

[Python for Beginners](https://www.pythonforbeginners.com/)