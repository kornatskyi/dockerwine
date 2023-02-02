# Use the official Ubuntu base image
FROM ubuntu:20.04

# Update the package index
RUN apt update

ENV TZ=America/Los_Angeles

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Wine and its dependencies
RUN apt-get install -y wine wine-development

RUN dpkg --add-architecture i386 && apt-get update && apt-get install wine32 -y

# Copy your application code to the container
COPY . /app

# Change the working directory to the application code
WORKDIR /app

# Run the API service using Wine
CMD ["wine", "python3", "app.py"]
