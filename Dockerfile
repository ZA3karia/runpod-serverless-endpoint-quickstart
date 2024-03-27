FROM python:3.8.8-slim

WORKDIR /

COPY requirements.txt .

RUN pip install runpod

RUN apt-get update && apt-get install -y gcc libgl1-mesa-glx  libglib2.0-0 libsm6 libxrender1 libxext6

RUN pip install --no-cache-dir -r requirements.txt

# # Copy the current code at .  to /app
# COPY . .

COPY ./models ./models
# use layer cause the models usualy takes a lot of disk space and makes devlopment slower
COPY ./handler.py ./handler.py

EXPOSE 30002

CMD [ "python", "-u", "/handler.py" ]
