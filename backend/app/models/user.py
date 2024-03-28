#!/usr/bin/python3
"""
a class User that inherits from BaseModel:
"""
import models
from models.base_model import BaseModel
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
from hashlib import md5

class User(BaseModel):
    """
    ------------------
    CLASS: User
    DESCRIPTION:
             a class User that inherits from BaseModel
    ------------------
    """


    # ------------------------------- #
    #       PUBLIC ATTRIBUTES         #
    # ------------------------------- #
    if models.storage_op == 'db':
        __tablename__ = 'users'
        email = Column(String(128), nullable=False)
        password = Column(String(128), nullable=False)
        first_name = Column(String(128), nullable=False)
        last_name = Column(String(128), nullable=True)
        role = Column(String(50), nullable=True, default='user')
        phone_number = Column(String(100), nullable=False)
        address = Column(String(128), nullable=True)
        zip_code = Column(String(50), nullable=True)
    else:
        email = ''
        password = ''
        first_name = ''
        last_name = ''
        role = ''
        phone_number = ''
        address =''
        zip_code = ''

    def __init__(self, *args, **kwargs):
        """Initialize the user."""
        super().__init__(*args, **kwargs)

    def __setattr__(self, name, value):
        """Hash password then saves."""
        if name == 'password':
            value = md5(value.encode()).hexdigest()
        super().__setattr__(name, value)