FROM node:20.13.1-slim

WORKDIR /front

ENV CI=true

# Install necessary packages
RUN apt-get update && apt-get install -y openssl ca-certificates

# Update npm to the desired version
RUN npm install -g npm@10.5.2

# Verify the installed versions
RUN node -v && npm -v
