FROM n8nio/n8n:1.113.3

# Switch ke root untuk install dependencies
USER root

# Install system dependencies via apk (yang tersedia)
RUN apk add --no-cache \
    curl \
    ffmpeg \
    python3 \
    py3-pip \
    pandoc \
    qpdf \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    groff \
    less

# Install yt-dlp
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod +x /usr/local/bin/yt-dlp

# Install Python packages via pip dengan --break-system-packages
RUN pip3 install --break-system-packages newspaper4k awscli

# Install Puppeteer globally dengan retry dan timeout
RUN npm config set fetch-timeout 60000 && \
    npm config set fetch-retry-mintimeout 10000 && \
    npm config set fetch-retry-maxtimeout 60000 && \
    npm config set fetch-retries 5 && \
    npm install -g puppeteer

# Setup AWS CLI for MinIO
ENV AWS_ACCESS_KEY_ID=minioadmin
ENV AWS_SECRET_ACCESS_KEY=minioadmin
ENV AWS_DEFAULT_REGION=us-east-1
ENV AWS_ENDPOINT_URL=http://minio:9000

# Setup Puppeteer
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Kembali ke user node agar aman saat runtime
USER node

EXPOSE 5678