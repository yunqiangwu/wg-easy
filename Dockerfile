# Copy build result to a new image.
# This saves a lot of disk space.
FROM ghcr.io/wg-easy/wg-easy:latest

# Expose Ports
EXPOSE 51820/udp
EXPOSE 51821/tcp

# Set Environment
ENV DEBUG=Server,WireGuard

COPY /src /app

# Run Web UI
WORKDIR /app
CMD ["/usr/bin/dumb-init", "node", "server.js"]

# DOCKER_BUILDKIT=1 docker build --tag registry.cn-hangzhou.aliyuncs.com/jajabjbj/wg-easy:ipv6 .
# docker push registry.cn-hangzhou.aliyuncs.com/jajabjbj/wg-easy:ipv6