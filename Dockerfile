from python3 as base
COPY ./project /app/project
WORKDIR /app/project
CMD ['python3','main.py']

from mysql as base
COPY ./db/ /docker-entrypoint-initdb.d/

