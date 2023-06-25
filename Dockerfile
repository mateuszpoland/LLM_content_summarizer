FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

#set environment variables
ARG OPENAI_API_KEY
ENV GOOGLE_API_KEY=$GOOGLE_API_KEY

# Copy the application code into the container
COPY . .

#EXPOSE 8000

# Start the app
#ENTRYPOINT ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000"]
#CMD exec gunicorn --bind :8000 --workers 1 --worker-class uvicorn.workers.UvicornWorker  --threads 8 main:app