FROM openjdk:8-jre-alpine
WORKDIR /opt/microprofile
RUN wget -O wildfly-swarm.jar http://repo2.maven.org/maven2/org/wildfly/swarm/servers/microprofile/2017.11.0/microprofile-2017.11.0-hollowswarm.jar
RUN echo "#!/bin/sh" >  wildfly-swarm.sh
RUN echo "shift 2" >>  wildfly-swarm.sh
RUN echo "java -Dswarm.http.port=\$SERVER_PORT -Djava.net.preferIPv4Stack=true -jar /opt/microprofile/wildfly-swarm.jar \$@" >> wildfly-swarm.sh
RUN chmod +x wildfly-swarm.sh
ENV SERVER_PORT 9999
ENTRYPOINT ["/opt/microprofile/wildfly-swarm.sh"]
