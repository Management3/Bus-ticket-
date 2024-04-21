#!/usr/bin/python3
"""
    Implementation for the ticket booking.
"""
from models.base_model import BaseModel, Base
import models
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Float
from sqlalchemy.orm import relationship
import uuid

class Ticket(BaseModel, Base):
    """
    ------------------
    CLASS: TICKET
    DESCRIPTION:
            A class Ticket that inherits from BaseModel
    ------------------
    """

    # ------------------------------- #
    #       PUBLIC ATTRIBUTES         #
    # ------------------------------- #

    if models.storage_op == 'db':
        __tablename__ = 'tickets'
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
        schedule_id = Column(String(60), ForeignKey('schedules.id'), nullable=False)
        seat_number = Column(String(60), nullable=False)
        fare = Column(Float, nullable=False)
        user = relationship('User', backref='tickets')
        schedule = relationship('Schedule', backref='tickets')

    else:
        user_id = ''
        schedule_id = ''
        seat_number = ''
        fare = ''
        user = ''
        schedule = ''

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)