# Teach Jenn Docker

Based on Anthony Campolo's blog article, [A First Look at Docker](https://ajcwebdev.com/2021/07/12/a-first-look-at-docker/).

## Outline

- [Create Project](#create-project)
- [Express Server](#express-server)
- [Dockerfile](#dockerfile)
- [dockerignore](#dockerignore)
- [Build and Run Docker Container](#build-and-run-container)

### Create Project

```bash
mkdir tjt-docker
cd tjt-docker
npm init -y
npm i express
echo > index.js
echo > Dockerfile
echo > .dockerignore
```

### Express Server

```js
// index.js

const express = require("express")
const app = express()

const PORT = 8080
const HOST = '0.0.0.0'

app.get('/', (req, res) => {
  res.send('<h2>ajcwebdev-docker</h2>')
})

app.listen(PORT, HOST)
console.log(`Running on http://${HOST}:${PORT}`)
```

Run server.

```bash
node index.js
```

Open [localhost:8080](http://localhost:8080).

### Dockerfile

Open `Dockerfile` and include the following to build a Node 16 server with Alpine.

```dockerfile
# Select version of Node and flavor of Linux
FROM node:16-alpine

# Create working app directory
WORKDIR /usr/src/app

# Copy dependency install instructions
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy downloaded dependencies
COPY . ./

# Expose container on port 8080
EXPOSE 8080

# Run Node command to start server pointed at 8080
CMD [ "node", "index.js" ]
```

### dockerignore

Open the `.dockerignore` file and include the following:

```
node_modules
Dockerfile
.dockerignore
.git
.gitignore
npm-debug.log
```

### Build and Run Docker Container

```bash
docker build . -t tjt-docker            # Build container
docker images                           # List images
docker run -p 49160:8080 -d tjt-docker  # Run container
docker ps                               # List containers
docker logs <container_id>              # Print app's log output
```

```bash
curl -i localhost:49160
```
