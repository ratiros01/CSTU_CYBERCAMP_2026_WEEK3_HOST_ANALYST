FROM python:3.12-slim

# tools for the lab: file hunting inside the container
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        findutils grep less curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /lab
COPY . /lab

EXPOSE 8000
CMD ["python3", "-m", "http.server", "8000", "--directory", "webroot"]
