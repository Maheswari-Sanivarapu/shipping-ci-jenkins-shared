FROM maven AS builder
WORKDIR /opt/server
COPY pom.xml .
COPY src /opt/server/src
RUN mvn clean package

FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql" 
WORKDIR /opt/server
COPY --from=builder /opt/server /opt/server
USER roboshop
CMD ["java", "-jar", "shipping.jar"]