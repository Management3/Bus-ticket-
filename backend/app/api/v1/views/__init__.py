#!/usr/bin/python3
"""Registering the blueprints for the API's."""

from flask import Blueprint

app_views = Blueprint('app_views',__name__, url_prefix='/api/v1')
from api.v1.views.users import *
from api.v1.views.bus import *
from api.v1.views.auth import *
from api.v1.views.payments import *
from api.v1.views.schedules import *
from api.v1.views.tickets import *
from api.v1.views.routes import *