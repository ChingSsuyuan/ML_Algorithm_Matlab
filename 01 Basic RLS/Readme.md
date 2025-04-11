# 📘 Regularized Least Squares (RLS) in MATLAB

This project implements the **Least Squares (LS)** algorithm and its generalization called **Regularized Least Squares (RLS)**, also known as **ridge regression**. The goal is to deepen understanding of these algorithms and apply linear algebra concepts through practical implementation in MATLAB.

---

## 📌 Problem Formulation

We aim to solve the following optimization problem:

<b>minimize:</b> ∑(wᵗx<sub>i</sub> + b − y<sub>i</sub>)² + λ‖w‖² + εb²

Where:
- \( x \): input features
- \( y \): target values
- \( w \): weight vector
- \( b \): bias term
- \( lambda >= 0 \): regularization parameter (controls penalty on weights)
- \( epsilon > 0 \): tiny constant added to make the solution numerically stable (set as `eps` in MATLAB)

Note:
- **Least Squares (LS)** is a special case of **RLS** with \( \lambda = 0 \) and \( \epsilon = 0 \).

---

## 🚀 MATLAB Function

### Signature

```matlab
[w, b] = train_rls(X, y, lambda, epsilon)
