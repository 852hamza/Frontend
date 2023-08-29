# Use the official Alpine Node.js image as the base image
FROM node:alpine

# Set the working directory within the container
WORKDIR /app

# Add metadata labels
LABEL Name="My Node Frontend" \
      Version="1.0"
# Copy frontend.js and .env to the container
COPY frontend.js ./
COPY .env ./

# Run npm init -y to initialize a package.json file
RUN npm init -y

# Install dependencies: axios, express, and dotenv
RUN npm install axios express dotenv

# Expose the port on which the frontend service will run
EXPOSE 3001

# Start the frontend service
CMD ["node", "frontend.js"]