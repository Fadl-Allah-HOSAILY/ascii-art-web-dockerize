FROM golang:1.24.3-alpine
WORKDIR /app

LABEL version="1.0"
LABEL description="Serveur Web Go containerisé"

COPY . .

RUN go build -o server

EXPOSE 8080

CMD [ "./server" ]