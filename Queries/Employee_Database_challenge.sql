---- DELIVERABLE 1: The # of Retiring Employees by Title
-- retirement_titles.csv
SELECT em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as em
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC

-- unique_titles.csv
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no ASC

-- retiring_titles.csv
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC


---- DELIVERABLE 2: The Employees Eligible for the Mentorship Program
-- mentorship_elegibility.csv
SELECT DISTINCT ON (em.emp_no) em.emp_no,
	em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as em
INNER JOIN dept_emp as de
	ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (em.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no
