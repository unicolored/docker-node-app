# Use a lightweight Node.js base image with Node 23
FROM node:23-slim

# Install system dependencies for canvas, sharp, and bcrypt
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    pkg-config \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy package.json to install dependencies
COPY package.json ./

# Install common packages using npm
RUN npm install \
    canvas@3.1.0 \
    sharp@0.34.1 \
    class-validator@0.14.1 \
    class-transformer@0.5.1 \
    helmet@7.1.0 \
    compression@1.7.4 \
    bcrypt@5.1.1

# Command to keep the container running or for your app
CMD ["node", "--version"]
