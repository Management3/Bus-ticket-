#!/usr/bin/python3
"""
contains the entry point of the command interpreter
"""

import cmd
import models
import json
from models import storage
from models.base_model import BaseModel
from models.user import User
from models.bus import Bus
from models.route import Route
from models.schedule import Schedule
from models.ticket import Ticket
from models.payment import Payment

class HBNBCommand(cmd.Cmd):
    """Simple command processor example."""

    #intro = 'Welcome to the  console\n'
    prompt = '(hbnb)'
    cstr = ['BaseModel', 'User', 'Bus', 'Route', 'Schedule','Ticket', 'Payment']
    csob = [BaseModel, User, Bus, Route, Schedule,Ticket, Payment]

    def do_create(self, class_name):
        """create a new instance of Base model"""
        if class_name == '':
            print("** class name missing **")
        elif class_name not in self.cstr:
            print("** class doesn't exist **")
        else:
            classin = class_name
            ob = self.csob[HBNBCommand.cstr.index(class_name)]()
            #models.storage.new(ob)
            models.storage.save()
            print(ob.id)

    def do_show(self, wline):
        """ Prints string representation of an instance based on clsname.id"""

        path = 'file.json'
        dico = {}
        parse = wline.split(' ')

        if len(parse) == 1:
            if parse[0] == '':
                print("** class name missing **")
            elif parse[0] not in HBNBCommand.cstr:
                print("** class doesn't exist **")
            else:
                print("** instance id missing **")
        elif parse[0] not in HBNBCommand.cstr:
            print("** class doesn't exist **")
        else:
            dico = models.storage.all()
            keyx = parse[0] + '.' + parse[1]
            if keyx in dico:
                print(dico[keyx])
            else:
                print("** no instance found **")

    def do_destroy(self, wline):
        """Deletes an instance based on the class name and id"""

        path = 'file.json'
        parse = wline.split(' ')
        if len(parse) == 1:
            if parse[0] == '':
                print("** class name missing **")
            elif parse[0] not in HBNBCommand.cstr:
                print("** class doesn't exist **")
            else:
                print("** instance id missing **")

        elif parse[0] not in HBNBCommand.cstr:
            print("** class doesn't exist **")
        else:
            keyx = parse[0] + '.' + parse[1]
            if keyx in models.storage.all():
                del models.storage.all()[keyx]
                models.storage.save()
            else:
                print("** no instance found **")

    def do_all(self, wline):
        """Prints all string representation of all instances"""

        l = []
        c = wline.split(' ')
        if c[0]:
            if c[0] not in HBNBCommand.cstr:
                print("** class doesn't exist **")
            else:
                for k in models.storage.all().keys():
                    if k.split('.')[0] == c[0]:
                        l.append(models.storage.all()[k])

        else:
            for k in models.storage.all().keys():
                l.append(models.storage.all()[k])
        if l:
            #print([str(item) for item in l])
            print([item.__str__() for item in l])
        l.clear()

    def do_update(self, wline):
        """Updates an instance based on the class name"""

        parse = wline.split(' ')
        if parse[0] == '':
            print("** class name missing **")
        elif parse[0] and parse[0] not in HBNBCommand.cstr:
            print("** class doesn't exist **")
        elif len(parse) == 1:
            print("** instance id missing **")
        elif parse[0] + '.' + parse[1] not in models.storage.all():
            print("** no instance found **")
        elif len(parse) == 2:
            print("** attribute name missing **")
        elif len(parse) == 3:
            print("** value missing **")
        else:
            k = parse[0] + '.' + parse[1]
            dct = models.storage.all()
            if type(parse[3]) is int:
                dct[k][parse[2]] = int(parse[3])
                dct[k][parse[2]] = int(dct[k][parse[2]]) + 2
                #setattr(dct[k], parse[2], int(parse[3].strip('"')))
            else:
                #print('no')
                parse[3] = parse[3].strip("'")
                setattr(dct[k], parse[2], parse[3].strip('"'))
                models.storage.save()

    def default(self, wline):
        """commande line argument parsing"""

        wline = wline.replace("(", ".").replace(")", ".")
        wline = wline.replace(", ", ".")
        wline = wline.split(".")

        if wline[1] == "all":
            self.do_all(wline[0])
        elif wline[1] == "count":
            nb_objects = 0
            for i in storage.all().keys():
                nb_objects += 1
            print(nb_objects)
        elif wline[1] == "show":
            key = wline[0] + " " + wline[2]
            self.do_show(key)
        elif wline[1] == "destroy":
            key = wline[0] + " " + wline[2]
            self.do_destroy(key)
        elif wline[1] == "update":
            key = wline[0] + " " + wline[2] + " " + wline[3] + " " + wline[4]
            self.do_update(key)

    def do_EOF(self, line):
        """End of file"""

        return True

    def do_quit(self, line):
        """Quit command to exit the program"""

        return True

    def emptyline(self):
        """ overwriting the emptyline method """
        return False

if __name__ == '__main__':
    """
    code executed when not imported
    """
    HBNBCommand().cmdloop()