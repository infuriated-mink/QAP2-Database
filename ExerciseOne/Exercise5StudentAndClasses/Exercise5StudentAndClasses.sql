CREATE TABLE "Location" (
  "location_id" SERIAL PRIMARY KEY,
  "street_address" VARCHAR,
  "unit_number" VARCHAR,
  "postal_code" VARCHAR,
  "city_id" INT,
  "province_id" INT,
  FOREIGN KEY ("city_id") REFERENCES "City"("city_id"),
  FOREIGN KEY ("province_id") REFERENCES "Province"("province_id")
);

CREATE TABLE "University" (
  "university_id" SERIAL PRIMARY KEY,
  "university_name" VARCHAR,
  "university_head" VARCHAR,
  "university_email" VARCHAR,
  "location" INT,
  CONSTRAINT "FK_University_location"
    FOREIGN KEY ("location")
      REFERENCES "Location"("location_id")
);

CREATE TABLE "Department" (
  "department_id" SERIAL PRIMARY KEY,
  "department_name" VARCHAR,
  "department_head" VARCHAR,
  "department_email" VARCHAR,
  "university_id" INT,
  CONSTRAINT "FK_Department_university_id"
    FOREIGN KEY ("university_id")
      REFERENCES "University"("university_id")
);

CREATE TABLE "Faculty" (
  "faculty_id" SERIAL PRIMARY KEY,
  "faculty_first_name" VARCHAR,
  "faculty_last_name" VARCHAR,
  "faculty_email" VARCHAR,
  "university_id" INT,
  "department_id" INT,
  CONSTRAINT "FK_Faculty_university_id"
    FOREIGN KEY ("university_id")
      REFERENCES "University"("university_id"),
  CONSTRAINT "FK_Faculty_department_id"
    FOREIGN KEY ("department_id")
      REFERENCES "Department"("department_id")
);

CREATE TABLE "Student" (
  "student_id" SERIAL PRIMARY KEY,
  "student_first_name" VARCHAR,
  "student_last_name" VARCHAR,
  "student_email" VARCHAR,
  "university_id" INT,
  CONSTRAINT "FK_Student_university_id"
    FOREIGN KEY ("university_id")
      REFERENCES "University"("university_id")
);

CREATE TABLE "StudentDepartment" (
  "student_id" INT,
  "department_id" INT,
  CONSTRAINT "FK_StudentDepartment_department_id"
    FOREIGN KEY ("department_id")
      REFERENCES "Department"("department_id"),
  CONSTRAINT "FK_StudentDepartment_student_id"
    FOREIGN KEY ("student_id")
      REFERENCES "Student"("student_id")
);

CREATE TABLE "Class" (
  "class_id" SERIAL PRIMARY KEY,
  "class_name" VARCHAR
);

CREATE TABLE "Semester" (
  "semester_id" SERIAL PRIMARY KEY,
  "semester_name" VARCHAR
);

CREATE TABLE "SemesterClass" (
  "semester_id" INT,
  "class_id" INT,
  "semester_class_id" SERIAL PRIMARY KEY,
  CONSTRAINT "FK_SemesterClass_class_id"
    FOREIGN KEY ("class_id")
      REFERENCES "Class"("class_id"),
  CONSTRAINT "FK_SemesterClass_semester_id"
    FOREIGN KEY ("semester_id")
      REFERENCES "Semester"("semester_id")
);

CREATE TABLE "StudentSemesterClass" (
  "student_id" INT,
  "semester_class_id" INT,
  "student_semester_class_id" SERIAL PRIMARY KEY,
  CONSTRAINT "FK_StudentSemesterClass_student_id"
    FOREIGN KEY ("student_id")
      REFERENCES "Student"("student_id"),
  CONSTRAINT "FK_StudentSemesterClass_semester_class_id"
    FOREIGN KEY ("semester_class_id")
      REFERENCES "SemesterClass"("semester_class_id")
);

CREATE TABLE "FacultySemesterClass" (
  "faculty_id" INT,
  "semester_class_id" INT,
  CONSTRAINT "FK_FacultySemesterClass_semester_class_id"
    FOREIGN KEY ("semester_class_id")
      REFERENCES "SemesterClass"("semester_class_id"),
  CONSTRAINT "FK_FacultySemesterClass_faculty_id"
    FOREIGN KEY ("faculty_id")
      REFERENCES "Faculty"("faculty_id")
);

CREATE TABLE "ExamStudentGrade" (
  "exam_type_id" SERIAL PRIMARY KEY,
  "exam_type" VARCHAR,
  "grade" INT,
  "student_semester_class_id" INT,
  CONSTRAINT "FK_ExamStudentGrade_student_semester_class_id"
    FOREIGN KEY ("student_semester_class_id")
      REFERENCES "StudentSemesterClass"("student_semester_class_id")
);
