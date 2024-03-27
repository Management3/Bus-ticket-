#!/usr/bin/python
"""Implementation for the buses."""

import models
from models.base_model import BaseModel

class Bus(BaseModel):
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
    number = ''
    driver = ''
    conductor = ''
    capacity = ''
    current_location = ''
    bus_type = ''
