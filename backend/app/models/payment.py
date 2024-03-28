#!/usr/bin/python3
"""
    A class that inherits from BaseModel.
"""
import models
from models.base_model import BaseModel
import sqlalchemy 
from sqlalchemy import Column, String, ForeignKey, Float
from sqlalchemy.orm import relationship

class Payment(BaseModel):
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
        __tablename__ = 'payments'
        amount = Column(Float, nullable=False)
        status = Column(String(20), nullable=False)
        user_id = Column(String(60), ForeignKey('users.id'))
        ticket_id = Column(String(60), ForeignKey('tickets.id'))
        payment_method = Column(String(50), nullable=False)
        user = relationship('User', backref='payments')
        ticket = relationship('Ticket', backref='payments')
    else:
        amount = ''
        status = ''
        user_id = ''
        ticket_id = ''
        payment_method = ''
        user = ''
        ticket = ''
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)