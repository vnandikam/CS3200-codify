from flask import Blueprint, request, jsonify, make_response
import json
from src import db

users = Blueprint('users', __name__)

#get all users
@users.route('/user_dashboard', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    query = '''
        SELECT u.user_id AS u_id, u.fname AS firstName, u.userRole AS role, u.portfolio AS portfolio
        FROM users JOIN userprofile AS u
        ORDER BY firstName

    '''
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response