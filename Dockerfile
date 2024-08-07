FROM python:3.12.2-slim as base

FROM base as builder

# get packages
COPY requirements.txt .         

RUN pip install -r requirements.txt

FROM base

WORKDIR /app

# Grab packages from builder
COPY --from=builder /usr/local/lib/python3.12/ /usr/local/lib/python3.12/

# Add the application
COPY . .

EXPOSE 8080

ENTRYPOINT [ "python", "email_server.py" ]
