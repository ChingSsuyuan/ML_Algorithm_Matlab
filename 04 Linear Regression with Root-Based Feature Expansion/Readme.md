#  Linear Regression with Root-Based Feature Expansion

##  Problem Overview

We implement a **linear regression** model that expands input features using fractional powers (roots). Instead of learning only on the original feature space \( x_1, x_2,....., x_d \), we extend it with fractional root features:

$$
\hat{y} = w_1 x_1 + \cdots + w_d x_d + w_{d+1} x_1^{1/2} + \cdots + w_{2d} x_d^{1/2} + \cdots + w_{dk} x_d^{1/k} + b
$$


---

##  Feature Expansion

To support this model, we expand the original data matrix \( X \in \mathbb{R}^{n \times d} \) to include:

$$
\phi(X) = \left[ X,\ X^{1/2},\ X^{1/3},\ \dots,\ X^{1/k} \right] \in \mathbb{R}^{n \times (d \cdot k)}
$$


---

##  Function Prototype

```matlab
[X_poly] = generate_poly_features(X, k)

This project uses the **California Housing** dataset (`cadata_train_test.mat`), which includes a **random train/test split** of the UCI Housing dataset. The goal is to **predict the median house value** from normalized features (values scaled to the range [0, 1]).

##  Files

- `cadata_train_test.mat`  
  Contains training and test sets from the normalized housing dataset.

- `train_rls_loo.m`  
  Trains a Regularized Least Squares (RLS) regressor and computes Leave-One-Out Cross-Validation (LOOCV) error.

- `cadata_tester.m`  
  Main script to:
  - Generate root features (degree 1 to 10)
  - Train RLS regressors
  - Compute and plot:
    - Training error
    - Test error
    - LOOCV error