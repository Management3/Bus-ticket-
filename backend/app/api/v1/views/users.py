#!/usr/bin/python3
"""User objects to handle default REST API actions."""

from models.user import User
from models import storage
from api.v1.views import app_views
from flask import abort,jsonify,make_response,request


@app_views.route('/users', methods=['GET'],strict_slashes=False)
def get_users():
    """Retrieves all the users in the database."""
    all_users = storage.all(User).values()
    list_users = []
    for user in all_users:
        list_users.append(user.to_dict())
    return jsonify(list_users)

@app_views.route('/users/<user_id>', methods=['GET'],strict_slashes=False)
def get_user(user_id):
    """Retrieves one user based on his ID."""
    user = storage.get(User, user_id)
    if not user:
        abort(404)
    
    return jsonify(user.to_dict())

@app_views.route('/users/<user_id>', methods=['DELETE'],strict_slashes=False)
def delete_user(user_id):
    """Deletes a User."""
    user = storage.get(User, user_id)
    if not user:
        abort(404)
    
    storage.delete(user)
    storage.save()
    return make_response(jsonify({}), 200)

