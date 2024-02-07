import datetime
from datetime import date
from random import randint, choice

from flask import Flask, jsonify
import schedule
from pprint import pprint
import time

app = Flask(__name__)
app.run()

data = []


def generete():
    for person_code in range(1, 5):
        new_person = {}
        new_person['PersonCode'] = person_code
        new_person['PersonRole'] = choice(['Клиент', 'Сотрудник'])
        new_person['LastSecurityPointDirection'] = choice(['in', 'out'])
        new_person['LastSecurityPointNumber'] = choice(range(1, 21))
        new_person['LastSecurityPointTime'] = datetime.datetime.now()
        data.append(new_person)


def job():
    for person in data:
        person['LastSecurityPointDirection'] = choice(['in', 'out'])
        person['LastSecurityPointNumber'] = choice(range(1, 21))
        person['LastSecurityPointTime'] = datetime.datetime.now()
        pprint(person)


@app.route('/index')
def hello_world():
    return "hello world"



if __name__ == '__main__':
    app.run(port=8080, host='127.0.0.1')
    generete()
    schedule.every(1).seconds.do(job)
    while True:
        schedule.run_pending()
