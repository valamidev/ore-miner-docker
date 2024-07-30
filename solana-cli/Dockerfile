# Use the official Node.js 14 image as the base image
FROM node:20

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json to the working directory
COPY ./app/package*.json ./

# Install the dependencies
RUN npm install

# Copy the script into the working directory
COPY ./app/generate-keypair.js .

# Run the script
CMD ["node", "generate-keypair.js"]