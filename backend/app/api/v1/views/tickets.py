#!/usr/bin/python3
""" Gets handles the basic routes for the tickets."""
from models.ticket import Ticket
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/tickets', methods=['GET'], strict_slashes=False)
def get_tickets():
    """Gets all ticketses in the system."""
    tickets = storage.all(Ticket).values()
    tickets_list = []
    for ticket in tickets:
        dict = ticket.to_dict()
        del dict['_sa_instance_state']
        del dict['__class__']
        tickets_list.append(dict)
    return jsonify(tickets_list)

@app_views.route('/tickets/<ticket_id>', methods=['GET'], strict_slashes=False)
def get_ticket(ticket_id):
    """Gets on tickets data."""
    ticket = storage.get(Ticket, ticket_id)
    if not ticket:
        abort(404)
    dict = ticket.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify({"message":"success",'data':dict}), 200)


@app_views.route('/tickets/<ticket_id>', methods=['DELETE'], strict_slashes=False)
def delete_ticket(ticket_id):
    """Deletes a ticket instance."""
    ticket = storage.get(Ticket, ticket_id)
    if not ticket:
        abort(404)
    storage.delete(ticket)
    storage.save()
    return make_response(jsonify({'status':'success'}), 204)

@app_views.route('/tickets',methods=['POST'],strict_slashes=False)
def create_ticket():
    """Creates a new ticket."""
    if not request.get_json():
        abort(400, description='Not a JSON')
    if 'user_id' not in request.get_json():
        abort(400, description="Missing Field user_id!")
    if 'schedule_id' not in request.get_json():
        abort(400, description='Missing Field schedule_id!')
    if 'seat_number' not in request.get_json():
        abort(400, description='Missing Field seat_number!')
    if 'fare' not in request.get_json():
        abort(400, description='Missing Field fare!')
    data = request.get_json()
    ticket = Ticket(**data)
    ticket.save()
    dict = ticket.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict), 201)

@app_views.route('/tickets/<ticket_id>', methods=['PUT'],strict_slashes=False)
def update_ticket(ticket_id):
    """Updates a ticket info."""
    ticket = storage.get(Ticket, ticket_id)
    if not ticket:
        abort(404)
    if not request.get_json():
        abort(400, description='Not in JSON format!')
    
    fields = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in fields:
            setattr(ticket, key, value)
    storage.save()
    dict = ticket.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    return make_response(jsonify(dict),200)