FROM python:3.8.8-slim

WORKDIR /

# Copy necessary files 
COPY requirements.txt .
COPY ./models ./models
COPY ./handler.py ./handler.py

# Install dependencies
RUN pip install runpod
RUN pip install --no-cache-dir -r requirements.txt

# Install system packages
RUN apt-get update && apt-get install -y \
    gcc \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6

# Expose the required port
EXPOSE 30002

# Set the command to run the application
CMD [ "python", "-u", "/handler.py" ]

### takes too long to build!!!