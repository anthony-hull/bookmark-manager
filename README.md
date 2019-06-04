# bookmarks

**User Story**
--------------
* As a user
* So that I can see which bookmarks are available
* I want to be able to see a list of bookmarks

![alt text](https://github.com/LaurenOM/bookmarks/blob/master/Bookmark%20MVC.jpg)

**Database: creating bookmark manager table** 

* Connect to psql
* Create the database (and test DB) using:
~~~~
CREATE DATABASE bookmark_manager ENCODING 'UTF8';
CREATE DATABASE bookmark_manager_test ENCODING 'UTF8';
~~~~
* Connect to the database using the pqsl command \c bookmark_manager and bookmark_manager_test;
* Run the query we have saved in the file 01_create_bookmarks_table.sql

