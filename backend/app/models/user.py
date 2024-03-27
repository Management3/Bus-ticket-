#!/usr/bin/python3
"""
a class User that inherits from BaseModel:
"""
import models
from models.base_model import BaseModel


class User(BaseModel):
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

    email = ''
    password = ''
    first_name = ''
    last_name = ''