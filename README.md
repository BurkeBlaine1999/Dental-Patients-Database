# Dental Patients Database

A relational Database made for my 3rd year semester 6 databases project

## Getting Started

1) Download [wamp64 Server](http://www.wampserver.com/en/download-wampserver-64bits/) 
2) When setting up make sure to select mysql 
3) Disable mariaDB
4) Set local port number on wamp64 to 3306 for mysql
5) Place PHP files into your www folder located in your wamp64 directory *Example --> C:\wamp64\www
6) Import CreatePatientDatabase.sql into your wamp64 databases [CLick here for info](#Import-SQL-file)

### Import SQL file

1. Open Command Prompt (CMD - DOS) get into the mysql folder, which in my case works like this
C:\> cd C:\wamp\bin\mysql\mysql5.0.51b\bin

2. Then use this command to fire up MySQL.
C:\wamp\bin\mysql\mysql5.0.51b\bin> mysql.exe -use databasename -u username -p

3. To make things easier, copy the SQL file into the same folder as mysql.exe, and then run this
mysql> source myfilename.sql;
  
  ### Prerequisites

[Wamp Server](http://www.wampserver.com/en/download-wampserver-64bits/)
[MySQL by Oracle](https://www.oracle.com/index.html)

## Running the tests

1. Start wamp server
2. Got to localhost/File.php *file being the name of one of the PHP files in the 'php files' folder

## Built With

* [Wamp Server](http://www.wampserver.com/en/download-wampserver-64bits/)

* [MySQL by Oracle](https://www.oracle.com/index.html)

## Versioning

Version 1.0

## Authors

* **Blaine Burke** - [GitHub](https://github.com/BurkeBlaine1999)

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/BurkeBlaine1999/Graph-Theory-Project/blob/master/LICENSE) file for details

## Acknowledgments

* [Geeks for geeks](https://www.geeksforgeeks.org/) - Helped with debugging 
* [Stack Overflow](https://stackoverflow.com/) - Helped with debugging 
