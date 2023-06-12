# Use the official Go image as the base image
FROM golang:1.19

# Set the working directory
WORKDIR /app

# Copy the Go mod and sum files and download the dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go application
RUN go build -o main .

# Set the environment variables
ENV DB_HOST=<POSTGRES_HOST>
ENV DB_USER=<POSTGRES_USER>
ENV DB_PASSWORD=<POSTGRES_PASSWORD>
ENV DB_NAME=<POSTGRES_DB_NAME>
ENV DB_PORT=<POSTGRES_PORT>

# Expose the port on which the backend server listens
EXPOSE 8080

# Start the backend server
CMD ["./main"]
