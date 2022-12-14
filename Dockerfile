FROM python:3.8-alpine

RUN mkdir /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT "/app/etc/entrypoint.sh"
