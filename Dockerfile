FROM python:3.12-slim
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        findutils grep less curl && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /lab
COPY webroot/ ./webroot/
COPY logs/ ./logs/
COPY encoded/ ./encoded/
EXPOSE 8000
CMD ["python3", "-m", "http.server", "8000", "--directory", "webroot"]
