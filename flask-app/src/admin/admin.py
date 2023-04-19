from flask import Blueprint, request, jsonify, make_response
import json
from src import db

admin = Blueprint('admin', __name__)

# # Get all the timesheet info from the database


@admin.route('/timesheet_info')
def get_timesheet_info():
    cursor = db.get_db().cursor()
    query = '''
        SELECT t.emp_id AS id, t.clock_in AS clockin, 
        t.clock_out as clockout, t.date_worked as date
        FROM timesheet AS t'''

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
