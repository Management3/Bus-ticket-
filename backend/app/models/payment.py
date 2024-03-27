#!/usr/bin/python3
"""
    A class that inherits from BaseModel.
"""
import models
from models.base_model import BaseModel


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
    amount = ''
    status = ''
    user_id = ''
    ticket_id = ''
    payment_method = ''
    user = ''
    ticket = ''