# pylint: disable=E1101
# pylint: disable=E0402
from flask import Blueprint, jsonify, abort, request
from ..models import Student, db, Student_Account, Student_Department, Professor, Faculty, Department, Course
import hashlib
import secrets
import sqlalchemy

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

bp = Blueprint('student', __name__, url_prefix='/student')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    students = Student.query.all() # ORM performs SELECT query
    result = []
    for s in students:
        result.append(s.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    s = Student.query.get_or_404(id)
    return jsonify(s.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'first_name' not in request.json or 'last_name' not in request.json:
        return abort(400)
    # if (len(first_name) < 3) or (len(password) < 8):
    #     return abort(400)
    # user with id of user_id must exist
    # construct User
    s = Student(
        first_name=request.json['first_name'],
        last_name=request.json['last_name']       
    )
    db.session.add(s) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(s.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    s = Student.query.get_or_404(id)
    try:
        db.session.delete(s) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    s = Student.query.get_or_404(id)
    if ('first_name') not in request.json and ('last_name') not in request.json:
        return abort(400)
    if 'first_name' in request.json:
        first_name=request.json['first_name']
        if (len(first_name) < 3):
            return abort(400)
        s.first_name = first_name
    if 'last_name' in request.json:
        last_name=request.json['last_name']
        if (len(last_name) < 8):
            return abort(400)
        s.last_name = last_name
    try:
        db.session.commit() # execute UPDATE statement
        return jsonify(s.serialize())
    except:
        # something went wrong :(
        return jsonify(False)
    
# @bp.route('/<int:id>/liked_tweets', methods=['GET'])
# def liked_tweets(id: int):
#     s = Student.query.get_or_404(id)
#     result = []
#     for s in s.liked_tweets:
#         result.append(s.serialize())
#     return jsonify(result)

# @bp.route('/<int:id>/like', methods=['GET'])
# def like(id: int):
#     if 'tweet_id' not in request.json:
#         return abort(400)
#     if 'tweet_id' in request.json:
#         t = Tweet.query.get_or_404(id)
#     if 'user_id' in request.json:
#         u = User.query.get_or_404(id)
#     result = []
#     for u, t in u.like, t.like:
#         result.append(u.serialize())
#         result.append(t.serialize())
#     return jsonify(result)

# stmt = sqlalchemy.insert(likes_table).values(name='spongebob', fullname="Spongebob Squarepants")