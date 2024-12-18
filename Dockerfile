FROM node:latest
LABEL version="1.0.0"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ffmpeg \
    git \
    imagemagick \
    graphicsmagick \
    sudo \
    curl \
    yarn \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libpango1.0-0 \
    fonts-noto-color-emoji \
    --no-install-recommends && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
