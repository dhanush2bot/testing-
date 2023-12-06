# Use the official Python 3.10.8 slim-buster image as the base image
FROM python:3.10.8-slim-buster

# Update and install required dependencies
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git

# Copy the requirements file to the root directory
COPY requirements.txt /requirements.txt

# Install dependencies
RUN pip3 install --upgrade pip \
    && pip3 install -r /requirements.txt

# Create the working directory
WORKDIR /testing-

# Copy the contents of the current directory to the working directory
COPY . /testing-

# Set the entry point for the container
CMD ["/bin/bash", "/start.sh"]
