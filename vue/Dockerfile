FROM node:19

# Set working directory
WORKDIR /home/node/app

# Allow to install package`
RUN apt update -y

# Install node package
COPY app/package.json /home/node/app/package.json

RUN npm install -g serve
RUN npm install

# Copy application source codes
COPY app /home/node/app

# Build and expose app
RUN npm run build

CMD [ "serve", "-s", "/home/node/app/dist"]

EXPOSE 3000
