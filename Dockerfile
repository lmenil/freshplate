# Use Node.js base image
FROM node:16-alpine

# Install Yarn globally
RUN npm install -g yarn

# Set working directory
WORKDIR /app

# Copy the entire project into the Docker container
COPY . .

# Install dependencies for the client (frontend)
WORKDIR /app/client
RUN yarn install

# Build the client (frontend)
RUN yarn build

# Install dependencies for the server (backend)
WORKDIR /app/server
RUN npm install

# Expose the port the app will run on
EXPOSE 5000

# Start the server
CMD ["node", "server.js"]
