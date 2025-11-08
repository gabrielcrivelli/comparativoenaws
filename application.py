# This file is required by AWS Elastic Beanstalk
# It imports the Flask application from app.py

from app import app

# Create application variable for AWS Elastic Beanstalk
application = app

