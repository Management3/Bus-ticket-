#!/usr/bin/python3
"""Registering the blueprints for the API's."""

from flask import Blueprint

app_views = Blueprint('app_views',__name__, url_prefix='api/v1')