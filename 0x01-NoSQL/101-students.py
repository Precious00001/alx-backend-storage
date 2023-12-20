#!/usr/bin/env python3
'''Task 14's module.
'''

def top_students(mongo_collection):
    '''Prints all students in a collection
    sorted by average score.
    Args:
        mongo_collection: MongoDB collection object.

    Returns:
        MongoDB cursor object containing students
        sorted by average score.
    '''
    # Use the aggregate method to perform complex queries
    students = mongo_collection.aggregate(
        [
            {
                # Project stage: Include only necessary fields in the result
                '$project': {
                    '_id': 1,
                    'name': 1,
                    'averageScore': {
                        # Use $avg to calculate the average of the nested array 'topics.score'
                        '$avg': {
                            '$avg': '$topics.score',
                        },
                    },
                    'topics': 1,
                },
            },
            {
                # Sort stage: Sort the result in descending order based on 'averageScore'
                '$sort': {'averageScore': -1},
            },
        ]
    )
    return students
