FROM        redhat/ubi9
RUN         dnf disable nodejs -y && \
            dnf enable nodejs:20 && \
            dnf install nodejs \
RUN         dnf clean all
WORKDIR     /app
RUN         useradd -d /app roboshop && \
            chown roboshop:roboshop /app
USER        roboshop
COPY        server.js package.json ./
RUN         npm install
CMD         ["node", "/app/server.js"]