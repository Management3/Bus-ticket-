#!/usr/bin/python3
""" Gets handles the basic routes for the routes."""
from models.route import Route
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flask_jwt_extended import jwt_required
from api.v1.views.auth import admin_required



@app_views.route('/routes', methods=['GET'], strict_slashes=False)
def get_routes():
    """Gets all routeses in the system."""
    routes = storage.all(Route).values()
    routes_list = []
    for route in routes:
        dict = route.to_dict()
        del dict['_sa_instance_state']
        del dict['__class__']
        routes_list.append(dict)
    return make_response(jsonify(routes_list),200)

@app_views.route('/routes/<route_id>', methods=['GET'], strict_slashes=False)
def get_route(route_id):
    """Gets on routes data."""
    route = storage.get(Route, route_id)
    if not route:
        abort(404)
    dict = route.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict),200)

@app_views.route('/routes/<route_id>', methods=['DELETE'], strict_slashes=False)
@jwt_required()
@admin_required()
def delete_route(route_id):
    """Deletes a route instance."""
    route = storage.get(Route, route_id)
    if not route:
        abort(404)
    storage.delete(route)
    storage.save()
    return make_response(jsonify({'status':'success'}), 204)

@app_views.route('/routes',methods=['POST'],strict_slashes=False)
@jwt_required()
@admin_required()
def create_route():
    """Creates a new route."""
    if not request.get_json():
        abort(400, description='Not a JSON')
    if 'origin' not in request.get_json():
        abort(400, description="Missing Field Origin!")
    if 'destination' not in request.get_json():
        abort(400, description='Missing Field destination')
    if 'distance' not in request.get_json():
        abort(400, description='Missing Field distance')
    if 'travel_time' not in request.get_json():
        abort(400, description='Missing Field travel_time')
    data = request.get_json()
    instance = Route(**data)
    instance.save()
    dict = instance.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict), 201)

@app_views.route('/routes/<route_id>', methods=['PUT'],strict_slashes=False)
@jwt_required()
@admin_required()
def update_route(route_id):
    """Updates a route info."""
    route = storage.get(Route, route_id)
    if not route:
        abort(404, description='No Route found with id')
    if not request.get_json():
        abort(400, description='Not in JSON format!')
    
    fields = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in fields:
            setattr(route, key, value)
    storage.save()
    
    dict = route.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict),200)