"""
Populate twitter database with fake data using the SQLAlchemy ORM.
"""
# pylint: disable=E0611
# pylint: disable=E0401
# pylint: disable=E1101

import random
import string
import hashlib
import secrets
from faker import Faker
from course_managmnt.src.models import Student_Account, Student, Department, Faculty, Course, Professor, Student_Department, db
from course_managmnt.src import create_app

STUDENT_ACCOUNT_COUNT = 50
STUDENT_COUNT = 100
DEPARTMENT_COUNT = 10
FACULTY_COUNT = 5
COURSE_COUNT = 5
PROFESSOR_COUNT = 8
STUDENT_DEPARTMENT_COUNT = 5

# LIKE_COUNT = 400

# assert LIKE_COUNT <= (USER_COUNT * TWEET_COUNT)


def random_passhash():
    """Get hashed and salted password of length N | 8 <= N <= 15"""
    raw = ''.join(
        random.choices(
            string.ascii_letters + string.digits + '!@#$%&', # valid pw characters
            k=random.randint(8, 15) # length of pw
        )
    )

    salt = secrets.token_hex(16)

    return hashlib.sha512((raw + salt).encode('utf-8')).hexdigest()


def truncate_tables():
    """Delete all rows from database tables"""
    db.session.execute(Student_Account.query.delete())
    Student.query.delete()
    Student_Department.delete()   
    Professor.query.delete()
    Course.query.delete()
    Faculty.query.delete()
    Department.query.delete()
    db.session.commit()


def main():
    """Main driver function"""
    app = create_app()
    app.app_context().push()
    truncate_tables()
    fake = Faker()

    last_student_account = None  # save last user
    for _ in range(STUDENT_ACCOUNT_COUNT):
        last_student_account = Student_Account(
            username=fake.unique.first_name().lower() + str(random.randint(1,150)),
            password=random_passhash()
        )
        db.session.add(last_student_account)

    # insert users
    db.session.commit()

    # last_tweet = None  # save last tweet
    # for _ in range(TWEET_COUNT):
    #     last_tweet = Tweet(
    #         content=fake.sentence(),
    #         user_id=random.randint(last_user.id - USER_COUNT + 1, last_user.id)
    #     )
    #     db.session.add(last_tweet)

    # # insert tweets
    # db.session.commit()

    # user_tweet_pairs = set()
    # while len(user_tweet_pairs) < LIKE_COUNT:

    #     candidate = (
    #         random.randint(last_user.id - USER_COUNT + 1, last_user.id),
    #         random.randint(last_tweet.id - TWEET_COUNT + 1, last_tweet.id)
    #     )

    #     if candidate in user_tweet_pairs:
    #         continue  # pairs must be unique

    #     user_tweet_pairs.add(candidate)

    # new_likes = [{"user_id": pair[0], "tweet_id": pair[1]} for pair in list(user_tweet_pairs)]
    # insert_likes_query = likes_table.insert().values(new_likes)
    # db.session.execute(insert_likes_query)

    # insert likes
    # db.session.commit()


# run script
main()
