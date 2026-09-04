# Credit Card Fraud Detection Using Machine Learning

## Project Overview

This project focuses on detecting fraudulent credit card transactions using machine learning. The analysis was performed using the Credit Card Fraud Detection dataset and includes data preprocessing, exploratory data analysis, feature analysis, SQL analysis, model development, evaluation, and fraud prediction.

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

The data was divided into training, validation, and test sets to support reliable model development and evaluation.

## SQL Analysis

MySQL was used for initial data extraction and analysis.

The SQL analysis included:

- Total transaction count
- Transaction count by fraud class
- Fraud transaction rate
- Duplicate record identification
- Missing-value checks
- Average transaction amount by class
- Maximum transaction amount by class

The SQL queries used for the analysis are available in:

`week1_queries.sql`

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

A separate validation set was used to select the classification threshold before evaluating the final model on the unseen test set. This helped avoid using the test data for threshold selection.

## Model Performance

The final model achieved the following results on the unseen test data:

| Metric | Score |
|---|---:|
| ROC-AUC | 0.9737 |
| Fraud Precision | 0.78 |
| Fraud Recall | 0.82 |
| Fraud F1-score | 0.80 |

The model demonstrated strong ability to distinguish between legitimate and fraudulent transactions while maintaining a low number of false positives.

### Confusion Matrix

```text
[[56842, 22],
 [18, 80]]
```

## Top Fraud Predictors

The Logistic Regression model coefficients were analyzed to identify the features that had the strongest influence on the fraud classification.

The top predictors based on the absolute value of the model coefficients were:

| Rank | Feature | Coefficient | Importance |
|---:|---|---:|---:|
| 1 | Amount | 2.311589 | 2.311589 |
| 2 | V1 | 1.652232 | 1.652232 |
| 3 | V14 | -1.440515 | 1.440515 |
| 4 | V4 | 1.279250 | 1.279250 |
| 5 | V10 | -1.265119 | 1.265119 |
| 6 | V12 | -1.176368 | 1.176368 |
| 7 | V5 | 1.120480 | 1.120480 |
| 8 | V2 | 0.994081 | 0.994081 |
| 9 | V17 | -0.953312 | 0.953312 |
| 10 | V20 | -0.940625 | 0.940625 |

Importance was calculated using the absolute value of the Logistic Regression coefficient. Since V1–V28 are anonymized features, their coefficients indicate model influence but do not have direct business interpretations.

## Power BI Dashboard

An interactive Power BI dashboard was created to visualize transaction patterns and fraud-related trends.

The dashboard includes:

- Total transaction count
- Fraud transaction count
- Fraud rate
- Legitimate vs fraudulent transactions
- Average transaction amount by class
- Fraud rate by transaction amount
- Fraud transactions by transaction time
- Transaction amount ranges by fraud class
- Class distribution

### Dashboard Preview

![Power BI Dashboard](Power%20BI%20Dashboard.png)

## Fraud Detection Interface

A Gradio-based interface was developed to demonstrate real-time fraud prediction using the trained Logistic Regression model.

The interface accepts the 30 transaction features:

- Time
- V1–V28
- Amount

The `Class` variable is not provided as an input because it is the target that the model predicts.

The saved model, scaler, and validation-selected classification threshold are used to generate the prediction.

## Conclusion

The credit card fraud detection model was successfully developed and evaluated using the Credit Card Fraud Detection dataset.

The Logistic Regression model achieved a ROC-AUC score of **0.9737** on the unseen test data. Using the validation-selected classification threshold, the model achieved a fraud precision of **0.78**, fraud recall of **0.82**, and fraud F1-score of **0.80**.

The confusion matrix showed that the model correctly identified **80 fraudulent transactions**, while **18 fraudulent transactions** were classified as legitimate. Only **22 legitimate transactions** were incorrectly classified as fraudulent.

Overall, the model demonstrated strong fraud detection performance while maintaining a low number of false positives.

## Future Scope

The project can be further improved by:

- Testing additional machine learning algorithms such as Random Forest, XGBoost, and other ensemble methods
- Applying advanced techniques for handling severe class imbalance
- Performing hyperparameter optimization
- Exploring additional feature engineering techniques
- Deploying the fraud detection model as a web application or API
- Integrating the model with real-time transaction monitoring systems

## References

1. Kaggle — Credit Card Fraud Detection Dataset  
   https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud/data

2. Scikit-learn — Machine Learning and Model Evaluation Documentation  
   https://scikit-learn.org/stable/

3. Pandas — Python Data Analysis Library  
   https://pandas.pydata.org/docs/

4. Matplotlib — Python Visualization Library  
   https://matplotlib.org/stable/

5. Microsoft Power BI Documentation  
   https://learn.microsoft.com/en-us/power-bi/create-reports/

6. Gradio Documentation  
   https://www.gradio.app/docs/gradio/interface
