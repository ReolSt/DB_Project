drop table Course_Taking;
drop table Register;
drop table Lecture;
drop table Student;
drop table Professor;
drop table Major;
create table Major (
    major_id number not null primary key,
    name varchar(100),
    telephone_number varchar(40)
);
create table Professor (
    professor_id number not null primary key,
    major_id number,
    constraint professor_major_id_fk
    foreign key (major_id)
    references Major(major_id),
    name varchar(100),
    resident_number varchar(100),
    address varchar(100),
    telephone_number varchar(100),
    email varchar(100),
    picture blob
);
create table Student (
    student_id number not null primary key,
    major_id number,
    professor_id number,
    name varchar(100),
    year number,
    semester number,
    register_number varchar(100),
    address varchar(100),
    telephone_number varchar(100),
    email varchar(100),
    picture blob,
    constraint student_major_id_fk
    foreign key (major_id)
    references Major(major_id),
    constraint student_professor_id_fk
    foreign key (professor_id)
    references Professor(professor_id)
);
create table Lecture (
    lecture_id number not null primary key,
    major_id number,
    professor_id number,
    name varchar(100),
    credit number,
    time varchar(100),
    room varchar(100),
    constraint lecture_major_id_fk
    foreign key(major_id)
    references Major(major_id),
    constraint lecture_professor_id_fk
    foreign key(professor_id)
    references Professor(professor_id)
);
create table Register (
    register_id number not null primary key,
    student_id number,
    lecture_id number,
    professor_id number,
    withdraw_state varchar(100),
    constraint register_student_id_fk
    foreign key(student_id)
    references Student(student_id),
    constraint register_lecture_id_fk
    foreign key(lecture_id)
    references Lecture(lecture_id),
    constraint register_professor_id_fk
    foreign key(professor_id)
    references Professor(professor_id)
);
create table Course_Taking (
    course_taking_id number not null primary key,
    student_id number,
    lecture_id number,
    attendance_score number,
    midterm_score number,
    final_score number,
    other_score number,
    total_score number,
    grade number,
    constraint student_student_id_fk
    foreign key(student_id)
    references Student(student_id),
    constraint lecture_lecture_id_fk
    foreign key(lecture_id)
    references Lecture(lecture_id)
);
