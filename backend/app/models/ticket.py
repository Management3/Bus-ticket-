#!/usr/bin/python3
"""
    Implementation for the ticket booking.
"""
from models.base_model import BaseModel
import models


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

    user_id = ''
    schedule_id = ''
    seat_number = ''
    fare = ''
    user = ''
    schedule = ''