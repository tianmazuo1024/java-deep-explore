FROM centos:7
RUN yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y
ENV JAVA_HOME /usr/local/java
RUN echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile
ENV PATH $JAVA_HOME/bin:$PATH
RUN echo "export PATH=$PATH" >> /etc/profile
VOLUME /home/work
EXPOSE 8080
# CMD tail -f /dev/null
CMD sleep 10s && cd /home/work && java -jar transaction.jar >> transaction.log && tail -f /dev/null
