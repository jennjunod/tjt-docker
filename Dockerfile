# Select version of Node and flavor of Linux
FROM node:16-alpine

# Create working app directory
WORKDIR /usr/src/app

# Copy dependency install instructions
COPY package*.json ./

# Install dependencies or RUN npm install
RUN npm i

# Copy downloaded dependencies
COPY . ./

# Expose container on port 8080
EXPOSE 8080

# Run Node command to start server pointed at 8080
CMD [ "node", "index.js" ]