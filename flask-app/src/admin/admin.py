from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

admin = Blueprint('admin', __name__)

# Get all the timesheet info from the database for the timelog dashboard


@admin.route('/timesheet_info', methods=['GET'])
def get_timesheet_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT t.emp_id AS id, t.clock_in AS clockin, t.clock_out AS clockout, t.date_worked AS date, e.fname AS fname
        FROM timesheet AS t 
        JOIN Employee_Info e ON t.emp_id = e.employee_id
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the employee info from the database for the employee dashboard

@admin.route('/employee_info', methods=['GET'])
def get_employee_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT e.employee_id, ei.fname, e.dep, e.title 
        FROM Employee_Info AS ei
        JOIN Employee AS e
        ON e.employee_id = ei.employee_id
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the payroll info from the database

@admin.route('/payroll_info', methods=['GET'])
def get_payroll_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT p.amount, p.stock, p.salary, p.pay_interval, p.bonus
        FROM payroll AS p
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the office resources info from the database

@admin.route('/office_resources_info', methods=['GET'])
def get_office_resources_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT o.resource_name, o.issue_date
        FROM officeResources AS o
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the emp_project info from the database

@admin.route('/emp_project_info', methods=['GET'])
def get_emp_project_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT e.project_id, e.location, e.project_lead, e.department
        FROM emp_project AS e
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the dependent info from the database

@admin.route('/dependent_info', methods=['GET'])
def get_dependent_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT d.fname, d.minit, d.lname, d.relation, d.gender
        FROM dependent AS d
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the department info from the database

@admin.route('/department_info', methods=['GET'])
def get_department_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT d.location, d.dep_id, d.dep_name
        FROM department AS d
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Get all the employee status info from the database

@admin.route('/employee_status_info', methods=['GET'])
def get_employee_status_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT e.visa, e.disability, e.vet_stat
        FROM Employee_Info AS e
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get all the employee address info from the database


@admin.route('/employee_address', methods=['GET'])
def get_employee_address():
    cursor = db.get_db().cursor()
    query = '''
        SELECT e.street, e.zip, e.city
        FROM Employee_Info AS e
       
    
        '''

    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers.
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# post an entry to the employee info dashboard

@admin.route('/employee_info_post', methods=['POST'])
def add_new_employee_info():

    # collecting data from request object
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    employee_id = the_data['employee_id']
    fname = the_data['fname']
    dep = the_data['dep']
    title = the_data['title']

    # constructing the query
    query = 'insert into employee_info (employee_id, fname, dep, title) values ("'
    query += str(employee_id) + '","'
    query += fname + '","'
    query += str(dep) + '","'
    query += title + ')'

    current_app.logger.info(query)

    return 'Success!'


# delete an employee from the dashboard

@admin.route('/employee_removal', methods=['DELETE'])
def remove_employee():

    # collecting data from request object
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    employee_id = the_data['employee_id']
    fname = the_data['fname']
    dep = the_data['dep']
    title = the_data['title']

    # constructing the query
    query = 'delete from employee_info where employee_id="'
    query += str(employee_id)
    query += '"'

    current_app.logger.info(query)

    return 'Success!'




# update an Employee


@admin.route('/employee_info_put', methods=['PUT'])
def put_employee_info():
    # collecting data from request object
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    employee_id2 = the_data['employee_id']
    fname2 = the_data['fname']
    dep2 = the_data['dep']
    title2 = the_data['title']

    # constructing the query
    query = 'update employee_info (employee_id, fname, dep, title) values ("'
    query += str(employee_id2) + '","'
    query += fname2 + '","'
    query += str(dep2) + '","'
    query += title2 + ')'

    current_app.logger.info(query)

    return 'Success!'
