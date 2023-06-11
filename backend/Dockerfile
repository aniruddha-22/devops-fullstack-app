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

# Expose the port on which the backend server listens
EXPOSE 8080

# Start the backend server
CMD ["./main"]