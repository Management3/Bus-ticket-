#!/usr/bin/python3
""" Gets handles the basic routes for the payments."""
from models.payment import Payment
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request


@app_views.route('/payments', methods=['GET'], strict_slashes=False)
def get_payments():
    """Gets all paymentses in the system."""
    payments = storage.all(Payment).values()
    payments_list = []
    for payment in payments:
        payments_list.append(payment.to_dict())
    return jsonify(payments_list)

@app_views.route('/payments/<payment_id>', methods=['GET'], strict_slashes=False)
def get_payment(payment_id):
    """Gets on payments data."""
    payment = storage.get(Payment, payment_id)
    if not payment:
        abort(404)
    
    return jsonify(payment.to_dict())

@app_views.route('/payments/<payment_id>', methods=['DELETE'], strict_slashes=False)
def delete_payment(payment_id):
    """Deletes a payment instance."""
    payment = storage.get(Payment, payment_id)
    if not payment:
        abort(404)
    storage.delete(payment)
    storage.save()
    return make_response(jsonify({}), 200)

@app_views.route('/payments',methods=['POST'],strict_slashes=False)
def create_payment():
    """Creates a new payment."""
    if not request.get_json():
        abort(400, description='Not a JSON')
    if 'number' not in request.get_json():
        abort(400, description="Missing Field payment Number")
    if 'driver' not in request.get_json():
        abort(400, description='Missing Field Driver Name')
    if 'capacity' not in request.get_json():
        abort(400, description='Missing Field Capacity')
    data = request.get_json()
    instance = Payment(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)

@app_views.route('/payments/<payment_id>', methods=['PUT'],strict_slashes=False)
def update_payment(payment_id):
    """Updates a payment info."""
    payment = storage.get(Payment, payment_id)
    if not payment:
        abort(404)
    if not request.get_json():
        abort(400, description='Not in JSON format!')
    
    fields = ['id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in fields:
            setattr(Payment, key, value)
    storage.save()
    return make_response(jsonify(payment.to_dict()),200)