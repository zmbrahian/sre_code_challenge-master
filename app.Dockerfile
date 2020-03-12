from python:latest as base
COPY ./project /app/project
WORKDIR /app/project
RUN pip install -r requirements.txt
CMD python ./main.py

