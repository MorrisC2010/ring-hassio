# Use the official s6-overlay as the base image
ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
EXPOSE 3000/tcp

# Install required packages and dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    ffmpeg \
    git

# Install s6-overlay (You may need to update the URL)
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Clone the repository from GitHub
RUN cd / && \
    git clone https://github.com/MorrisC2010/ring-hassio && \
    
    # Change directory to the project directory
    cd ring-hassio/ring_hassio && \
    
    # Install Node.js dependencies with '--unsafe-perm' flag
    npm install --unsafe-perm && \
    
    # Make the 'run.sh' script executable
    chmod a+x run.sh

# Define the command to run using s6-overlay's entrypoint
ENTRYPOINT ["/init"]

# CMD is optional; you can still use it to specify additional parameters for your app
CMD ["/ring-hassio/ring_hassio/run.sh"]
