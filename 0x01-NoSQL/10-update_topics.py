#!/usr/bin/env python3
""" MongoDB Operations with Python using pymongo """

def update_topics(mongo_collection, name, topics):
    """
    Update topics of school documents in MongoDB.

    Args:
        mongo_collection: The MongoDB collection to perform the update on.
        name (str): The name of the school document to update.
        topics (list): The new list of topics to set for the school.

    Returns:
        None
    """
    # Define the query to find the school document by name
    query = {"name": name}

    # Define the update operation to set the new topics
    new_values = {"$set": {"topics": topics}}

    # Use update_many to update all matching documents in the collection
    mongo_collection.update_many(query, new_values)

