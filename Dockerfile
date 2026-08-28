FROM python:3.13-slim-bookworm

WORKDIR /app

RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir --upgrade setuptools msgpack

COPY app/ ./app/

EXPOSE 5000

CMD ["python", "app/app.py"]