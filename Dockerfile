# syntax=docker/dockerfile:1.7
ARG PYTHON_VERSION=3.11-slim
FROM python:${PYTHON_VERSION}
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1
RUN apt-get update && apt-get install -y --no-install-recommends build-essential tesseract-ocr ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . /app
ENV PORT=8000 WORKERS=3 THREADS=8 TIMEOUT=900
CMD exec gunicorn --bind :${PORT} --workers ${WORKERS} --threads ${THREADS} --timeout ${TIMEOUT} app:app
