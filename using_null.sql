-- List the teachers who have NULL for their department.
SELECT name FROM teacher WHERE dept IS NULL;
--Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id);
-- Use a different JOIN so that all teachers are listed.
SELECT t.name, d.name FROM teacher t LEFT JOIN dept d ON t.dept= d.id;
-- Use a different JOIN so that all departments are listed.
SELECT t.name, d.name FROM teacher t RIGHT JOIN dept d ON t.dept= d.id;
-- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;
-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT t.name, COALESCE(d.name, 'None') FROM teacher t LEFT JOIN dept d ON d.id = dept;
-- Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(name), COUNT(mobile) FROM teacher;
-- Use COUNT and GROUP BY dept.name to show each department and the number of staff.
SELECT d.name, COUNT(dept) FROM teacher RIGHT JOIN dept d ON dept = d.id GROUP BY d.name, dept
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' ELSE 'Art' END FROM teacher;
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END FROM teacher;