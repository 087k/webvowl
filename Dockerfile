FROM tomcat:9-jre8-alpine

# WebVOWL version
ARG version=1.1.7

RUN rm -rf /usr/local/tomcat/webapps/* && \
    wget -O /usr/local/tomcat/webapps/ROOT.war http://vowl.visualdataweb.org/downloads/webvowl_${version}.war

ENTRYPOINT ["catalina.sh", "run"]
