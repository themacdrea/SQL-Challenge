CREATE TABLE "Department" (
    "dept_no" VARCHAR(4)   NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Department_Employee" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no") REFERENCES "Employee" ("emp_no"),
    CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no") REFERENCES "Department" ("dept_no")
);

CREATE TABLE "Department_Manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    PRIMARY KEY ("dept_no", "emp_no"),
    CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no") REFERENCES "Employee" ("emp_no"),
    CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no") REFERENCES "Department" ("dept_no")
);

CREATE TABLE "Employee" (
    "emp_no" INT   NOT NULL PRIMARY KEY,
    "emp_title" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL
);

CREATE TABLE "Salary" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no") REFERENCES "Employee" ("emp_no")
);

CREATE TABLE "Title" (
    "title_id" VARCHAR(10)   NOT NULL PRIMARY KEY,
    "titles" VARCHAR(60)   NOT NULL
);

SELECT * FROM "Employee";
