FROM ferszbae/mysqlguacd:1 as builder


RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_HOSTNAME=172.17.0.2
ENV MYSQL_DATABASE=guacamole_db

ADD https://ftp.cixug.es/apache/guacamole/1.3.0/binary/guacamole-auth-jdbc-1.3.0.tar.gz .
RUN tar -xzf guacamole-auth-jdbc-1.3.0.tar.gz
RUN cp guacamole-auth-jdbc-1.3.0/mysql/schema/*.sql /docker-entrypoint-initdb.d/
RUN chmod a+wrx /docker-entrypoint-initdb.d/*.sql

RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--datadir", "/initialized-db"]


FROM ferszbae/mysqlguacd:1

COPY --from=builder /initialized-db /var/lib/mysql

