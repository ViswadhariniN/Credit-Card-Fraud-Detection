-- ============================================================
-- CREDIT CARD FRAUD DETECTION
-- WEEK 1 - SQL DATA EXTRACTION AND ANALYSIS
-- ============================================================

USE fraud_detection;


-- 1. Total number of transactions
SELECT 
    COUNT(*) AS total_transactions
FROM credit_card_transactions;


-- 2. Transaction count by class
-- Class 0 = Legitimate
-- Class 1 = Fraudulent
SELECT 
    Class,
    COUNT(*) AS transaction_count
FROM credit_card_transactions
GROUP BY Class;


-- 3. Fraud rate
SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        4
    ) AS fraud_rate_percent
FROM credit_card_transactions;


-- 4. Duplicate record check
SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(DISTINCT CONCAT_WS('|',
        Time, V1, V2, V3, V4, V5, V6, V7, V8, V9,
        V10, V11, V12, V13, V14, V15, V16, V17, V18, V19,
        V20, V21, V22, V23, V24, V25, V26, V27, V28,
        Amount, Class
    )) AS duplicate_records
FROM credit_card_transactions;


-- 5. Missing-value check
SELECT 
    COUNT(*) AS rows_with_missing_values
FROM credit_card_transactions
WHERE Time IS NULL
   OR Amount IS NULL
   OR Class IS NULL;


-- 6. Average transaction amount by class
SELECT
    Class,
    COUNT(*) AS transaction_count,
    ROUND(AVG(Amount), 2) AS average_amount
FROM credit_card_transactions
GROUP BY Class;


-- 7. Maximum transaction amount by class
SELECT
    Class,
    ROUND(MAX(Amount), 2) AS maximum_amount
FROM credit_card_transactions
GROUP BY Class;