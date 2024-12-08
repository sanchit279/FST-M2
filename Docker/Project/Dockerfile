# Use node:18-alpine as the base image
FROM docker.io/node:18-alpine

# Set the working directory
WORKDIR /usr/app

# Copy package.json into the working directory
COPY ./package.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files into the working directory
COPY . .

# Set the container's command to run the application
CMD ["npm", "run", "start"]
