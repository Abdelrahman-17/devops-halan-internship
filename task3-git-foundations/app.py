import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "Welcome to Git & GitHub Foundations App!"})

if __name__ == '__main__':
    port = int(os.getenv('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
