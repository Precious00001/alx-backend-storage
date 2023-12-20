#!/usr/bin/env python3
""" MongoDB Operations with Python using pymongo """

def schools_by_topic(mongo_collection, topic):
    """
    Retrieves a list of schools that have a specific topic.

    Args:
    - mongo_collection: pymongo Collection object
    representing the MongoDB collection.
    - topic: The specific topic to search for
    in the 'topics' field.

    Returns:
    - A list of documents (schools) matching the specified topic.
    """
    # Find documents in the MongoDB collection where the 'topics' field matches the specified topic
    documents = mongo_collection.find({"topics": topic})

    # Convert the MongoDB cursor to a list of documents
    list_docs = [d for d in documents]

    # Return the list of documents matching the specified topic
    return list_docs

