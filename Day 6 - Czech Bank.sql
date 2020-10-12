USE bank;

-- 2.02 Activity 1

-- Select districts where salary is greater than 10000. Return columns as district_name and average_salary.
SELECT A2 AS district_name, A11 AS average_salary FROM bank.district
WHERE A11 > 10000;

-- Select those loans whose contract finished and were not paid
SELECT * FROM bank.loan
WHERE status IN ('B');

-- Select cards of type junior. Return just first 10.
SELECT * FROM bank.card
WHERE type IN ('junior')
LIMIT 10;


-- 2.02 Activity 2

-- Select those loans whose contract finished and not paid back. Return the debt value together with loan and account ids.
SELECT amount AS Amount, account_id AS Account_ID, (amount - payments) AS Debt_value FROM bank.loan
WHERE status IN ('B');

-- Calculate the urban population for all districts. Return columns as district_name and urban_population.
SELECT A2 AS district_name, (round((A4/100)*A10)) AS urban_population, A4 AS Inhabitants FROM bank.district;

-- Filter out districts where the rural population is greater than 50%.
SELECT A2 AS district_name, A10 < 50  AS rural_population FROM bank.district;

-- 2.02 Activity 3

-- Get all junior cards issued last year.
SELECT * FROM bank.card
WHERE type IN ('junior');

-- Get the first 10 transactions for withdrawals that are not in cash.
SELECT * FROM bank.trans
WHERE type IN ("VYDAJ") AND operation NOT IN ("VKLAD")
LIMIT 10;

-- Select those loans whose contract finished and left a debt bigger than 1000. Return the debt value together with loan and account ids.
SELECT loan_id AS Loan, account_id AS Account_id, (amount - payments) AS balance FROM bank.loan
WHERE status IN ('A', 'B') AND (amount - payments) > 10000;

-- 2.02 Activity 4

-- Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).
SELECT max(account) AS MAX_account, min(account) AS MIN_Account FROM bank.trans
WHERE account != 0;

-- Get account information with an extra column year showing the opening year as 'YYYY'.
SELECT *, date_format(date,'%Y') AS year FROM bank.account;

