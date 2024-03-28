#!/usr/bin/python3
"""
    Implementation for the ticket booking.
"""
from models.base_model import BaseModel
import models
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Float
from sqlalchemy.orm import relationship


class Ticket(BaseModel):
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
        number = Column(String(20), unique=True, nullable=False)
        user_id = Column(String(60), ForeignKey('users.id'))
        schedule_id = Column(String(60), ForeignKey('schedules.id'))
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