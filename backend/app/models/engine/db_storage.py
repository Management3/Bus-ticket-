#!/usr/bin/python3
"""
    Class for dealing with the database storage.
"""

import models
from models.base_model import BaseModel, Base
from models.bus import Bus
from models.payment import Payment
from models.route import Route
from models.schedule import Schedule
from models.ticket import Ticket
from models.user import User
from os import getenv
import sqlalchemy
from sqlalchemy import create_engine , text
from sqlalchemy.orm import scoped_session, sessionmaker


classes = {
    "User": User, "Route": Route, "Bus": Bus,"Schedule":Schedule,
    "Ticket":Ticket,"Payment": Payment
}


class DBStorage:
    """Interface for interacting with the MySQL database."""
    __engine = None
    __session = None

    def __init__(self):
        """Instantiate a DBstorage objects."""
        MYSQL_USER = getenv('MYSQL_USER')
        MYSQL_PWD = getenv('MYSQL_PWD')
        MYSQL_HOST = getenv('MYSQL_HOST')
        MYSQL_DB = getenv('MYSQL_DB')
        ENV = getenv('ENV')
        self.__engine = create_engine(f'mysql+mysqldb://{MYSQL_USER}:{MYSQL_PWD}@{MYSQL_HOST}/{MYSQL_DB}')


        if ENV == 'test':
            Base.metadata.drop_all(self.__engine)

    def all(self, cls=None):
        """Query for all instances of a particular table."""
        new_dict = {}
        for clss in classes:
            if cls is None or cls is classes[clss] or cls is clss:
                tablename = f'* FROM {classes[clss].__tablename__}'
                objs = self.__session.query(classes[clss]).all()
                for obj in objs:
                    key = obj.__class__.__name__ + '.' + obj.id
                    new_dict[key] = obj
        return(new_dict)
    
    def new(self, obj):
        """Create a new instance to the database session"""
        self.__session.add(obj)

    def save(self):
        """Persist all changes made to the database."""
        self.__session.commit()
    
    def delete(self, obj=None):
        """Deletes current database session objest in not none."""
        if obj is not None:
            self.__session.delete(obj)
        
    def reload(self):
        """Reloads data from the database."""
        Base.metadata.create_all(self.__engine)
        sess_factory = sessionmaker(bind=self.__engine, expire_on_commit=False)
        Session = scoped_session(sess_factory)
        self.__session = Session
    
    def close(self):
        """Call remove() method on the session."""
        self.__session.remove()
    
    def get(self,cls, id):
        """Gets an object in the database using it's ID's"""
        if cls not in classes.values():
            return None
        
        all_cls = models.storage.all(cls)
        for value in all_cls.values():
            if (value.id == id):
                return value
        
        return None
    
    def count(self, cls=None):
        """Count the number of objects in the storage."""
        all_class = classes.values()

        if not cls:
            count = 0
            for clas in all_class:
                count += len(models.storage.all(clas).values())
        else:
            count = len(models.storage.all(cls).values())

        return count