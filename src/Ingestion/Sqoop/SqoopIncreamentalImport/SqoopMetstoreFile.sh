<<COMMENT
Sometime you require metastore service to be shared by other client. 

1.  Sqoop Metastore : you can use this command to view metastore URL of your sqoop machine.

2. --meta-connect : this parametere is used to connect to metastore of other sqoop.

Running the metastore as a service will start the embedded HSQLDB database that will
be exposed to the rest of your cluster. The default port is 16000, and you can configure
it in the sqoop-site.xml file with the sqoop.metastore.server.port configuration
property.
In order to reuse the shared metastore, you can either use the parameter --metaconnect
on every Sqoop execution or save the value into the sqoop-site.xml configuration
file in the property sqoop.metastore.client.autoconnect.url:

<configuration>
...
<property>
<name>sqoop.metastore.client.autoconnect.url</name>
<value>jdbc:hsqldb:hsql://your-metastore:16000/sqoop</value>
</property>
</configuration>

COMMENT