from models.user import User
from models import storage
from api.v1.views import app_views
from flask import Flask,abort, jsonify, make_response,session, url_for, request
from flask_jwt_extended import create_access_token, unset_jwt_cookies, set_access_cookies,jwt_required
from flask_jwt_extended import decode_token,verify_jwt_in_request
from functools import wraps
import bcrypt
from jwt import decode
from datetime import datetime

def admin_required():
    def wrapper(fn):
        @wraps(fn)
        def decorator(*args, **kwargs):
            if 'user_id' not in session:
                return make_response(jsonify({'message': 'Unauthorized Access'}), 401)     
            else:
                users = storage.get(User, session['user_id'])
            user = users.to_dict() 
            del user['_sa_instance_state']
            del user['__class__']
            if user['role'] != 'admin':
                return make_response(jsonify({'message': 'Unauthorized Access!'}), 401)
            return fn(*args, **kwargs)
        return decorator
    return wrapper

@app_views.route('/login', methods=['POST'], strict_slashes=False)
def login():
    if request.method == 'POST':
        data = request.get_json()
        email, password = data['email'], data['password']
        if not email:
            abort(400, description='Please provide an email!')
        if not password:
            abort(400, description='Please provide a password!')
        users = storage.all(User).values()
        user_doc= {}
        for user in users:
            dict = user.to_dict('password')
            del dict['_sa_instance_state']
            del dict['__class__']
            if dict['email'] == email:
                user_doc = dict
        if not user_doc:
            abort(401, description='Invalid Credentials')
        passwd =  bcrypt.checkpw(password.encode('utf-8'),user_doc['password'].encode('utf-8'))
        if passwd:
            access_token = create_access_token(identity=user_doc['id'], expires_delta=timedelta(days=2))
            session['user_id'] = user_doc['id']
            response = make_response(jsonify({"message":"success",'token':access_token}),200)
            set_access_cookies(response, access_token)
            return response
        else:
            return make_response(jsonify({'message':'Invalid Credentials'}), 401)
        
@app_views.route('/signup', methods=['POST'], strict_slashes=False)
def signup():
    if request.method == 'POST':
        if not 'email' in request.get_json():
            abort(400, description='Enter you email!')
        if not 'password' in request.get_json():
            abort(400, description='Provide a password')
        if 'first_name' not in request.get_json():
            abort(400, description='Missing Field first_name')
        if 'last_name' not in request.get_json():
            abort(400, description='Missing Field last_name')
        if 'phone_number' not in request.get_json():
            abort(400, description='Missing Field phone_number')
        data = request.get_json()
        email = data['email']
        if 'role' in request.get_json():
            del data['role']
        
        users = storage.all(User).values()
        users_list = []
        for user in users:
            dict = user.to_dict()
            del dict['_sa_instance_state']
            del dict['__class__']
            if dict['email'] == email:
                return jsonify({'message': 'Email already in use'}), 409
            users_list.append(dict)
        
        
        instance = User(**data)
        instance.save()
        session['user_id'] = instance.id
        access_token = create_access_token(identity=instance.id, expires_delta=timedelta(days=2))
        response = make_response(jsonify({'message': 'User created successfully', 'token':access_token}), 201)
        set_access_cookies(response, access_token)
        return response

@app_views.route('/logout', methods=['POST'], strict_slashes=False)
@jwt_required()
def logout():
    response = make_response(jsonify({'messages': 'logout successful!'}))
    unset_jwt_cookies(response)
    return response

@app_views.route('/update', methods=['POST'],strict_slashes=False)
@jwt_required()
def updateInfo():
    user_id = session.get('user_id')
    user = storage.get(User, user_id)
    if not user:
        abort(404)
    if not request.get_json():
        abort(400, description='Not in JSON format!')
    
    fields = ['id', 'created_at', 'updated_at', 'email']

    data = request.get_json()
    for key, value in data.items():
        if key not in fields:
            setattr(user, key, value)
        setattr(user, 'updated_at', datetime.utcnow() )
    storage.save()
    dict = user.to_dict()
    dict = user.to_dict()
    del dict['_sa_instance_state']
    del dict['__class__']
    print(dict)
    return jsonify({},200)