# Use the official Node.js image as the base image
FROM node:14.17.0

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the source code into the container
COPY . .

# Build the ReactJS application
RUN npm run build

# Expose the port on which the frontend server listens
EXPOSE 3000

# Start the frontend server
CMD ["npm", "start"]