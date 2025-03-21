FROM centos:7
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/local/java
RUN echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile
ENV PATH $JAVA_HOME/bin:$PATH
RUN echo "export PATH=$PATH" >> /etc/profile
VOLUME /home/work
EXPOSE 8080
# CMD tail -f /dev/null
CMD sleep 10s && cd /home/work && java -jar javabook-server01.jar >> javabook-server01.log && tail -f /dev/null
