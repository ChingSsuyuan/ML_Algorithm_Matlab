# 📘 Incremental Regularized Least Squares (iRLS)

This project implements an **incremental version** of the Regularized Least Squares (RLS, or ridge regression) algorithm.

Instead of solving the RLS problem from scratch using the entire dataset, we construct the optimal solution **incrementally**, using **one sample at a time**.

---

## 🧮 Objective Function

We aim to solve:

$$
\min_{w,b} \sum_{i=1}^m (w^\top x_i + b - y_i)^2 + \lambda \|w\|_2^2 + \epsilon b^2
$$


This is a generalization of **Least Squares** (LS), where LS is equivalent to RLS with \( lambda = 0 \), \( epsilon = 0 \).
![Each update for w_i](Images/w_i_formula.png)
---

## 🚀 Incremental Algorithm Strategy

Instead of recomputing the entire solution every time a new training sample is added, we **update the existing solution**:

### Steps:

1. **Start with 1 sample**: Solve the RLS problem for the first data point.
2. **Add samples one-by-one**: For each new training point \( (x_{n+1}, y_{n+1}) \), update the existing solution \( \tilde{w}_n \to \tilde{w}_{n+1} \) without recomputing from scratch.
3. **Track covariance matrix \( C \)**: Maintain and update matrix \( C = X^\top X + \lambda I \), where \( X \in \mathbb{R}^{n \times d} \) is the matrix of input samples.

---

## 🔁 Matrix Update via Sherman-Morrison Formula

To efficiently update the inverse of the covariance matrix:

We use the **Sherman-Morrison formula** to compute:

$$
(C_n + u v^\top)^{-1} = C_n^{-1} - \frac{C_n^{-1} u v^\top C_n^{-1}}{1 + v^\top C_n^{-1} u}
$$

Set \( u = v = x_{n+1} \) to compute \( C_{n+1}^{-1} \) from \( C_n^{-1} \), which enables us to **incrementally update** the solution.

---

## ✅ Benefits of iRLS

- Efficient for **online learning** and **streaming data**
- Avoids recomputing full matrix inverse
- Naturally scales with data arrival

---

## 📌 Summary

This approach builds up the RLS solution step-by-step using:
- Algebraic manipulation of the RLS solution
- Matrix updates via Sherman-Morrison
- A memory-efficient and computationally efficient framework

## 📄 File: `verifyalgorithms.m`

This file is designed to **numerically verify** that the solutions obtained from the standard **Regularized Least Squares (RLS)** algorithm (`train_rls.m`) and the **Incremental RLS** algorithm (`incremental_train_rls.m`) are equivalent.