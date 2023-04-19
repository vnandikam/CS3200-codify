from flask import Blueprint, request, jsonify, make_response
import json
from src import db

users = Blueprint('users', __name__)

#get all users

@users.route('/user_dashboard', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of users
    query = '''
        SELECT u.user_id AS u_id, u.fname AS firstName, u.userRole AS role, u.portfolio AS portfolio
        FROM users u JOIN userprofile AS u
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


# Get all the projects from the database
@users.route('/project_dashboard', methods=['GET'])
def get_project_dashboard():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of projects
    query = '''
        SELECT p.project_name AS name, p.project_description AS description, 
        p.project_status as status, p.project_languages as languages FROM projects AS p'''
    
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

# Get all the project creators from the database
@users.route('/project_creators', methods=['GET'])
def get_project_creators():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of project creators
    query = '''
        SELECT u.user_id AS u_id, u.fname AS firstName, u.userRole AS role, u.portfolio AS portfolio
        FROM users JOIN userprofile AS u
        WHERE u.userRole = 'Project Creator'
        ORDER BY firstName'''
    
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

# Get all the developers from the database
@users.route('/developers', methods=['GET'])
def get_developers():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of developers
    query = '''
        SELECT u.user_id AS u_id, u.fname AS firstName, u.userRole AS role, u.portfolio AS portfolio
        FROM users JOIN userprofile AS u
        WHERE u.userRole = 'Developer'
        ORDER BY firstName'''
    
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

# Get all the designer from the database
@users.route('/designers', methods=['GET'])
def get_designers():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of designers
    query = '''
        SELECT u.user_id AS u_id, u.fname AS firstName, u.userRole AS role, u.portfolio AS portfolio
        FROM users JOIN userprofile AS u
        WHERE u.userRole = 'Designer'
        ORDER BY firstName'''
    
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

# Get a user_profile from the database
@users.route('/user_profile', methods=['GET'])
def get_user_profile():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a user_profile
    query = '''
        SELECT DISTINCT u.fname AS firstName, u.midinit AS midInit, u.lname AS lastName, 
        u.username AS username, u.userRole AS role, u.portfolio as portfolio, u.user_id as userID
        FROM userprofile AS u
        WHERE u.user_id = 1'''
    
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

# Get a user_profile from the database
@users.route('/user_info', methods=['GET'])
def get_user_info():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a user_info
    query = '''
        SELECT DISTINCT u.user_id, u.email, u.phone_num
        FROM users AS u
        WHERE u.user_id = 1'''
    
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

