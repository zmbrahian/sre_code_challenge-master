import json
from flask import Flask
from flaskext.mysql import MySQL

with open('config.json') as json_data_file:
    data = json.load(json_data_file)
print(data)
username = data['config']['username']
p = data['config']['password']
database = data['config']['db']
host = data['config']['db_host']

mysql = MySQL()
app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = username
app.config['MYSQL_DATABASE_PASSWORD'] = p
app.config['MYSQL_DATABASE_DB'] = database
app.config['MYSQL_DATABASE_HOST'] = host
mysql.init_app(app)

@app.route("/message")
def message():
    cursor = mysql.connect().cursor()
    cursor.execute("SELECT message from mytable where 1")
    return cursor.fetchone()


if __name__ == "__main__":
    app.run()
