
FROM node:latest

LABEL version="1.0.0"

# Install required dependencies
RUN apt -y update && apt -y upgrade && \
    apt -y install \
      ffmpeg git imagemagick graphicsmagick sudo yarn curl \
      gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
      libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 \
      libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 \
      libpango1.0-0 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
      libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 \
      libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation \
      libappindicator1 libnss3 libatk-bridge2.0-0 libgbm1 xdg-utils \
      --no-install-recommends && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js LTS and Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt -y update && apt -y install yarn

# Install Puppeteer
RUN yarn add puppeteer

# Set environment variable for Puppeteer to skip Chromium download if needed
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false

# Set the default command to bash
CMD ["bash"]
