[Back](../readme.md)

## Visualizing and Exporting Your Queries
SQL queries generally return rows and columns which is often enough, especially with small datasets. However, if you have a larger result set, and/or you have the need to share the information, this chapter will illustrate how Azure Data Studio can help. As data professionals it is often helpful to *visualize* a set of data, as well as to share results and analysis with our co-workers, internal and external clients, or even feed into other workstreams. Instead of relying on external applications, ADS is happily a one-stop-shop to create, run, visualize, and export your database queries. [Full text available at leanpub.com](https://leanpub.com/hands-on-ads)

# ***Contents***
> (No notebooks are included in this chapter)


## Loading Sample Data

## Anatomy of the Results Pane

```sql
select distinct BOROUGH  
  from edw.D_LOCATION
```

## Querying for Easy Visuals

```sql
select l.BOROUGH
     , count(*) as ACCIDENTS
  from edw.D_LOCATION l
  join edw.F_COLLISIONS c
    on c.LOCATION_ID = l.LOCATION_ID
 where l.BOROUGH is not null
 group by l.BOROUGH
 ```

## Getting Pixel Perfect

```sql
select l.BOROUGH
     , d.MONTH_NAME
     , count(*) as ACCIDENTS
  from edw.D_LOCATION l
  join edw.F_COLLISIONS c
    on c.LOCATION_ID = l.LOCATION_ID
  join edw.D_DATE d 
    on d.DATE_KEY = c.DATE_KEY
 where l.BOROUGH is not null
 group by l.BOROUGH
        , d.MONTH_NAME
 ```

## Links

[**Download:** SQL Server Database: car_crash](https://github.com/Jim-BITracks/Hands-on-Azure-Data-Studio/raw/master/database/car_crash.zip)

[NYC Opendata - Vehicle Collisions](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/data)

[Kimball Group Dimensional Modeling](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques)