#!/usr/bin/env python3
""" MongoDB Operations with Python using pymongo """

def insert_school(mongo_collection, **kwargs):
    """
    Inserts a new document in a collection
    based on keyword arguments.

    Args:
        mongo_collection (pymongo.collection.Collection):
        The MongoDB collection.
        **kwargs: Keyword arguments representing the
        fields and values for the new document.

    Returns:
        ObjectId: The ObjectId of the newly inserted document.
    """
    # Insert the document into the MongoDB collection
    document_id = mongo_collection.insert(kwargs)

    # Return the ObjectId of the newly inserted document
    return document_id
