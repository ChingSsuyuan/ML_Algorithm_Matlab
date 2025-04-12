
# RLS with Leave-One-Out Cross-Validation (LOOCV)

This repository implements **Regularized Least Squares (RLS)** with **Leave-One-Out Cross-Validation (LOOCV)** efficiently, leveraging the **Sherman-Morrison formula** for fast updates.

## 📘 Background

In RLS, we aim to minimize the regularized least squares loss:

$$
\min_{w, b} \|Xw + b - y\|^2 + \lambda \|w\|^2
$$

Where:
- `X ∈ ℝ^{n×d}`: Input data with `n` samples and `d` features
- `y ∈ ℝ^n`: Target labels
- `w ∈ ℝ^d`: Weight vector
- `b ∈ ℝ`: Bias term
- `λ > 0`: Regularization parameter

<img src="Images/w_i_formula.jpg" alt="模型图" width="400"/>
## 🧠 Hint

To efficiently compute the **Leave-One-Out Cross-Validation (LOOCV)** error without retraining the model `n` times, we use the **Sherman-Morrison formula**. This allows the inverse of the Gram matrix to be updated incrementally by removing the influence of a single data point.

---

## 🚀 Function Description

```matlab
[w, b, train_err, loo_err] = train_rls_loo(X, y, lambda)