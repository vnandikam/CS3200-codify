from flask import Blueprint, request, jsonify, make_response
import json
from src import db

admin = Blueprint('admin', __name__)

# Get all the timesheet info from the database for the timelog dashboard


@admin.route('/timesheet_info', methods=['GET'])
def get_timesheet_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT t.emp_id AS id, t.clock_in AS clockin, t.clock_out as clockout, t.date_worked as date, e.fname as fname
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
        SELECT e.employee_id AS id, ei.fname as fname, e.dep as depname, e.title as role
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
        SELECT p.resource_name AS resource, o.issue_date as issue
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
        SELECT o.resource_name AS resource, o.issue_date as issue
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

