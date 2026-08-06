import os
from flask import Flask
import psycopg2

app = Flask(__name__)

def get_db_connection():
    # الاتصال بقاعدة البيانات باستخدام اسم الحاوية كـ Host
    conn = psycopg2.connect(
        host='postgres-db',
        database='namedb',
        user='myuser',
        password='mypassword',
        port=5432
    )
    return conn

@app.route('/')
def index():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT name FROM users LIMIT 1;')
        user_name = cur.fetchone()[0]
        cur.close()
        conn.close()
        return f"Hello {user_name}! Served dynamically from PostgreSQL DB! 🚀"
    except Exception as e:
        return f"Error connecting to DB: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
