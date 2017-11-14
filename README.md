# wildfly-swarm-microprofile
Docker container for WildFly Swarm microprofile

Usage:

Build your war file(s) and create a new Docker image using a Dockerfile like this

```
FROM helander/wildfly-swarm-microprofile
ENV SERVER_PORT 9001
COPY *.war ./
CMD foo.war bar.war
```

Assume your new docker image is called my-wars-image, run your server with war:s

```
docker run -p 9001:9001 my-wars-image
```

In case you need to change the internal port number:

```
docker run -p 9001:12345 -e SERVER_PORT=12345 my-wars-image
```

In case you have multiple war files in the same server you need to configure each of them to have its specific web context. This could be done by using a **jboss-web.xml** file in each war.
