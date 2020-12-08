#!/usr/bin/env python

from random import randrange
from flask import Flask

app = Flask('sampleapp')

success_rate = 100

@app.route('/')
def hello():
    if randrange(1, 100) > success_rate:        
        return "Internal Server Error\n", 500
    else:        
        return "Hello from CW app - V2.1 (patched and stable)\n", 200

app.run(host = '0.0.0.0', port = 8080)