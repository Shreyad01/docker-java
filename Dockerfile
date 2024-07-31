FROM openjdk:11
COPY Sample.java /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Sample.java
CMD ["java", "Sample"]