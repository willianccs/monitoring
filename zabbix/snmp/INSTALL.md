## Instructions

SNMP Trap  

* CentOS  
```
yum install -y wget make gcc gpp flex net-snmp net-snmp-utils net-snmp-perl epel-release perl-Sys-Syslog
yum install -y snmptt
```  

### Configuration

* vim /etc/sysconfig/snmptrapd
  
Include:  
```
OPTIONS="-On -Lsd -p /var/run/snmptrapd.pid" ao arquivo /etc/sysconfig/snmptrapd
```

* vim /etc/snmp/snmptrapd.conf [ SNMPTRAPD ]
```
traphandle default /usr/sbin/snmptt
disableAuthorization yes
```

* vim /etc/snmp/snmptt.ini [ SNMPTT ]
```
translate_log_trap_oid = 2
net_snmp_perl_enable = 1
date_time_format = %H:%M:%S %Y/%m/%d
log_file = /tmp/zabbix_traps.tmp
log_system_enable = 1
```

* touch /tmp/zabbix_traps.tmp
  
* snmptt.conf
```
EVENT general .* "General event" Normal
FORMAT ZBXTRAP $aA $ar
```

* Start services
```
systemctl enable snmptt
systemctl start snmptt
systemctl enable snmptrapd
systemctl start snmptrapd
```


* Test
```
snmptrap -v 1 -c public 127.0.0.1 '.1.3.6.1.6.3.1.1.5.3' '0.0.0.0' 6 33 '55' .1.3.6.1.6.3.1.1.5.3 s "teststring000"
```


### Zabbix server confs

Edit lines and restart service "zabbix-server":  
```
SNMPTrapperFile=/tmp/zabbix_traps.tmp
StartSNMPTrapper=1
```
