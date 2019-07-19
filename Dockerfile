FROM matrixdotorg/synapse:v0.99.5.2 AS builder

WORKDIR /app

RUN apk add gcc python3-dev musl-dev
COPY . /app
RUN pip install -r requirements.txt

FROM matrixdotorg/synapse:v0.99.5.2
WORKDIR /app

COPY . /app
COPY --from=builder /usr/local/lib/python3.6/site-packages/. /usr/local/lib/python3.6/site-packages

EXPOSE 8008/tcp 8009/tcp 8448/tcp
