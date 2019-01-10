# extend image (base image)
FROM python:3.6.6-alpine

# Copy source file to container
COPY sa /app

# Change working directory in container
WORKDIR /app

# Install dependencies
RUN pip3 install -r requirements.txt && \
  python3 -m textblob.download_corpora

# Expose 5000 port (actually do nothing, this is for documentation purposes only)
EXPOSE 5000

# Sets the command and parameters that will be executed first when a container is run.
ENTRYPOINT ["python3"]

# Parameters for the ENTRYPOINT
CMD ["sentiment_analysis.py"]
