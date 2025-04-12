
# Linear Regression with Root-Based Feature Expansion

## 📌 Problem Summary

This project implements **linear regression from ℝᵈ to ℝ**, with an enhanced feature space using **root-based basis functions**. The goal is to transform the original feature set by appending root-powered versions of each feature, and then learn a linear predictor in the expanded feature space.

---

## 🧠 Feature Expansion

For each original input feature \( x_i \), we construct additional features based on its roots:

\[
(x_i^{1/2},\ x_i^{1/3},\ \dots,\ x_i^{1/k})
\]

These transformed features are **appended** to the original vector, resulting in a new feature vector of dimension:

\[
d_{\text{new}} = d \times (k - 1) + d = d \times k
\]

---

## 🎯 Model Form

The predictor we are learning is a **linear regression model** in the transformed space. That is, we fit:

\[
\hat{y} = w^T \phi(x) + b
\]

Where:
- \( \phi(x) \) is the root-expanded version of input \( x \)
- \( w \in \mathbb{R}^{dk} \) is the learned weight vector
- \( b \in \mathbb{R} \) is the bias term
