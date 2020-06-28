# Chapter 1 - Open Source, Cross-Platform, Multi-Database
I have had many strange looks after mentioning “Open Source” and “Microsoft” within the same sentence. Even people not overly tech savvy can elicit a similar response, which speaks volumes to Microsoft's history and reputation. This is also reflected in their non-negotiable, and generally incomprehensible licensing agreements. And yet, if you are looking for a common theme in the pages to follow, “Open Source” is exactly what you will find in this Microsoft product. 

Even better, this is only the beginning when it comes to Azure Data Studio (ADS), which includes both Cross-Platform and Multi-Database capabilities. This is clearly not the Microsoft from earlier years, including the era of Steve Ballmer who once referred to the free software Linux kernel as ‘communism’[^ballmer]. (Full disclosure: Mr. Ballmer does have a new and fresh perspective on the “open source” topic today).

## What “Open Source” means for this new breed of Microsoft Software
Azure Data Studio provides for a happy convergence of ‘free’, ‘powerful’, and ‘open source’. In this world, ‘free’ and ‘powerful’ can often be a winning combination, as demonstrated with popular desktop products such as Notepad++ and web-based applications like Gmail. Adding ‘open source’ to a product is even a greater ‘win’ and has to potential to shift an entire software market.

A card more commonly played by a market newcomer, Microsoft’s ‘open source’ strategy is a surprising and encouraging development. After all, creative software developers worldwide desire to make their mark, which is exponentially more difficult in a strategically ‘closed’ environment, clouded with draconian licensing restrictions. By going ‘open source’, Microsoft has essentially sided with individuals, and smaller development shops, providing a path for first class extensions integrated into their widely available products.

Interestingly, the world of open source is a two-way street. Not only do Developers gain a new avenue for productive and creative expression, but Microsoft, now the world’s top open source contributor[^open], is rewarded by many new, as well as ‘off payroll’ programmers. Independent developers over the world can now contribute to Microsoft’s open source products directly on GitHub. This places their code just one “pull request” away from potentially improving core Microsoft products.

### A perspective on Open Source
The open source concept is a bit like receiving a free video camera along with step by step instructions on how it was built. You can not only use the camera to make the next YouTube sensation, but you could alter the camera to add a custom telephoto lens, extended battery, or motion detector. While functional changes are admittedly much more difficult than simply using the camera, the ‘potential’ is there. This engineering transparency adds a layer of technical scrutiny to the manufacturer, but would most likely lead to broader, not to mention more ‘cost competitive’ aftermarket products.

This is the new world of Microsoft open source. Even though you may never want, need, or have time to plow through the ADS source code, the mere fact that you *can* is critically important for the product and its forward potential.

Microsoft’s *licensing* for Azure Data Studio is also a departure from the past, consisting of just two ‘readable’ paragraphs. The text has very liberal license terms for ADS [^license], granting even *sublicensing* rights when you are using ADS with your affiliates and/or vendors, while they are performing work on your behalf.

### Extend and Enhance ADS
You can *extend and enhance* ADS in a surprising number of ways, enabled both by ‘open source’, and the actual ADS product architecture. Options range from:
- Product extensions (authored by Microsoft, third parties, or even you!)
- Easily accessible ‘code snippets’ for SQL and other languages
- Dashboard widgets including the popular SandDance visualization
- Highly versatile Juypter notebooks
- Integrated Terminal Window command line options
- Customizable keyboard shortcuts

A couple notable ‘extensions’ include ‘PostgresSQL’ from Microsoft, and “SQL Server Schema Compare” from Redgate. We will cover these and more in this book, but it is worth noting that extensions will likely catapult ADS into the ‘must have’ category for your desktop. Unlike traditional ‘add-ins’, extensions are developed on the identical platform (Electron shell and Node.js) as ADS itself. This is because ADS and its extensions come from the same mothership: ‘VS Code’. Interestingly, even VS Code shares a similar development platform, and is itself fully extensible [^extensible].

### Contribute to ADS
Anyone with enough time, skill and determination could develop an official ‘fix’ or ‘enhancement’ to Azure Data Studio. This would be done to either add capabilities used *internally* for your organization or developed and submitted to Microsoft as an official product improvement available to *anyone*. In the case of ‘internal’ use, the ADS license allows you to change, distribute and sublicense your custom version of ADS, albeit to a limited audience. 

Alternately, to allow Microsoft to incorporate your changes into ADS proper, you only need to create a GitHub ‘Pull Request’ on the official ADS site: https://github.com/microsoft/azuredatastudio and Microsoft will review and potentially incorporate your code submission into the next release of ADS.
Another option, in the event you simply discover a bug, or have a suggestion for improvement, is to use GitHub to create an ‘issue’. For those interested in participating in this way, Microsoft has a page on their site: https://github.com/microsoft/azuredatastudio/blob/master/CONTRIBUTING.md providing guidelines for interacting with the ‘Issues’ section on GitHub.

## The new options provided by “Cross-Platform” computing
The see-saw battle for computer and software dominance between Microsoft and Apple, and by extension between Windows and macOS, while still on-going, will perhaps end in a whimper, not a bang. This is because these behemoths, and the growing ‘platform agnostic’ cloud computing options are making the reminiscent *"I’m a PC, I’m a Mac"* choice less relevant. Add to this the increasing popularity of Linux, which is also free and open source (anyone see a pattern?) and you have several platform options for running Azure Data Studio.

### What about the Database ‘Platform’
When you are using ADS, there is a great likelihood that you are querying, developing, managing, or analyzing the contents of one or more databases. Here as well you have many options for where your databases can reside. Despite a common misconception (probably due to having ‘Azure’ in its name), Azure Data Studio provides full connectivity to both cloud and on-premise Database Systems.
But your database choices do not stop there. If we just consider SQL Server for now (only one ADS supported databases), we have many platform options including:
- Windows
- Linux
- Docker Containers (for Windows, Linux and macOS)
- Azure Cloud
- AWS Cloud
- Google Cloud

While not a comprehensive list of platform options, it is clear that ‘SQL Server’ is no longer just a ‘Windows’ product. But read on because ADS is designed for *more* than just Microsoft’s flag ship ‘SQL Server’ database.

## What “Multi-Database” means for your SQL experience
Not content to simply be cross-platform, ADS is designed to connect beyond SQL Server. At the time of this writing, ADS directly supports ‘SQL Server’ and ‘PostgreSQL’ [^postgresql] as *first class* citizens. This is the case whether your target Database System is on-premise, in the cloud, in a container, or on bare metal. Soon (most likely by the time you read this), two additional Databases should be added to this list: ‘MySQL’, and ‘MariaDB’.

But there is more to the Multi-Database story due to language (kernel) options that are baked into ADS, such as PowerShell, Python and Spark. In short, ADS can be used for *any* database that is within reach of these supported languages.

Technically considered *second class* database connections (due to the intermediating host language), but perhaps also strengthened for the same reason. For example, let us say you would like to connect to the cloud based ‘snowflake’ database while using ADS. A good language choice for this would be Python since (a) it is a directly supported ADS language, and (b) it has native ‘snowflake’ connector. When using Python in ADS, you can invoke scripts from the Terminal Window, or within a Juypter notebook. In either case, you now can use Python language constructs (e.g., variables, arrays, loops and branches) to implement complex logic that is ultimately rendered ‘snowSQL’ statements (snowflake’s SQL dialect).

### Summary
When asked of Microsoft and early adopters if Azure Data Studio is a *replacement* for SQL Server Management Studio (SSMS), the most common responses are “not yet if you are a Data Base Administrator”, or “yes if you are primarily a SQL Developer”. However, I think these replies are a bit short sighted since ADS is much broader in scope than SSMS (a Windows only management application for SQL Server). As *startling* as it may sound, Azure Data Studio at its core is mostly database, platform, and language agnostic. While it is true that ‘SQL Server’ was the first ADS supported database, Microsoft quickly moved on to support third-party databases, despite the aforementioned SSMS functionality gaps for DBAs.

The bigger picture however is based on the very architecture of ADS, which puts the ‘user community’ in the driver’s seat, whether creating simple enhancements, or developing highly functional extensions and placing them in the integrated ‘Extensions Marketplace’. Azure Data Studio is truly a new and open breed of software, which can certainly complement, if not eventually replace *multiple programs* that prominently sit on many of our desktops. Even the word ‘replace’ in this context seems insufficient, since ADS *integrates* formerly disparate applications under a single roof. And this is precisely where I think things will get interesting for all Data Professionals.

[^ballmer]: https://www.theregister.co.uk/2000/07/31/ms_ballmer_linux_is_communism
[^open]: https://www.infoworld.com/article/3253948/who-really-contributes-to-open-source.html
[^license]: https://github.com/microsoft/azuredatastudio/blob/master/LICENSE.txt
[^extensible]: https://bornsql.ca/blog/introducing-azure-data-studio
[^postgresql]: For PostgreSQL support you first need to add the free PostgreSQL extension from Microsoft. This can be found in the ADS Extensions ‘Marketplace’