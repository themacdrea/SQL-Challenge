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

SELECT "Employee"."emp_no", "Employee"."last_name", "Employee"."first_name", "Employee"."sex", "Salary"."salary"
FROM "Employee"
JOIN "Salary" ON "Employee"."emp_no" = "Salary"."emp_no";


SELECT "first_name", "last_name", "hire_date"
FROM "Employee"
WHERE "hire_date" BETWEEN '1986-01-01' AND '1986-12-31';


SELECT "Department_Manager"."dept_no", "Department"."dept_name", "Department_Manager"."emp_no", "Employee"."last_name", "Employee"."first_name"
FROM "Department_Manager"
JOIN "Department" ON "Department_Manager"."dept_no" = "Department"."dept_no"
JOIN "Employee" ON "Department_Manager"."emp_no" = "Employee"."emp_no";


SELECT "Department_Employee"."emp_no", "Employee"."last_name", "Employee"."first_name", "Department"."dept_name"
FROM "Department_Employee"
JOIN "Employee" ON "Department_Employee"."emp_no" = "Employee"."emp_no"
JOIN "Department" ON "Department_Employee"."dept_no" = "Department"."dept_no";


SELECT "first_name", "last_name", "sex"
FROM "Employee"
WHERE "first_name" = 'Hercules' AND "last_name" LIKE 'B%';


SELECT "Employee"."emp_no", "Employee"."last_name", "Employee"."first_name"
FROM "Employee"
JOIN "Department_Employee" ON "Employee"."emp_no" = "Department_Employee"."emp_no"
JOIN "Department" ON "Department_Employee"."dept_no" = "Department"."dept_no"
WHERE "Department"."dept_name" = 'Sales';


SELECT "Employee"."emp_no", "Employee"."last_name", "Employee"."first_name", "Department"."dept_name"
FROM "Employee"
JOIN "Department_Employee" ON "Employee"."emp_no" = "Department_Employee"."emp_no"
JOIN "Department" ON "Department_Employee"."dept_no" = "Department"."dept_no"
WHERE "Department"."dept_name" IN ('Sales', 'Development');


SELECT "last_name", COUNT(*) AS frequency
FROM "Employee"
GROUP BY "last_name"
ORDER BY frequency DESC;
