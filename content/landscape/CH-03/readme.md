[Back](../readme.md)

# Chapter 3 - SQL Editing Reimagined
Database developers typically spend a great deal of time creating and editing SQL queries, so it only makes sense to make this experience as helpful, convenient and productive as possible. Azure Data Studio has truly reimagined how developers interact with SQL coding, and for that matter, all the languages supported on the platform. [Full text available at leanpub.com](https://leanpub.com/hands-on-ads)

## **Outline for this chapter:**
> (No notebooks are included in this chapter)

## IntelliSense, Snippets and Object Definitions

### Code Snippets

### Object Definitions

#### Creating a Snippet for Column Definitions

``` sql
select * from msdb.INFORMATION_SCHEMA.COLUMNS 
where COLUMN_NAME = 'plan_name'
```

## Saving Queries and Snippets

```sql
select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'column_name'
```

```sql
select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = '${1:ColumnName}'
```

```json
 { "Information Schema for Columns": {
  "prefix": "InfoSchemaColumns",
  "body": "select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = '${1:ColumnName}'" } }
```

## Top Down View with Minimap

## SQL Queries via the Command Terminal

```powershell
Invoke-Sqlcmd -Query "select * from INFORMATION_SCHEMA.TABLES" -ServerInstance "localhost"
```

```powershell
Invoke-Sqlcmd -Query "select * from INFORMATION_SCHEMA.TABLES" -ServerInstance "localhost" | export-csv -Delimiter ',' -Path "tables.csv" -NoTypeInformation
```
