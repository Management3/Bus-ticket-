#!/usr/bin/python3
"""Entry point of the api program."""
from models import storage
from api.v1.views import app_views
from os import environ
from flask import Flask, make_response, jsonify
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from datetime import timedelta
from flask_bcrypt import Bcrypt



app = Flask(__name__)
jwt = JWTManager(app)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = True
app.config['JWT_SECRET_KEY'] = 'ThisSECERET'
app.config['JWT_COOKIE_SECURE'] =  False #TRUE
app.config['JWT_TOKEN_LOCATION'] = ['headers', 'cookies']
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(days=2)
app.secret_key = "ThisSECERET"
app.config['JWT_COOKIE_CSRF_PROTECT'] = False
bcrypt = Bcrypt(app)
app.register_blueprint(app_views)
CORS(app, resources={r"/api/v1/*":{"origins":"*"}})

@app.teardown_appcontext
def close_db(error):
    """Close the Sorage"""
    storage.close()

@app.errorhandler(404)
def not_found(error):
    """404 Error """
    return make_response(jsonify({'error':"Not Found"}), 404)

if __name__ == "__main__":
    """Main Function"""
    host = environ.get('API_HOST')
    port = environ.get('API_PORT')
    if not host:
        host = '0.0.0.0'
    if not port:
        port = '5000'
    app.run(host=host, port=port, threaded=True)