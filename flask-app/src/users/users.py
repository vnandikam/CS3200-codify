from flask import Blueprint, request, jsonify, make_response,current_app
import json
from src import db

users = Blueprint('users', __name__)

# get all users
@users.route('/user_dashboard', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of users
    query = '''
        SELECT DISTINCT u.user_id AS u_id, u.fname AS firstName, u.userRole AS role, u.portfolio AS portfolio
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

#Add users to projects
@users.route('/add-users', methods = ['PUT'])
def add_user_proj():
    the_data = request.json
    current_app.logger.info(the_data)
    cursor = db.get_db().cursor()
    column = [row['user_id'] for row in the_data]
    r = the_data[1]['project_id']


    for value in column:
        query = '''
            UPDATE users SET project_id = (SELECT project_id FROM users WHERE user_id = 1) WHERE user_id =
        '''
        query += str(value) + '";"'
        cursor.execute(query)

    return 'Success!'



#Create Project
@users.route('/create_project', methods = ['POST'])
def create_proj():
    the_data = request.json
    current_app.logger.info(the_data)
    cursor = db.get_db().cursor()
    #extracting the info
    project_id = the_data['project_id']
    name = the_data['project_name']
    description = the_data['project_description']
    user_id = the_data['project_user_id']
    languages = the_data['project_languages']
    location = the_data['project_location']

    query = 'insert into projects \
        (project_id,location,project_description,project_name,project_status,project_languages) \
            values ("'
    query += str(project_id) + '","'
    query += location + '","'
    query += description + '","'
    query += name + ','
    query += str(0) + '","'
    query += languages + '");"'

    cursor.execute(query)

    query = 'UPDATE users SET project_id = '
    query += str(project_id) + '" WHERE user_id ="'
    query += str(user_id) + '";"'

    cursor.execute(query)
    return 'Success'