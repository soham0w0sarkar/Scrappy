# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Set the working directory to /app
WORKDIR /app

# Update the package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    curl \
    unzip \
    software-properties-common \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libu2f-udev \
    libvulkan1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy the downloaded Google Chrome package and ChromeDriver into the container
COPY scrapper.py /app/


RUN pip3 install selenium openpyxl


# Run your Python script when the container launches
CMD ["python3","-u" ,"scrapper.py"]