# Perceptron Algorithm on Adult UCI Dataset

This project implements the **Perceptron algorithm** for binary classification and evaluates its performance on the **Adult UCI dataset**, where the task is to predict whether a person earns more than \$50K per year based on various features.

---

## 📌 Task Description

- Given:
  - `X ∈ ℝ^{m×d}`: Matrix of input features (m samples, d dimensions).
  - `y ∈ {−1, +1}^m`: Column vector of binary class labels.
- Goal:
  - Train a Perceptron classifier with **bias term `b`** using the **augmented trick** (i.e., appending 1 to each feature vector).
  - Perform **one pass** over the data.
  - Track both:
    - The **last solution**: `w`, `b`
    - The **averaged solution**: `average_w`, `average_b`

---

## 🧠 Perceptron Algorithm

### Function Signature

```matlab
[w, b, average_w, average_b] = train_perceptron(X, y)
