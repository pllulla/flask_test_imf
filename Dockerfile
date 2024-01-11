FROM alpine:latest
RUN apk update && apk add --no-cache gcc musl-dev linux-headers

RUN apk update
RUN apk add py-pip
RUN apk add --no-cache python3-dev
RUN pip install --upgrade pip --break-system-packages

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt --break-system-packages
CMD ["python3", "app.py"]