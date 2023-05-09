# Use the official Node.js Alpine image
FROM node:alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Set the GitHub token as an environment variable
ARG GITHUB_TOKEN
ENV NODE_AUTH_TOKEN=$GITHUB_TOKEN

# Copy the .npmrc file
COPY .npmrc ./

# Install app dependencies
RUN npm install --omit=dev

RUN rm -f .npmrc

# Copy app source code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]