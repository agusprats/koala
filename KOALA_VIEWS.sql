USE KOALA_COMPANY;

CREATE OR REPLACE VIEW VW_SALARY AS
(SELECT * FROM SALARY); 

CREATE OR REPLACE VIEW VW_SALARY_INSURANCE AS
(SELECT SALARY, MEDICAL_INSURANCE 
FROM SALARY
WHERE SALARY > 1000
AND MEDICAL_INSURANCE = 'OSDE');

CREATE OR REPLACE VIEW VW_SALARY_EMPLOYEE AS
(SELECT S.SALARY, S.MEDICAL_INSURANCE, E.EMPLOYEE_ID, E.EMPLOYEE_NAME
FROM SALARY AS S INNER JOIN EMPLOYEES AS E
ON S.EMPLOYEE_ID = E.EMPLOYEE_ID 
WHERE SALARY >= 1000
AND MEDICAL_INSURANCE IN ('ACCORD','OSDE'));

CREATE OR REPLACE VIEW VW_PROJECT_EMPLOYEE AS
(SELECT P.PROJECT_NAME, E.EMPLOYEE_ID, E.EMPLOYEE_NAME
FROM PROJECT AS P INNER JOIN EMPLOYEES AS E
ON P.EMPLOYEE_ID = E.EMPLOYEE_ID 
WHERE PROJECT_NAME = 'BIGFAN'
AND TECHNOLOGIES = 'OTHER');

CREATE OR REPLACE VIEW VW_PROJECT_CLIENTS AS
(SELECT C.CLIENT_NAME, P.PROJECT_NAME, P.BUDGET, P.TECHNOLOGIES
FROM CLIENTS AS C INNER JOIN PROJECT AS P 
ON C.CLIENT_CUIT = P.CLIENT_CUIT
WHERE BUDGET > 3500
ORDER BY BUDGET
AND TECHNOLOGIES = 'OTHER');

CREATE OR REPLACE VIEW VW_QUOTATIONS_CLIENTS AS
(SELECT Q.AMOUNT, Q.QUOTATION_STATUS, Q.DESCRIPTION, C.CLIENT_NAME
FROM  QUOTATIONS AS Q INNER JOIN CLIENTS AS C
ON Q.CLIENT_CUIT = C.CLIENT_CUIT
WHERE AMOUNT > 3900
AND QUOTATION_STATUS = 'NEGOTIATION');

CREATE OR REPLACE VIEW VW_EMPLOYEES_COUNTHEAD AS
(SELECT COUNT(*) FROM EMPLOYEES
);

CREATE VIEW VW_PAYMENTS AS
(SELECT SUM(SALARY) FROM SALARY
);

CREATE VIEW VW_REVENUES AS
(SELECT SUM(AMOUNT)FROM INVOICES
);

