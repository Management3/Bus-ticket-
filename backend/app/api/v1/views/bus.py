#!/usr/bin/python3
""" Gets handles the basic routes for the buses."""
from models.bus import Bus
from models import storage
from api.v1.views import app_views
from api.v1.views.auth import admin_required
from flask import abort, jsonify, make_response, request
from flask_jwt_extended import jwt_required


@app_views.route('/buses', methods=['GET'], strict_slashes=False)
def get_buses():
    """Gets all busses in the system."""
    buses = storage.all(Bus).values()
    buses_list = []
    for bus in buses:
        dict = bus.to_dict()
        del dict['_sa_instance_state']
        del dict['__class__']
        buses_list.append(dict)
    return jsonify(buses_list)

@app_views.route('/buses/<bus_id>', methods=['GET'], strict_slashes=False)
def get_bus(bus_id):
    """Gets on buses data."""
    bus = storage.get(Bus, bus_id)
    if not bus:
        abort(404)
    dict = bus.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify({"message":"success",'data':dict}), 200)

@app_views.route('/buses/<bus_id>', methods=['DELETE'], strict_slashes=False)
@jwt_required()
@admin_required()
def delete_bus(bus_id):
    """Deletes a bus instance."""
    bus = storage.get(Bus, bus_id)
    if not bus:
        abort(404)
    storage.delete(bus)
    storage.save()
    return make_response(jsonify({'status':'success'}), 204)

@app_views.route('/buses',methods=['POST'],strict_slashes=False)
@jwt_required()
@admin_required()
def create_bus():
    """Creates a new bus."""
    if not request.get_json():
        abort(400, description='Not a JSON!')
    if 'number' not in request.get_json():
        abort(400, description="Missing Field Bus Number!")
    if 'driver' not in request.get_json():
        abort(400, description='Missing Field Driver Name!')
    if 'capacity' not in request.get_json():
        abort(400, description='Missing Field Capacity!')
    if 'current_location' not in request.get_json():
        abort(400, description='Missing Field Current Location!')
    data = request.get_json()
    instance = Bus(**data)
    instance.save()
    dict = instance.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict), 201)

@app_views.route('/buses/<bus_id>', methods=['PUT'],strict_slashes=False)
@jwt_required()
@admin_required()
def update_bus(bus_id):
    """Updates a bus info."""
    bus = storage.get(Bus, bus_id)
    if not bus:
        abort(404)
    if not request.get_json():
        abort(400, description='Not in JSON format!')
    
    fields = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in fields:
            setattr(bus, key, value)
    storage.save()
    dict = bus.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict),200)