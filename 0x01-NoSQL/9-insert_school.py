#!/usr/bin/env python3
'''Task 10's module.
'''

def update_topics(mongo_collection, name, topics):
    '''
    Update Topics in MongoDB Collection
    
    Parameters:
        mongo_collection: MongoDB collection object
        name: Name to identify the document to be updated
        topics: List of topics to be set in the document

    Returns:
        None
    '''

    mongo_collection.update_many(
        {'name': name},
        {'$set': {'topics': topics}}
    )
