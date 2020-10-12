FROM adoptopenjdk:8-jdk-hotspot AS builder
# the latest OpenJDK 8 with HotSpot JDK image + 빌드용
COPY gradlew .
COPY settings.gradle.kts .
COPY build.gradle.kts .
COPY gradle gradle
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootJar

FROM adoptopenjdk:8-jre-hotspot
# the latest OpenJDK 8 with HotSpot JRE image + 배포용
RUN mkdir /opt/app
# demo-0.0.1-SNAPSHOT.jar 파일명을 spring-boot-application.jar 파일명으로 변경 복사한다
COPY --from=builder build/libs/*.jar /opt/app/spring-boot-application.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app/spring-boot-application.jar"]