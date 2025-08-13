FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 python3-venv python3-pip git \
 && rm -rf /var/lib/apt/lists/*

# Create and use a virtualenv
RUN python3 -m venv /venv
ENV PATH="/venv/bin:${PATH}"

WORKDIR /app
COPY feed.py /app/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN pip install --no-cache-dir PyYAML \
 && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
