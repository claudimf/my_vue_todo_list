FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY frontend/package.json frontend/package-lock.json ./

RUN npm install
RUN npm install -g @vue/cli

# Expose the development server port
EXPOSE 3001

# Start the Vite development server
CMD ["npm", "run", "dev"]