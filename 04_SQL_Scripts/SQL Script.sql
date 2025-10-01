use banking_data;
show tables;
select * from bank_loans_data;
select * from transactions;

-- KPI's
-- 1. Total loan amount
SELECT SUM(loan_amount) AS total_loan_amount
FROM bank_loans_data;
-- 2. Total funded amount
SELECT SUM(funded_amount) AS total_loan_amount_funded
FROM bank_loans_data;
-- 3. Total interest amount
SELECT SUM(total_rec_int) AS total_interest_received
FROM bank_loans_data;
-- 4. Total  payment
SELECT SUM(total_pymnt) AS total_payment_received
FROM bank_loans_data;
--
-- 5. Monthly Disbursement
SELECT 
  MONTHNAME(disbursement_date) AS disbursement_month,
  SUM(funded_amount) AS total_disbursed
FROM bank_loans_data
GROUP BY 
  MONTH(disbursement_date), 
  MONTHNAME(disbursement_date)
ORDER BY MONTH(disbursement_date);

-- 6. State wise loan
SELECT 
  state_name,
  SUM(loan_amount) AS total_loan_amount
FROM bank_loans_data
GROUP BY state_name;

-- 7. age group wise loan
SELECT 
  age_group,
  SUM(loan_amount) AS total_amount
FROM bank_loans_data
GROUP BY age_group;

-- 8. branch wise performance
SELECT 
  branch_name,
  SUM(total_rec_int) AS total_interest,
  SUM(total_fees) AS total_fees,
  SUM(total_rec_prncp + total_rec_int + total_fees) AS total_revenue
FROM bank_loans_data
GROUP BY branch_name;

-- 9.Product Group-Wise Loan
SELECT 
  product_code,
  SUM(loan_amount) AS total_loan_amount,
  COUNT(*) AS loan_count
FROM bank_loans_data
GROUP BY product_code;

-- 10. Loan category wise 
SELECT 
  CASE 
    WHEN loan_status = 'Active Loan' THEN 'Active'
    WHEN loan_status IN ('NPA', 'Write Off') THEN 'Default'
    WHEN loan_status IN (
      'Fully Paid', 'Paid Off', 'Cancelled', 
      'Insurance Paid Off', 'Net-Off', 'Transferred'
    ) THEN 'Closed'
    ELSE 'Other'
  END AS loan_category,
  COUNT(DISTINCT client_id) AS client_count
FROM bank_loans_data
GROUP BY loan_category;

-- credit debit banking data kpi
select * from transactions;
-- 1.Total Credit Amount
SELECT SUM(amount) AS total_credit_amount
FROM transactions
WHERE transaction_type = 'Credit';

-- 2. Total Debit Amount
SELECT SUM(amount) AS total_debit_amount
FROM transactions
WHERE transaction_type = 'Debit';

-- 3. credit debit ratio
SELECT 
  ROUND(
    SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE 0 END) / 
    NULLIF(SUM(CASE WHEN transaction_type = 'Debit' THEN amount ELSE 0 END), 0), 
    2
  ) AS credit_debit_ratio
FROM transactions;

-- 4.Net Transaction Amount (Credit - Debit)
SELECT 
  SUM(CASE 
        WHEN transaction_type = 'Credit' THEN amount 
        WHEN transaction_type = 'Debit' THEN -amount 
        ELSE 0 
      END) AS net_transaction_amount
FROM transactions;

-- 5.Number of Credit and Debit Transactions
SELECT 
  transaction_type, 
  COUNT(*) AS total_transactions
FROM transactions
WHERE transaction_type IN ('Credit', 'Debit')
GROUP BY transaction_type;

-- 6. Credit and Debit by Branch
SELECT 
  branch,
  transaction_type,
  SUM(amount) AS total_amount
FROM transactions
WHERE transaction_type IN ('Credit', 'Debit')
GROUP BY branch, transaction_type
ORDER BY branch;

-- 7. Credit and Debit Over Time (Monthly)
SELECT 
  DATE_FORMAT(transaction_date, '%Y-%m') AS month,
  transaction_type,
  SUM(amount) AS total_amount
FROM transactions
WHERE transaction_type IN ('Credit', 'Debit')
GROUP BY month, transaction_type
ORDER BY month;

-- 8. Credit vs Debit by Bank
SELECT 
  bank_name,
  transaction_type,
  SUM(amount) AS total_amount
FROM transactions
WHERE transaction_type IN ('Credit', 'Debit')
GROUP BY bank_name, transaction_type
ORDER BY bank_name;

-- 9.  Daily Net Cash Flow
SELECT 
  DATE(transaction_date) AS date,
  SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE 0 END) AS total_credit,
  SUM(CASE WHEN transaction_type = 'Debit' THEN amount ELSE 0 END) AS total_debit,
  SUM(CASE WHEN transaction_type = 'Credit' THEN amount ELSE -amount END) AS net_cash_flow
FROM transactions
GROUP BY DATE(transaction_date)
ORDER BY DATE(transaction_date);

-- 10. Average Transaction Amount by Type
SELECT 
  transaction_type,
  ROUND(AVG(amount), 2) AS avg_transaction_amount
FROM transactions
WHERE transaction_type IN ('Credit', 'Debit')
GROUP BY transaction_type;

