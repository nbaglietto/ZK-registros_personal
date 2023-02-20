import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

load_dotenv()

user_db = os.getenv('USUARIODB')
db_db = os.getenv('BASE')
passwddb = os.getenv('PASSWDDB')
hostdb = os.getenv('HOSTDB')

conexion = mysql.connector.connect(
    host=hostdb,
    user=user_db,
    passwd=passwddb,
    port=3306,
    db=db_db

)
