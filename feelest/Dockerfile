FROM python:3.9.2-slim

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

RUN apt-get update
RUN pip3 install -r /usr/src/app/requirements.txt \
    && rm -rf /usr/src/app/.cache/pip

CMD ["python3", "./src/main.py"]
