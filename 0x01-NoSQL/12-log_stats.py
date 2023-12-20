#!/usr/bin/env python3
'''Task 12's module.
'''
from pymongo import MongoClient

def print_nginx_request_logs(nginx_collection):
    '''Prints stats about Nginx request logs.
    
    Args:
        nginx_collection (pymongo.collection.Collection):
        The collection containing Nginx request logs.
    '''
    # Count all logs
    print('{} logs'.format(nginx_collection.count_documents({})))
    
    # Print stats for different HTTP methods
    print('Methods:')
    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    for method in methods:
        req_count = len(list(nginx_collection.find({'method': method})))
        print('\tmethod {}: {}'.format(method, req_count))
    
    # Count status checks
    status_checks_count = len(list(
        nginx_collection.find({'method': 'GET', 'path': '/status'})
    ))
    print('{} status check'.format(status_checks_count))

def run():
    '''Provides some stats about Nginx logs stored in MongoDB.
    '''
    # Connect to MongoDB
    client = MongoClient('mongodb://127.0.0.1:27017')
    
    # Call the function to print Nginx logs stats
    print_nginx_request_logs(client.logs.nginx)

if __name__ == '__main__':
    run()
