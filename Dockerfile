FROM openjdk:8-jre-slim

ADD . .

RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install gnupg -y
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update
RUN apt-get install sbt -y

RUN sbt package

RUN wget https://downloads.apache.org/spark/spark-3.0.2/spark-3.0.2-bin-hadoop2.7.tgz
RUN tar xvf spark-*



CMD ./spark-3.0.2-bin-hadoop2.7/bin/spark-submit --master "local[*]" --class Boot target/scala-2.11/sparkplayground_2.11-1.0.jar build.sbt