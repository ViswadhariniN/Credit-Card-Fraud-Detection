# Credit Card Fraud Detection Using Machine Learning

## Project Overview

This project focuses on detecting fraudulent credit card transactions using machine learning. The analysis was performed using the Credit Card Fraud Detection dataset and includes data preprocessing, exploratory data analysis, feature analysis, model development, evaluation, and fraud prediction.

The project also includes an interactive Power BI dashboard for analyzing fraud patterns and a Gradio-based interface for demonstrating fraud prediction.

## Dataset

The project uses the Credit Card Fraud Detection dataset from Kaggle.

- Total transactions: 284,807
- Original columns: 31
- Features: Time, V1–V28, Amount
- Target variable: Class
- Legitimate transactions: 284,315
- Fraudulent transactions: 492
- Fraud rate: 0.1727%

The dataset is highly imbalanced because fraudulent transactions represent a very small proportion of all transactions.

## Data Preparation

The following preprocessing steps were performed:

- Loaded and inspected the dataset using Pandas
- Checked data types and missing values
- Identified and removed 1,081 duplicate records
- Final dataset after duplicate removal: 283,726 unique transactions
- Separated features and target variable
- Applied stratified train, validation, and test splitting
- Standardized numerical features using StandardScaler

## Exploratory Data Analysis

The analysis explored:

- Fraud vs legitimate transaction distribution
- Transaction amount distribution
- Transaction amount differences between fraud and legitimate transactions
- Transaction time patterns
- Feature correlations
- Differences in feature behavior between fraudulent and legitimate transactions

The EDA confirmed the severe class imbalance and showed that fraudulent transactions have different patterns across several anonymized features.

## Machine Learning Model

A Logistic Regression classifier was developed for fraud detection.

### Model Configuration

- Algorithm: Logistic Regression
- Class balancing: `class_weight='balanced'`
- Feature scaling: StandardScaler
- Random state: 42
- Maximum iterations: 1000
- Classification threshold: Selected using validation data based on F1-score

A separate validation set was used to select the classification threshold before evaluating the final model on the unseen test set.

## Model Performance

The final model achieved the following results on the unseen test data:

| Metric | Score |
|---|---:|
| ROC-AUC | 0.9737 |
| Fraud Precision | 0.78 |
| Fraud Recall | 0.82 |
| Fraud F1-score | 0.80 |

### Confusion Matrix

```text
[[56842, 22],
 [18, 80]]
