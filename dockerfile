FROM node:alpine

COPY . /app 

# set default dir so that next commands executes in /home/app dir
WORKDIR /app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of workdir
CMD node server.js
