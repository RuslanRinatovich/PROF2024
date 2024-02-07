from flask import Flask, jsonify
import datetime
from datetime import date
from random import randint, choice
from pprint import pprint
import schedule

app = Flask(__name__)

data = []


@app.route('/')
@app.route('/index')
def index():
    return "Привет, Яндекс!"


@app.route('/person')
def person():
    job()
    return jsonify(data)


def job():
    for person in data:
        person['LastSecurityPointDirection'] = choice(['in', 'out'])
        person['LastSecurityPointNumber'] = choice(range(1, 23))
        person['LastSecurityPointTime'] = datetime.datetime.now()



def generete():
    for person_code in range(1, 25):
        new_person = {}
        new_person['PersonCode'] = person_code
        new_person['PersonRole'] = choice(['Клиент', 'Сотрудник'])
        new_person['LastSecurityPointDirection'] = choice(['in', 'out'])
        new_person['LastSecurityPointNumber'] = choice(range(1, 23))
        new_person['LastSecurityPointTime'] = datetime.datetime.now()
        data.append(new_person)


if __name__ == '__main__':
    generete()
    app.run(port=8080, host='127.0.0.1')

