#!/usr/bin/python3
"""Impletation for the schedule."""

import models
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import DateTime,ForeignKey, Column, String
from sqlalchemy.orm import relationship


class Schedule(BaseModel, Base):
    """
    --------------------
    CLASS: SCHEDULE
    DESCRIPTION:
        A class for scheduling the buses.
    --------------------
    """
    # ------------------------------- #
    #       PUBLIC ATTRIBUTES         #
    # ------------------------------- #

    if models.storage_op == 'db':
        __tablename__ = 'schedules'
        departure_time = Column(DateTime, nullable=False)
        arrival_time = Column(DateTime, nullable=False)
        session = Column(String(60), nullable=False)
        bus_id = Column(String(60),ForeignKey('buses.id'),nullable=False)
        route_id = Column(String(60), ForeignKey('routes.id'),nullable=False)
        bus = relationship('Bus', backref='schedules')
        route = relationship('Route', backref='schedules')
    else:
        departure_time = ''
        arrival_time = ''
        bus_id = ''
        route_id = ''
        bus = ''
        route = ''
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)