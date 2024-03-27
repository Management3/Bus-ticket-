#!/usr/bin/python3
"""Impletation for the schedule."""

import models
from models.base_model import BaseModel



class Schedule(BaseModel):
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
    departure_time = ''
    arrival_time = ''
    bus_id = ''
    route_id = ''
    bus = ''
    route = ''
 