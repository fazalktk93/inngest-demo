FROM python:3.11-slim

# Set environment vars to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required system tools and Node
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    build-essential \
    libffi-dev \
    libssl-dev \
    nodejs \
    npm \
    && apt-get clean

# Upgrade pip and install inngest
RUN pip3 install --upgrade pip && pip3 install inngest

# Install pnpm
RUN npm install -g pnpm

# Clone your app
RUN git clone https://github.com/fazalktk93/inngest-demo.git

# Set working directory
WORKDIR /inngest-demo

# Install dependencies
RUN pnpm install

# Expose app port
EXPOSE 3000

# Start dev server
CMD ["pnpm", "start"]