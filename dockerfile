FROM python:3.8
RUN pip install ansible mysql-connector-python pymysql
WORKDIR /