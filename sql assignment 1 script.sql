create schema data;

CREATE TABLE data.regions (
    region_id INT NOT NULL,
    region_name VARCHAR(25),
    PRIMARY KEY (region_id)
);

CREATE TABLE data.countries (
    country_id CHAR(2) NOT NULL,
    country_name VARCHAR(40),
    region_id INT NOT NULL,
    PRIMARY KEY (country_id),
    FOREIGN KEY (region_id) REFERENCES data.regions(region_id) ON DELETE CASCADE
);

CREATE TABLE data.locations (
    location_id INT IDENTITY(1,1) NOT NULL,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2) NOT NULL,
    PRIMARY KEY (location_id),
    FOREIGN KEY (country_id) REFERENCES data.countries(country_id) ON DELETE CASCADE
);

CREATE TABLE data.departments (
    department_id INT NOT NULL,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT,
    location_id INT,
    PRIMARY KEY (department_id),
    FOREIGN KEY (location_id) REFERENCES data.locations(location_id) ON DELETE SET NULL
);

CREATE TABLE data.jobs (
    job_id VARCHAR(10) NOT NULL,
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8, 0),
    max_salary DECIMAL(8, 0),
    PRIMARY KEY (job_id)
);

CREATE TABLE data.employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    salary DECIMAL(8, 2) NOT NULL,
    commission_pct DECIMAL(5, 2),
    manager_id INT,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES data.jobs(job_id),
    FOREIGN KEY (manager_id) REFERENCES data.employees(employee_id),  -- Removed ON DELETE SET NULL
    FOREIGN KEY (department_id) REFERENCES data.departments(department_id) ON DELETE SET NULL
);


CREATE TABLE data.job_history (
    employee_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES data.employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES data.jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES data.departments(department_id)
);


CREATE UNIQUE INDEX UX_job_history_employee_start
ON data.job_history (employee_id, start_date);

INSERT INTO data.regions
VALUES (
	1,
	'Europe'
	);

INSERT INTO data.regions
VALUES (
	2,
	'Americas'
	);

INSERT INTO data.regions
VALUES (
	3,
	'Asia'
	);

INSERT INTO data.regions
VALUES (
	4,
	'Middle East and Africa'
	);

INSERT INTO data.countries
VALUES (
	'IT',
	'Italy',
	1
	);

INSERT INTO data.countries
VALUES (
	'JP',
	'Japan',
	3
	);

INSERT INTO data.countries
VALUES (
	'US',
	'United States of America',
	2
	);

INSERT INTO data.countries
VALUES (
	'CA',
	'Canada',
	2
	);

INSERT INTO data.countries
VALUES (
	'CN',
	'China',
	3
	);

INSERT INTO data.countries
VALUES (
	'IN',
	'India',
	3
	);

INSERT INTO data.countries
VALUES (
	'AU',
	'Australia',
	3
	);

INSERT INTO data.countries
VALUES (
	'ZW',
	'Zimbabwe',
	4
	);

INSERT INTO data.countries
VALUES (
	'SG',
	'Singapore',
	3
	);

INSERT INTO data.countries
VALUES (
	'UK',
	'United Kingdom',
	1
	);

INSERT INTO data.countries
VALUES (
	'FR',
	'France',
	1
	);

INSERT INTO data.countries
VALUES (
	'DE',
	'Germany',
	1
	);

INSERT INTO data.countries
VALUES (
	'ZM',
	'Zambia',
	4
	);

INSERT INTO data.countries
VALUES (
	'EG',
	'Egypt',
	4
	);

INSERT INTO data.countries
VALUES (
	'BR',
	'Brazil',
	2
	);

INSERT INTO data.countries
VALUES (
	'CH',
	'Switzerland',
	1
	);

INSERT INTO data.countries
VALUES (
	'NL',
	'Netherlands',
	1
	);

INSERT INTO data.countries
VALUES (
	'MX',
	'Mexico',
	2
	);

INSERT INTO data.countries
VALUES (
	'KW',
	'Kuwait',
	4
	);

INSERT INTO data.countries
VALUES (
	'IL',
	'Israel',
	4
	);

INSERT INTO data.countries
VALUES (
	'DK',
	'Denmark',
	1
	);

INSERT INTO data.countries
VALUES (
	'HK',
	'HongKong',
	3
	);

INSERT INTO data.countries
VALUES (
	'NG',
	'Nigeria',
	4
	);

INSERT INTO data.countries
VALUES (
	'AR',
	'Argentina',
	2
	);

INSERT INTO data.countries
VALUES (
	'BE',
	'Belgium',
	1
	);

INSERT INTO data.locations (street_address, postal_code, city, state_province, country_id)  
VALUES (
    '1297 Via Cola di Rie',
    '00989',
    'Roma',
    NULL,
    'IT'
);

INSERT INTO data.locations (street_address, postal_code, city, state_province, country_id)  
VALUES  
    ('93091 Calle della Testa', '10934', 'Venice', NULL, 'IT'),
    ('2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
    ('9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
    ('2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
    ('2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
    ('2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
    ('2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
    ('147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
    ('6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
    ('40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
    ('1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
    ('12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
    ('198 Clementi North', '540198', 'Singapore', NULL, 'SG'),
    ('8204 Arthur St', NULL, 'London', NULL, 'UK'),
    ('Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
    ('9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK'),
    ('Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
    ('Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
    ('20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
    ('Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
    ('Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
    ('Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX');


ALTER TABLE data.employees NOCHECK CONSTRAINT ALL;
ALTER TABLE data.departments NOCHECK CONSTRAINT ALL;
ALTER TABLE data.locations NOCHECK CONSTRAINT ALL;


INSERT INTO data.departments
VALUES (
	10,
	'Administration',
	200,
	1700
	);

INSERT INTO data.departments
VALUES (
	20,
	'Marketing',
	201,
	1800
	);

INSERT INTO data.departments
VALUES (
	30,
	'Purchasing',
	114,
	1700
	);

INSERT INTO data.departments
VALUES (
	40,
	'Human Resources',
	203,
	2400
	);

INSERT INTO data.departments
VALUES (
	50,
	'Shipping',
	121,
	1500
	);

INSERT INTO data.departments
VALUES (
	60,
	'IT',
	103,
	1400
	);

INSERT INTO data.departments
VALUES (
	70,
	'Public Relations',
	204,
	2700
	);

INSERT INTO data.departments
VALUES (
	80,
	'Sales',
	145,
	2500
	);

INSERT INTO data.departments
VALUES (
	90,
	'Executive',
	100,
	1700
	);

INSERT INTO data.departments
VALUES (
	100,
	'Finance',
	108,
	1700
	);

INSERT INTO data.departments
VALUES (
	110,
	'Accounting',
	205,
	1700
	);

INSERT INTO data.departments
VALUES (
	120,
	'Treasury',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	130,
	'Corporate Tax',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	140,
	'Control And Credit',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	150,
	'Shareholder Services',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	160,
	'Benefits',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	170,
	'Manufacturing',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	180,
	'Construction',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	190,
	'Contracting',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	200,
	'Operations',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	210,
	'IT Support',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	220,
	'NOC',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	230,
	'IT Helpdesk',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	240,
	'Government Sales',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	250,
	'Retail Sales',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	260,
	'Recruiting',
	NULL,
	1700
	);

INSERT INTO data.departments
VALUES (
	270,
	'Payroll',
	NULL,
	1700
	);

ALTER TABLE data.employees CHECK CONSTRAINT ALL;
ALTER TABLE data.departments CHECK CONSTRAINT ALL;
ALTER TABLE data.locations CHECK CONSTRAINT ALL;
-- Add other tables if needed


INSERT INTO data.jobs
VALUES (
	'AD_PRES',
	'President',
	20000,
	40000
	);

INSERT INTO data.jobs
VALUES (
	'AD_VP',
	'Administration Vice President',
	15000,
	30000
	);

INSERT INTO data.jobs
VALUES (
	'AD_ASST',
	'Administration Assistant',
	3000,
	6000
	);

INSERT INTO data.jobs
VALUES (
	'FI_MGR',
	'Finance Manager',
	8200,
	16000
	);

INSERT INTO data.jobs
VALUES (
	'FI_ACCOUNT',
	'Accountant',
	4200,
	9000
	);

INSERT INTO data.jobs
VALUES (
	'AC_MGR',
	'Accounting Manager',
	8200,
	16000
	);

INSERT INTO data.jobs
VALUES (
	'AC_ACCOUNT',
	'Public Accountant',
	4200,
	9000
	);

INSERT INTO data.jobs
VALUES (
	'SA_MAN',
	'Sales Manager',
	10000,
	20000
	);

INSERT INTO data.jobs
VALUES (
	'SA_REP',
	'Sales Representative',
	6000,
	12000
	);

INSERT INTO data.jobs
VALUES (
	'PU_MAN',
	'Purchasing Manager',
	8000,
	15000
	);

INSERT INTO data.jobs
VALUES (
	'PU_CLERK',
	'Purchasing Clerk',
	2500,
	5500
	);

INSERT INTO data.jobs
VALUES (
	'ST_MAN',
	'Stock Manager',
	5500,
	8500
	);

INSERT INTO data.jobs
VALUES (
	'ST_CLERK',
	'Stock Clerk',
	2000,
	5000
	);

INSERT INTO data.jobs
VALUES (
	'SH_CLERK',
	'Shipping Clerk',
	2500,
	5500
	);

INSERT INTO data.jobs
VALUES (
	'IT_PROG',
	'Programmer',
	4000,
	10000
	);

INSERT INTO data.jobs
VALUES (
	'MK_MAN',
	'Marketing Manager',
	9000,
	15000
	);

INSERT INTO data.jobs
VALUES (
	'MK_REP',
	'Marketing Representative',
	4000,
	9000
	);

INSERT INTO data.jobs
VALUES (
	'HR_REP',
	'Human Resources Representative',
	4000,
	9000
	);

INSERT INTO data.jobs
VALUES (
	'PR_REP',
	'Public Relations Representative',
	4500,
	10500
	);

INSERT INTO data.employees
VALUES 
(
    100,
    'Steven',
    'King',
    'SKING',
    '515.123.4567',
    CONVERT(DATE, '1987-06-17', 120),  -- Using CONVERT for date format
    'AD_PRES',
    24000,
    NULL,
    NULL,
    90
);

INSERT INTO data.employees
VALUES (
	101,
	'Neena',
	'Kochhar',
	'NKOCHHAR',
	'515.123.4568',
	CONVERT(DATE, '1989-09-21', 120),
	'AD_VP',
	17000,
	NULL,
	100,
	90
);

INSERT INTO data.employees
VALUES (
	102,
	'Lex',
	'De Haan',
	'LDEHAAN',
	'515.123.4569',
	CONVERT(DATE, '1993-01-13', 120),
	'AD_VP',
	17000,
	NULL,
	100,
	90
);

INSERT INTO data.employees
VALUES (
	103,
	'Alexander',
	'Hunold',
	'AHUNOLD',
	'590.423.4567',
	CONVERT(DATE, '1990-01-03', 120),
	'IT_PROG',
	9000,
	NULL,
	102,
	60
);

INSERT INTO data.employees
VALUES (
	104,
	'Bruce',
	'Ernst',
	'BERNST',
	'590.423.4568',
	CONVERT(DATE, '1991-05-21', 120),
	'IT_PROG',
	6000,
	NULL,
	103,
	60
);

INSERT INTO data.employees
VALUES (
	105,
	'David',
	'Austin',
	'DAUSTIN',
	'590.423.4569',
	CONVERT(DATE, '1997-06-25', 120),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
);

INSERT INTO data.employees
VALUES (
	106,
	'Valli',
	'Pataballa',
	'VPATABAL',
	'590.423.4560',
	CONVERT(DATE, '1998-02-05', 120),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
);

INSERT INTO data.employees
VALUES (
	107,
	'Diana',
	'Lorentz',
	'DLORENTZ',
	'590.423.5567',
	CONVERT(DATE, '1999-02-07', 120),
	'IT_PROG',
	4200,
	NULL,
	103,
	60
);

INSERT INTO data.employees
VALUES (
	108,
	'Nancy',
	'Greenberg',
	'NGREENBE',
	'515.124.4569',
	CONVERT(DATE, '1994-08-17', 120),
	'FI_MGR',
	12000,
	NULL,
	101,
	100
);

INSERT INTO data.employees
VALUES (
	109,
	'Daniel',
	'Faviet',
	'DFAVIET',
	'515.124.4169',
	CONVERT(DATE, '1994-08-16', 120),
	'FI_ACCOUNT',
	9000,
	NULL,
	108,
	100
);

INSERT INTO data.employees
VALUES (
	110,
	'John',
	'Chen',
	'JCHEN',
	'515.124.4269',
	CONVERT(DATE, '1997-09-28', 120),
	'FI_ACCOUNT',
	8200,
	NULL,
	108,
	100
);


INSERT INTO data.employees
VALUES (
	111,
	'Ismael',
	'Sciarra',
	'ISCIARRA',
	'515.124.4369',
	CONVERT(DATE, '1997-09-30', 120),
	'FI_ACCOUNT',
	7700,
	NULL,
	108,
	100
);

INSERT INTO data.employees
VALUES (
	112,
	'Jose Manuel',
	'Urman',
	'JMURMAN',
	'515.124.4469',
	CONVERT(DATE, '1998-03-07', 120),
	'FI_ACCOUNT',
	7800,
	NULL,
	108,
	100
);

INSERT INTO data.employees
VALUES (
	113,
	'Luis',
	'Popp',
	'LPOPP',
	'515.124.4567',
	CONVERT(DATE, '1999-12-07', 120),
	'FI_ACCOUNT',
	6900,
	NULL,
	108,
	100
);

INSERT INTO data.employees
VALUES (
	114,
	'Den',
	'Raphaely',
	'DRAPHEAL',
	'515.127.4561',
	CONVERT(DATE, '1994-12-07', 120),
	'PU_MAN',
	11000,
	NULL,
	100,
	30
);

INSERT INTO data.employees
VALUES (
	115,
	'Alexander',
	'Khoo',
	'AKHOO',
	'515.127.4562',
	CONVERT(DATE, '1995-05-18', 120),
	'PU_CLERK',
	3100,
	NULL,
	114,
	30
);

INSERT INTO data.employees
VALUES (
	116,
	'Shelli',
	'Baida',
	'SBAIDA',
	'515.127.4563',
	CONVERT(DATE, '1997-12-24', 120),
	'PU_CLERK',
	2900,
	NULL,
	114,
	30
);

INSERT INTO data.employees
VALUES (
	117,
	'Sigal',
	'Tobias',
	'STOBIAS',
	'515.127.4564',
	CONVERT(DATE, '1997-07-24', 120),
	'PU_CLERK',
	2800,
	NULL,
	114,
	30
);

INSERT INTO data.employees
VALUES (
	118,
	'Guy',
	'Himuro',
	'GHIMURO',
	'515.127.4565',
	CONVERT(DATE, '1998-11-15', 120),
	'PU_CLERK',
	2600,
	NULL,
	114,
	30
);

INSERT INTO data.employees
VALUES (
	119,
	'Karen',
	'Colmenares',
	'KCOLMENA',
	'515.127.4566',
	CONVERT(DATE, '1999-08-10', 120),
	'PU_CLERK',
	2500,
	NULL,
	114,
	30
);

INSERT INTO data.employees
VALUES (
	120,
	'Matthew',
	'Weiss',
	'MWEISS',
	'650.123.1234',
	CONVERT(DATE, '1996-07-18', 120),
	'ST_MAN',
	8000,
	NULL,
	100,
	50
);

INSERT INTO data.employees
VALUES (
	121,
	'Adam',
	'Fripp',
	'AFRIPP',
	'650.123.2234',
	CONVERT(DATE, '1997-04-10', 120),
	'ST_MAN',
	8200,
	NULL,
	100,
	50
);

INSERT INTO data.employees
VALUES (
	122,
	'Payam',
	'Kaufling',
	'PKAUFLIN',
	'650.123.3234',
	CONVERT(DATE, '1995-05-01', 120),
	'ST_MAN',
	7900,
	NULL,
	100,
	50
);

INSERT INTO data.employees
VALUES (
	123,
	'Shanta',
	'Vollman',
	'SVOLLMAN',
	'650.123.4234',
	CONVERT(DATE, '1997-10-10', 120),
	'ST_MAN',
	6500,
	NULL,
	100,
	50
);

INSERT INTO data.employees
VALUES (
	124,
	'Kevin',
	'Mourgos',
	'KMOURGOS',
	'650.123.5234',
	CONVERT(DATE, '1999-11-16', 120),
	'ST_MAN',
	5800,
	NULL,
	100,
	50
);

INSERT INTO data.employees
VALUES (
	125,
	'Julia',
	'Nayer',
	'JNAYER',
	'650.124.1214',
	CONVERT(DATE, '1997-07-16', 120),
	'ST_CLERK',
	3200,
	NULL,
	120,
	50
);

INSERT INTO data.employees
VALUES (
	126,
	'Irene',
	'Mikkilineni',
	'IMIKKILI',
	'650.124.1224',
	CONVERT(DATE, '1998-09-28', 120),
	'ST_CLERK',
	2700,
	NULL,
	120,
	50
);

INSERT INTO data.employees
VALUES (
	127,
	'James',
	'Landry',
	'JLANDRY',
	'650.124.1334',
	CONVERT(DATE, '1999-01-14', 120),
	'ST_CLERK',
	2400,
	NULL,
	120,
	50
);

INSERT INTO data.employees
VALUES (
	128,
	'Steven',
	'Markle',
	'SMARKLE',
	'650.124.1434',
	CONVERT(DATE, '2000-03-08', 120),
	'ST_CLERK',
	2200,
	NULL,
	120,
	50
);

INSERT INTO data.employees
VALUES (
	129,
	'Laura',
	'Bissot',
	'LBISSOT',
	'650.124.5234',
	CONVERT(DATE, '1997-08-20', 120),
	'ST_CLERK',
	3300,
	NULL,
	121,
	50
);

INSERT INTO data.employees
VALUES (
	130,
	'Mozhe',
	'Atkinson',
	'MATKINSO',
	'650.124.6234',
	CONVERT(DATE, '1997-10-30', 120),
	'ST_CLERK',
	2800,
	NULL,
	121,
	50
);


INSERT INTO data.employees
VALUES (
	131,
	'James',
	'Marlow',
	'JAMRLOW',
	'650.124.7234',
	CONVERT(DATE, '1997-02-16', 120),
	'ST_CLERK',
	2500,
	NULL,
	121,
	50
);

INSERT INTO data.employees
VALUES (
	132,
	'TJ',
	'Olson',
	'TJOLSON',
	'650.124.8234',
	CONVERT(DATE, '1999-04-10', 120),
	'ST_CLERK',
	2100,
	NULL,
	121,
	50
);

INSERT INTO data.employees
VALUES (
	133,
	'Jason',
	'Mallin',
	'JMALLIN',
	'650.127.1934',
	CONVERT(DATE, '1996-06-14', 120),
	'ST_CLERK',
	3300,
	NULL,
	122,
	50
);

INSERT INTO data.employees
VALUES (
	134,
	'Michael',
	'Rogers',
	'MROGERS',
	'650.127.1834',
	CONVERT(DATE, '1998-08-26', 120),
	'ST_CLERK',
	2900,
	NULL,
	122,
	50
);

INSERT INTO data.employees
VALUES (
	135,
	'Ki',
	'Gee',
	'KGEE',
	'650.127.1734',
	CONVERT(DATE, '1999-12-12', 120),
	'ST_CLERK',
	2400,
	NULL,
	122,
	50
);

INSERT INTO data.employees
VALUES (
	136,
	'Hazel',
	'Philtanker',
	'HPHILTAN',
	'650.127.1634',
	CONVERT(DATE, '2000-02-06', 120),
	'ST_CLERK',
	2200,
	NULL,
	122,
	50
);

INSERT INTO data.employees
VALUES (
	137,
	'Renske',
	'Ladwig',
	'RLADWIG',
	'650.121.1234',
	CONVERT(DATE, '1995-07-14', 120),
	'ST_CLERK',
	3600,
	NULL,
	123,
	50
);

INSERT INTO data.employees
VALUES (
	138,
	'Stephen',
	'Stiles',
	'SSTILES',
	'650.121.2034',
	CONVERT(DATE, '1997-10-26', 120),
	'ST_CLERK',
	3200,
	NULL,
	123,
	50
);

INSERT INTO data.employees
VALUES (
	139,
	'John',
	'Seo',
	'JSEO',
	'650.121.2019',
	CONVERT(DATE, '1998-02-12', 120),
	'ST_CLERK',
	2700,
	NULL,
	123,
	50
);

INSERT INTO data.employees
VALUES (
	140,
	'Joshua',
	'Patel',
	'JPATEL',
	'650.121.1834',
	CONVERT(DATE, '1998-04-06', 120),
	'ST_CLERK',
	2500,
	NULL,
	123,
	50
);

INSERT INTO data.employees
VALUES (
	141,
	'Trenna',
	'Rajs',
	'TRAJS',
	'650.121.8009',
	CONVERT(DATE, '1995-10-17', 120),
	'ST_CLERK',
	3500,
	NULL,
	124,
	50
);

INSERT INTO data.employees
VALUES (
	142,
	'Curtis',
	'Davies',
	'CDAVIES',
	'650.121.2994',
	CONVERT(DATE, '1997-01-29', 120),
	'ST_CLERK',
	3100,
	NULL,
	124,
	50
);

INSERT INTO data.employees
VALUES (
	143,
	'Randall',
	'Matos',
	'RMATOS',
	'650.121.2874',
	CONVERT(DATE, '1998-03-15', 120),
	'ST_CLERK',
	2600,
	NULL,
	124,
	50
);

INSERT INTO data.employees
VALUES (
	144,
	'Peter',
	'Vargas',
	'PVARGAS',
	'650.121.2004',
	CONVERT(DATE, '1998-07-09', 120),
	'ST_CLERK',
	2500,
	NULL,
	124,
	50
);

INSERT INTO data.employees
VALUES (
	145,
	'John',
	'Russell',
	'JRUSSEL',
	'011.44.1344.429268',
	CONVERT(DATE, '1996-10-01', 120),
	'SA_MAN',
	14000,
	.4,
	100,
	80
);

INSERT INTO data.employees
VALUES (
	146,
	'Karen',
	'Partners',
	'KPARTNER',
	'011.44.1344.467268',
	CONVERT(DATE, '1997-01-05', 120),
	'SA_MAN',
	13500,
	.3,
	100,
	80
);

INSERT INTO data.employees
VALUES (
	147,
	'Alberto',
	'Errazuriz',
	'AERRAZUR',
	'011.44.1344.429278',
	CONVERT(DATE, '1997-03-10', 120),
	'SA_MAN',
	12000,
	.3,
	100,
	80
);

INSERT INTO data.employees
VALUES (
	148,
	'Gerald',
	'Cambrault',
	'GCAMBRAU',
	'011.44.1344.619268',
	CONVERT(DATE, '1999-10-15', 120),
	'SA_MAN',
	11000,
	.3,
	100,
	80
);

INSERT INTO data.employees
VALUES (
	149,
	'Eleni',
	'Zlotkey',
	'EZLOTKEY',
	'011.44.1344.429018',
	CONVERT(DATE, '2000-01-29', 120),
	'SA_MAN',
	10500,
	.2,
	100,
	80
);

INSERT INTO data.employees
VALUES (
	150,
	'Peter',
	'Tucker',
	'PTUCKER',
	'011.44.1344.129268',
	CONVERT(DATE, '1997-01-30', 120),
	'SA_REP',
	10000,
	.3,
	145,
	80
);

INSERT INTO data.employees
VALUES (
	151,
	'David',
	'Bernstein',
	'DBERNSTE',
	'011.44.1344.345268',
	CONVERT(DATE, '1997-03-24', 120),
	'SA_REP',
	9500,
	.25,
	145,
	80
);

INSERT INTO data.employees
VALUES (
	152,
	'Peter',
	'Hall',
	'PHALL',
	'011.44.1344.478968',
	CONVERT(DATE, '1997-08-20', 120),
	'SA_REP',
	9000,
	.25,
	145,
	80
);

INSERT INTO data.employees
VALUES (
	153,
	'Christopher',
	'Olsen',
	'COLSEN',
	'011.44.1344.498718',
	CONVERT(DATE, '1998-03-30', 120),
	'SA_REP',
	8000,
	.2,
	145,
	80
);

INSERT INTO data.employees
VALUES (
	154,
	'Nanette',
	'Cambrault',
	'NCAMBRAU',
	'011.44.1344.987668',
	CONVERT(DATE, '1998-12-09', 120),
	'SA_REP',
	7500,
	.2,
	145,
	80
);

INSERT INTO data.employees
VALUES (
	155,
	'Oliver',
	'Tuvault',
	'OTUVAULT',
	'011.44.1344.486508',
	CONVERT(DATE, '1999-11-23', 120),
	'SA_REP',
	7000,
	.15,
	145,
	80
);

INSERT INTO data.employees
VALUES (
	156,
	'Janette',
	'King',
	'JKING',
	'011.44.1345.429268',
	CONVERT(DATE, '1996-01-30', 120),
	'SA_REP',
	10000,
	.35,
	146,
	80
);

INSERT INTO data.employees
VALUES (
	157,
	'Patrick',
	'Sully',
	'PSULLY',
	'011.44.1345.929268',
	CONVERT(DATE, '1996-03-04', 120),
	'SA_REP',
	9500,
	.35,
	146,
	80
);

INSERT INTO data.employees
VALUES (
	158,
	'Allan',
	'McEwen',
	'AMCEWEN',
	'011.44.1345.829268',
	CONVERT(DATE, '1996-08-01', 120),
	'SA_REP',
	9000,
	.35,
	146,
	80
);

INSERT INTO data.employees
VALUES (
	159,
	'Lindsey',
	'Smith',
	'LSMITH',
	'011.44.1345.729268',
	CONVERT(DATE, '1997-03-10', 120),
	'SA_REP',
	8000,
	.3,
	146,
	80
);

INSERT INTO data.employees
VALUES (
	160,
	'Louise',
	'Doran',
	'LDORAN',
	'011.44.1345.629268',
	CONVERT(DATE, '1997-12-15', 120),
	'SA_REP',
	7500,
	.3,
	146,
	80
);

INSERT INTO data.employees
VALUES 
(161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', CONVERT(DATE, '1998-11-03', 120), 'SA_REP', 7000, 0.25, 146, 80),
(162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', CONVERT(DATE, '1997-11-11', 120), 'SA_REP', 10500, 0.25, 147, 80),
(163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', CONVERT(DATE, '1999-03-19', 120), 'SA_REP', 9500, 0.15, 147, 80),
(164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', CONVERT(DATE, '2000-01-24', 120), 'SA_REP', 7200, 0.10, 147, 80),
(165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', CONVERT(DATE, '2000-02-23', 120), 'SA_REP', 6800, 0.10, 147, 80),
(166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', CONVERT(DATE, '2000-03-24', 120), 'SA_REP', 6400, 0.10, 147, 80),
(167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', CONVERT(DATE, '2000-04-21', 120), 'SA_REP', 6200, 0.10, 147, 80),
(168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', CONVERT(DATE, '1997-03-11', 120), 'SA_REP', 11500, 0.25, 148, 80),
(169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', CONVERT(DATE, '1998-03-23', 120), 'SA_REP', 10000, 0.20, 148, 80),
(170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', CONVERT(DATE, '1998-01-24', 120), 'SA_REP', 9600, 0.20, 148, 80),
(171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', CONVERT(DATE, '1999-02-23', 120), 'SA_REP', 7400, 0.15, 148, 80),
(172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', CONVERT(DATE, '1999-03-24', 120), 'SA_REP', 7300, 0.15, 148, 80),
(173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', CONVERT(DATE, '2000-04-21', 120), 'SA_REP', 6100, 0.10, 148, 80),
(174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', CONVERT(DATE, '1996-05-11', 120), 'SA_REP', 11000, 0.30, 149, 80),
(175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', CONVERT(DATE, '1997-03-19', 120), 'SA_REP', 8800, 0.25, 149, 80),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', CONVERT(DATE, '1998-03-24', 120), 'SA_REP', 8600, 0.20, 149, 80),
(177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', CONVERT(DATE, '1998-04-23', 120), 'SA_REP', 8400, 0.20, 149, 80),
(178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', CONVERT(DATE, '1999-05-24', 120), 'SA_REP', 7000, 0.15, 149, NULL),
(179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', CONVERT(DATE, '2000-01-04', 120), 'SA_REP', 6200, 0.10, 149, 80),
(180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', CONVERT(DATE, '1998-01-24', 120), 'SH_CLERK', 3200, NULL, 120, 50),
(181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', CONVERT(DATE, '1998-02-23', 120), 'SH_CLERK', 3100, NULL, 120, 50),
(182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', CONVERT(DATE, '1999-06-21', 120), 'SH_CLERK', 2500, NULL, 120, 50),
(183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', CONVERT(DATE, '2000-02-03', 120), 'SH_CLERK', 2800, NULL, 120, 50),
(184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', CONVERT(DATE, '1996-01-27', 120), 'SH_CLERK', 4200, NULL, 121, 50),
(185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', CONVERT(DATE, '1997-02-20', 120), 'SH_CLERK', 4100, NULL, 121, 50),
(186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', CONVERT(DATE, '1998-06-24', 120), 'SH_CLERK', 3400, NULL, 121, 50),
(187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', CONVERT(DATE, '1999-02-07', 120), 'SH_CLERK', 3000, NULL, 121, 50),
(188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', CONVERT(DATE, '1997-06-14', 120), 'SH_CLERK', 3800, NULL, 122, 50),
(189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', CONVERT(DATE, '1997-08-13', 120), 'SH_CLERK', 3600, NULL, 122, 50),
(190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', CONVERT(DATE, '1998-07-11', 120), 'SH_CLERK', 2900, NULL, 122, 50);


INSERT INTO data.employees
VALUES (
	191,
	'Randall',
	'Perkins',
	'RPERKINS',
	'650.505.4876',
	CONVERT(DATE, '1999-12-19', 23),
	'SH_CLERK',
	2500,
	NULL,
	122,
	50
	);

INSERT INTO data.employees
VALUES (
	192,
	'Sarah',
	'Bell',
	'SBELL',
	'650.501.1876',
	CONVERT(DATE, '1996-02-04', 23),
	'SH_CLERK',
	4000,
	NULL,
	123,
	50
	);

INSERT INTO data.employees
VALUES (
	193,
	'Britney',
	'Everett',
	'BEVERETT',
	'650.501.2876',
	CONVERT(DATE, '1997-03-03', 23),
	'SH_CLERK',
	3900,
	NULL,
	123,
	50
	);

INSERT INTO data.employees
VALUES (
	194,
	'Samuel',
	'McCain',
	'SMCCAIN',
	'650.501.3876',
	CONVERT(DATE, '1998-07-01', 23),
	'SH_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO data.employees
VALUES (
	195,
	'Vance',
	'Jones',
	'VJONES',
	'650.501.4876',
	CONVERT(DATE, '1999-03-17', 23),
	'SH_CLERK',
	2800,
	NULL,
	123,
	50
	);

INSERT INTO data.employees
VALUES (
	196,
	'Alana',
	'Walsh',
	'AWALSH',
	'650.507.9811',
	CONVERT(DATE, '1998-04-24', 23),
	'SH_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO data.employees
VALUES (
	197,
	'Kevin',
	'Feeney',
	'KFEENEY',
	'650.507.9822',
	CONVERT(DATE, '1998-05-23', 23),
	'SH_CLERK',
	3000,
	NULL,
	124,
	50
	);

INSERT INTO data.employees
VALUES (
	198,
	'Donald',
	'OConnell',
	'DOCONNEL',
	'650.507.9833',
	CONVERT(DATE, '1999-06-21', 23),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO data.employees
VALUES (
	199,
	'Douglas',
	'Grant',
	'DGRANT',
	'650.507.9844',
	CONVERT(DATE, '2000-01-13', 23),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO data.employees
VALUES (
	200,
	'Jennifer',
	'Whalen',
	'JWHALEN',
	'515.123.4444',
	CONVERT(DATE, '1987-09-17', 23),
	'AD_ASST',
	4400,
	NULL,
	101,
	10
	);

INSERT INTO data.employees
VALUES (
	201,
	'Michael',
	'Hartstein',
	'MHARTSTE',
	'515.123.5555',
	CONVERT(DATE, '1996-02-17', 23),
	'MK_MAN',
	13000,
	NULL,
	100,
	20
	);

INSERT INTO data.employees
VALUES (
	202,
	'Pat',
	'Fay',
	'PFAY',
	'603.123.6666',
	CONVERT(DATE, '1997-08-17', 23),
	'MK_REP',
	6000,
	NULL,
	201,
	20
	);

INSERT INTO data.employees
VALUES (
	203,
	'Susan',
	'Mavris',
	'SMAVRIS',
	'515.123.7777',
	CONVERT(DATE, '1994-06-07', 23),
	'HR_REP',
	6500,
	NULL,
	101,
	40
	);

INSERT INTO data.employees
VALUES (
	204,
	'Hermann',
	'Baer',
	'HBAER',
	'515.123.8888',
	CONVERT(DATE, '1994-06-07', 23),
	'PR_REP',
	10000,
	NULL,
	101,
	70
	);

INSERT INTO data.employees
VALUES (
	205,
	'Shelley',
	'Higgins',
	'SHIGGINS',
	'515.123.8080',
	CONVERT(DATE, '1994-06-07', 23),
	'AC_MGR',
	12000,
	NULL,
	101,
	110
	);

INSERT INTO data.employees
VALUES (
	206,
	'William',
	'Gietz',
	'WGIETZ',
	'515.123.8181',
	CONVERT(DATE, '1994-06-07', 23),
	'AC_ACCOUNT',
	8300,
	NULL,
	205,
	110
	);


INSERT INTO data.job_history
VALUES (
	102,
	CONVERT(DATE, '1993-01-13', 23),
	CONVERT(DATE, '1998-07-24', 23),
	'IT_PROG',
	60
	);

INSERT INTO data.job_history
VALUES (
	101,
	CONVERT(DATE, '1989-09-21', 23),
	CONVERT(DATE, '1993-10-27', 23),
	'AC_ACCOUNT',
	110
	);

INSERT INTO data.job_history
VALUES (
	101,
	CONVERT(DATE, '1993-10-28', 23),
	CONVERT(DATE, '1997-03-15', 23),
	'AC_MGR',
	110
	);

INSERT INTO data.job_history
VALUES (
	201,
	CONVERT(DATE, '1996-02-27', 23),
	CONVERT(DATE, '1999-12-19', 23),
	'MK_REP',
	20
	);

INSERT INTO data.job_history
VALUES (
	114,
	CONVERT(DATE, '1998-03-24', 23),
	CONVERT(DATE, '1999-12-31', 23),
	'ST_CLERK',
	50
	);

INSERT INTO data.job_history
VALUES (
	122,
	CONVERT(DATE, '1999-01-01', 23),
	CONVERT(DATE, '1999-12-31', 23),
	'ST_CLERK',
	50
	);

INSERT INTO data.job_history
VALUES (
	200,
	CONVERT(DATE, '1987-09-17', 23),
	CONVERT(DATE, '1993-06-17', 23),
	'AD_ASST',
	90
	);

INSERT INTO data.job_history
VALUES (
	176,
	CONVERT(DATE, '1998-03-24', 23),
	CONVERT(DATE, '1998-12-31', 23),
	'SA_REP',
	80
	);

INSERT INTO data.job_history
VALUES (
	176,
	CONVERT(DATE, '1999-01-01', 23),
	CONVERT(DATE, '1999-12-31', 23),
	'SA_MAN',
	80
	);

INSERT INTO data.job_history
VALUES (
	200,
	CONVERT(DATE, '1994-07-01', 23),
	CONVERT(DATE, '1998-12-31', 23),
	'AC_ACCOUNT',
	90
	);

select * from data.job_history;

ALTER TABLE data.countries ADD FOREIGN KEY (region_id) REFERENCES data.regions(region_id);    
ALTER TABLE data.locations ADD FOREIGN KEY (country_id) REFERENCES data.countries(country_id);
ALTER TABLE data.departments ADD FOREIGN KEY (location_id) REFERENCES data.locations(location_id);
ALTER TABLE data.employees ADD FOREIGN KEY (job_id) REFERENCES data.jobs(job_id);
ALTER TABLE data.employees ADD FOREIGN KEY (department_id) REFERENCES data.departments(department_id);
ALTER TABLE data.employees ADD FOREIGN KEY (manager_id) REFERENCES data.employees(employee_id);
ALTER TABLE data.departments ADD FOREIGN KEY (manager_id) REFERENCES data.employees (employee_id);
ALTER TABLE data.job_history ADD FOREIGN KEY (employee_id) REFERENCES data.employees(employee_id);
ALTER TABLE data.job_history ADD FOREIGN KEY (job_id) REFERENCES data.jobs(job_id);
ALTER TABLE data.job_history ADD FOREIGN KEY (department_id) REFERENCES data.departments(department_id);