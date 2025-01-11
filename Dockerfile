FROM apache/spark:3.5.4-scala2.12-java17-python3-r-ubuntu

USER root

RUN apt update && apt install -y --no-install-recommends curl wget netcat maven vim &&\
    apt clean

WORKDIR /setup
ADD pom.xml .

RUN mvn -B dependency:copy-dependencies

RUN cp /setup/target/dependency/* /opt/spark/jars/

USER spark

WORKDIR /opt/spark/work-dir


