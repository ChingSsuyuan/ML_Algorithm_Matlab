X = [1 3;
     1 7;
     0 5;
     2 5];

mu = mean(X);

X_centered = X - mu;
disp(X_centered')
Sigma = (X_centered' * X_centered) / size(X, 1);  

% 输出协方差矩阵
disp('协方差矩阵 Σ 为：');
disp(Sigma);