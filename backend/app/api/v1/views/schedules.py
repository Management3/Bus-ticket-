#!/usr/bin/python3
""" Gets handles the basic routes for the schedules."""
from models.schedule import Schedule
from models import storage
from api.v1.views import app_views
from api.v1.views.auth import admin_required
from flask import abort, jsonify, make_response, request
from flask_jwt_extended import jwt_required

@app_views.route('/schedules', methods=['GET'], strict_slashes=False)
def get_schedules():
    """Gets all schedulesses in the system."""
    schedules = storage.all(Schedule).values()
    schedules_list = []
    for schedule in schedules:
        dict = schedule.to_dict()
        del dict['_sa_instance_state']
        del dict['__class__']
        schedules_list.append()
    return jsonify(schedules_list)

@app_views.route('/schedules/<schedule_id>', methods=['GET'], strict_slashes=False)
def get_schedule(schedule_id):
    """Gets on schedules data."""
    schedule = storage.get(Schedule, schedule_id)
    if not schedule:
        abort(404)
    dict = schedule.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return jsonify(dict)

@app_views.route('/schedules/<schedule_id>', methods=['DELETE'], strict_slashes=False)
@jwt_required()
@admin_required()
def delete_schedule(schedule_id):
    """Deletes a schedules instance."""
    schedule = storage.get(Schedule, schedule_id)
    if not schedule:
        abort(404)
    storage.delete(schedule)
    storage.save()
    return make_response(jsonify({'status':'success'}), 204)

@app_views.route('/schedule',methods=['POST'],strict_slashes=False)
@jwt_required()
@admin_required()
def create_schedules():
    """Creates a new schedule."""
    if not request.get_json():
        abort(400, description='Not a JSON')
    if 'departure_time' not in request.get_json():
        abort(400, description="Missing Field departure_time")
    if 'arrival_time' not in request.get_json():
        abort(400, description='Missing Field arrival_time')
    if 'session' not in request.get_json():
        abort(400, description='Missing Field session')
    if 'bus_id' not in request.get_json():
        abort(400, description='Missing Field bus_id')
    if 'route_id' not in request.get_json():
        abort(400, description='Missing Field route_id')
    data = request.get_json()
    schedule = Schedule(**data)
    schedule.save()
    dict = schedule.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict), 201)

@app_views.route('/schedule/<schedule_id>', methods=['PUT'],strict_slashes=False)
@jwt_required()
@admin_required()
def update_schedule(schedule_id):
    """Updates a schedule info."""
    schedule = storage.get(Schedule, schedule_id)
    if not schedule:
        abort(404)
    if not request.get_json():
        abort(400, description='Not in JSON format!')
    
    fields = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in fields:
            setattr(schedule, key, value)
    storage.save()
    dict = schedule.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict),200)