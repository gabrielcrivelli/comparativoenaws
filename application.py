# This file is required by AWS Elastic Beanstalk
# It imports the Flask application from app.py

from app import app as application

# AWS Elastic Beanstalk expects the application object to be called 'application'
if __name__ == "__main__":
    application.run()
