#!/usr/bin/python3
"""Class implementation for the routes taken."""

from models.base_model import BaseModel
import models

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
    origin = ''
    destination = ''
    distance = ''
    travel_time = ''
    travel_break = ''
    