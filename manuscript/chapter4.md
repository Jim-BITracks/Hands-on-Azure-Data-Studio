# Chapter 3 - Visualizing and Exporting Your Queries
SQL queries generally return rows and columns which is often enough, especially with small datasets. However, if you have a larger result set, and/or you have the need to share the information, this chapter will illustrate how Azure Data Studio can help. As data professionals it is often helpful to *visualize* a set of data, as well as to share results and analysis with our co-workers, internal and external clients, or even feed into other workstreams. Instead of relying on external applications, ADS is happily a one-stop-shop to create, run, visualize, and export your database queries.

### Sample Data
Beginning with this chapter, we are going to use a database named ‘car_crash’ which is a fairly small *DataMart* created from data provided by the “NYC OpenData” [^opendata] website. This dataset provides information on car accidents that have occurred in the 5 major NYC boroughs, over an approximate 8-year period (July 2012 through Feb 2020). The database is provided as a SQL Server 2017 backup (.bak) file which can be downloaded with the following link: https://bit.ly/3f5bbmK

After downloading, you can use Azure Data Studio to restore this database using the following steps:
> Note: Restoring databases should always be performed with caution as you have the potential to overwrite an existing database.

1. Unzip the downloaded file called: car_crash.zip (which is most likely located in your ‘download’ folder), and place the .bak file a convenient location to be referenced in step 5 below. For this example, I have placed the unzipped file (called: car_crash.bak) into folder C:\temp.
1. Using a ‘Server Level’ connection from the SERVERS sidebar, right-click the SQL Server where you would like to ‘restore’ this database, and select ‘Manage’ as shown in figure 4-1:

![Figure 4-1. Manage a Server Level Connection](Figure_04_01.png)

3. Click on ‘Restore’ from the Server ‘Dashboard’ as displayed in figure 4-2:

![Figure 4-2. Restore Task from Server Dashboard](Figure_04_02.png)

4. Select ‘Backup file’ in the ‘Restore from’ field
5. Click the ellipses (...) in the Backup file path field and navigate to the location where you stored the downloaded backup file (in this example we are using folder: **C:\temp**) and click on the file called: **car_crash.bak**. Your screen should look like figure 4-3:

![Figure 4-3. Select file to Restore](Figure_04_03.png)

6. Click on ‘OK’ and you should see the ‘Restore plan” as shown in Figure 4-4. Also be sure you have enough disk storage for this restore action. The database ‘size’ for the car_crash database is nearly 1 GB:

![Figure 4-4. Restore Plan from the Restore Form](Figure_04_04.png)

7. Verify the ‘Server’ and ‘Database’ names which are boxed in red in figure 4-4, and click ‘Restore’

Once complete, you should see the car_crash database listed in the Server Dashboard by clicking on the ‘Databases’ tab as displayed in Figure 4-5: 

![Figure 4-5. Viewing Databases with the Server Dashboard](Figure_04_05.png)

For more details on the schemas, tables, and relationships of this ‘sample’ database, please refer to Appendix ‘A’ – Understanding the car_crash DataMart.



[^opendata]: https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/data