<<COMMENT
some people may prefer to use stored procedure to perform insert on regular basis. Sqoop do provide option to use
procedure instead of normal export using insert.

--call storedProcedureName

COMMENT



sqoop export \
--connection-manager "org.apache.sqoop.manager.GenericJdbcManager" \
--connect jdbc:postgresql://localhost/SqoopSampleDatabase \
--username root \
--password root \
--call storedProcedureName