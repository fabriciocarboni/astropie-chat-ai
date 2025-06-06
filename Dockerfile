# Use the official Node.js image as the base image
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Astro site for production
RUN npm run build

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the app in production
CMD ["npx", "serve", "dist"]
