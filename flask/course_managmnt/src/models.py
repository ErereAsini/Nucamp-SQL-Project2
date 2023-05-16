from flask_sqlalchemy import SQLAlchemy

# pylint: disable=E1101
# pylint: disable=E0602

db = SQLAlchemy()

class Student_Account(db.Model):
    __tablename__ = 'students_accounts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    student_id = db.Column(db.Integer, db.ForeignKey('students.id'), nullable=False, unique=True)

    def __init__(self, username: str, password: int):
        self.username = username
        self.password = password

    def serialize(self):
        return {
            'id': self.id,
            'username': self.username,
    }

class Student(db.Model):
    __tablename__ = 'students'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, unique=True, nullable=False)
    last_name = db.Column(db.Text, unique=True, nullable=False)

    def __init__(self, first_name: str, last_name: str):
        self.first_name = first_name
        self.last_name = last_name

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name
    }

class Department(db.Model):
    __tablename__ = 'departments'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    building = db.Column(db.Integer, unique=True, nullable=False)
    capacity = db.Column(db.Integer, nullable=False)
    faculty_id = db.Column(db.Integer, db.ForeignKey('faculties.id'), unique=True, nullable=False)
    course_id = db.Column(db.Integer, db.ForeignKey('courses.id'), nullable=False)
    professor_id = db.Column(db.Integer, db.ForeignKey('professors.id'))

    def __init__(self, name: str, building: int, capacity: int, faculty_id: int, 
                 course_id: int, professor_id):
        self.name = name
        self.building = building
        self.capacity = capacity
        self.faculty_id = faculty_id
        self.course_id = course_id
        self.professor_id = professor_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'building': self.building,
            'capacity': self.capacity,
            'faculty_id': self.faculty_id,
            'course_id': self.course_id,
            'professor_id': self.professor_id
    }

class Faculty(db.Model):
    __tablename__ = 'faculties'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    building = db.Column(db.Integer, unique=True, nullable=False)

    def __init__(self, name: str, building: int):
        self.name = name
        self.building = building

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'building': self.building
    }
    
class Course(db.Model):
    __tablename__ = 'courses'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.Text, unique=True, nullable=False)
    semester = db.Column(db.Integer)

    def __init__(self, title: str, semester: int):
        self.title = title
        self.semester = semester

    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
            'semester': self.semester
    }

class Professor(db.Model):
    __tablename__ = 'professors'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.Text, unique=True, nullable=False)
    last_name = db.Column(db.Text, unique=True, nullable=False)

    def __init__(self, first_name: str, last_name: str):
        self.first_name = first_name
        self.last_name = last_name

    def serialize(self):
        return {
            'id': self.id,
            'first_name': self.first_name,
            'last_name': self.last_name
    }

class Student_Department(db.Model):
    __tablename__ = 'students_departments'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    student_id = db.Column(db.Integer, db.ForeignKey('students.id'), nullable=False)
    department_id = db.Column(db.Integer, db.ForeignKey('departments.id'), nullable=False)

    def __init__(self, student_id: int, department_id: int):
        self.student_id = student_id
        self.department_id = department_id

    def serialize(self):
        return {
            'id': self.id,
            'student_id': self.student_id,
            'department_id': self.department_id
    }