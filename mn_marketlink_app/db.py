
import pymysql

def get_connection():
    return pymysql.connect(
        host="localhost",
        user="root",          # 👈 change this
        password="YOUR_PASSWORD",  # 👈 change this to your own password
        database="mn_marketlink",       # use the DB name from schema.sql
        cursorclass=pymysql.cursors.DictCursor,
    )


