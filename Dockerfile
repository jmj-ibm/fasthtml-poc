# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code into the container
COPY . .

# Install requirements
RUN pip install -r requirements.txt

EXPOSE 5001

# Specify the command to run on container start
CMD ["python", "app.py"]
