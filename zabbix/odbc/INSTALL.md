## Instructions
  
* CentOS  
wget http://ftp.iij.ad.jp/pub/db/mysql/Downloads/Connector-ODBC/5.2/mysql-connector-odbc-5.2.6-1.el6.x86_64.rpm  
rpm -ivh mysql-connector-odbc-5.2.6-1.el6.x86_64.rpm  
rpm -qa | grep connector  
yum install unixODBC unixODBC-devel  
odbcinst -j  
  

Config files:  
/etc/odbcinst.ini  
/etc/odbc.ini  


### Validate  

```
isql -v ZABBIXDB  
+---------------------------------------+  
| Connected!                            |  
|                                       |  
| sql-statement                         |  
| help [tablename]                      |  
| quit                                  |  
|                                       |  
+---------------------------------------+  
SQL> select version();  
+----------+  
| version()|  
+----------+  
| 8.0.13   |  
+----------+  
SQLRowCount returns 1  
1 rows fetched  
SQL>
```
