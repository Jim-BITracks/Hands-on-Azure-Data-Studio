# Chapter 3 - SQL Editing Reimagined
Database developers typically spend a great deal of time creating and editing SQL queries, so it only makes sense to make this experience as helpful, convenient and productive as possible. Azure Data Studio has truly reimagined how developers interact with SQL coding, and for that matter, all the languages supported on the platform.

This is accomplished in large part by focusing directly on keyboard interactions, which incorporate IntelliSense, keywords, code snippets, and database object definitions. Much of the ADS User Interface is also *configurable*, providing customizable color themes, zoom levels, fonts, icons, as well as busy to minimal display panels.

## IntelliSense, Snippets and Object Definitions
To get started with entering SQL queries, you can either click on ‘New query’ from the Welcome page, or for more context specificity, right click on your target Database in the ‘Side Bar’, and choose ‘New Query’ as shown in figure 3-1:

![Figure 3-1. Create a New SQL Query](ch03_figures\Figure_03-01.png)

This will open a blank editing window where you can simply start typing. As you do type, each keystroke may pop-up with IntelliSense suggestions as shown in the Figure 3-2. Notice that the **FROM** keyword is highlighted in the sorted pop-up list indicating that you only need to hit the ‘tab’ key to accept the substitution.

![Figure 3-2. IntelliSense Keyword Pop-up](ch03_figures\Figure_03-02.png)

The up and down arrows provide navigation within this pop-up list, or you can use a mouse-click directly on the desired keyword. Also notice that figure 3-2 has the ‘Side Bar’ hidden, yielding a bit cleaner presentation. You can toggle the ‘Side Bar’ off and on by pressing the key sequence **Ctrl+B**. To accomplish the same with your pointing device, simply click on the ‘server icon’ in the ‘Activity Bar’ or use the ‘Menu Bar’ selections: View, Appearance, Show Side Bar.

### Code Snippets
One of my favorite editing features in ADS are powered by ‘Code Snippets’. These can be a huge timesaver, are fully integrated with IntelliSense, and are user customizable. Let us walk through a quick Snippet example. Let’s say you wanted to create a table. By typing **createtable** you will see the ‘camel cased’ snippet sqlCreatTable pop-up. You just hit ‘Tab’ when highlighted, or optionally click on the snippet in the pop-up, and you will get the ‘Create Table’ template as displayed in figure 3-3:

![Figure 3-3. Create Table (Default) Snippet](ch03_figures\Figure_03-03.png)