#!/usr/bin/python3
"""Class implementation for the routes taken."""

from models.base_model import BaseModel
import models
import sqlalchemy
from sqlalchemy import Column,String,Float, Boolean,DateTime


class Route(BaseModel):
    """
    --------------------
    CLASS: ROUTE
    DESCRIPTION:
        A class route that inherits BaseMoedl.
    --------------------
    """
    # ------------------------------- #
    #       PUBLIC ATTRIBUTES         #
    # ------------------------------- #
    if models.storage_op == 'db':
        __tablename__ = 'routes'
        origin = Column(String(128), nullable=False)
        destination = Column(String(100),nullable=False)
        distance = Column(Float, nullable=False)
        travel_time = Column(DateTime, nullable=False)
        travel_break = Column(Boolean, nullable=True , default=True)
    else:
        origin = ''
        destination = ''
        distance = ''
        travel_time = ''
        travel_break = ''
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
