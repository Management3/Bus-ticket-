#!/usr/bin/python
"""Implementation for the buses."""

import models
from models.base_model import BaseModel, Base
import sqlalchemy
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship

class Bus(BaseModel, Base):
    """
    --------------------
    CLASS: BUS
    DESCRIPTION:
        A class bus that implements the buses models and inherits BaseMoedl.
    --------------------
    """
    # ------------------------------- #
    #       PUBLIC ATTRIBUTES         #
    # ------------------------------- #
    if models.storage_op == 'db':
        __tablename__ = 'buses'
        number = Column(String(50), nullable=False)
        driver = Column(String(128), ForeignKey('users.id'), nullable=False)
        conductor = Column(String(128), ForeignKey('users.id'))
        capacity = Column(Integer,nullable=False)
        current_location = Column(String(100), nullable=False)
        bus_type = Column(String(128))
    else:
        number = ''
        driver = ''
        conductor = ''
        capacity = ''
        current_location = ''
        bus_type = ''    
    
    def __init__(self, *args, **kwargs):
        """Initializing the buses."""
        super().__init__(*args, **kwargs)

