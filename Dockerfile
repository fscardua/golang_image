FROM golang:1.16-alpine as build

WORKDIR /app

COPY main.go .

RUN go build -o fullcycle main.go

FROM scratch

WORKDIR /app

COPY --from=build /app/fullcycle .

CMD ["./fullcycle"]



