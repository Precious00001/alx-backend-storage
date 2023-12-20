#!/usr/bin/env python3
""" MongoDB Operations with Python using pymongo """

def list_all(mongo_collection):
    """
    List all documents in the MongoDB collection.

    Parameters:
        - mongo_collection: The pymongo collection object.

    Returns:
        A list of all documents in the collection.
    """
    # Find all documents in the collection
    documents = mongo_collection.find()

    # Check if there are no documents
    if documents.count() == 0:
        return []

    # Return the list of documents
    return documents
