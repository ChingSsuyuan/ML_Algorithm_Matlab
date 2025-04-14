X = [1 3;
     1 7;
     0 5;
     2 5];

mu = mean(X);

X_centered = X - mu;
disp(X_centered')
Sigma = (X_centered' * X_centered) / size(X, 1);  

[V, D] = eig(Sigma);
phi = X_centered * v;
proj_points = mu + phi * v'
disp('Matrix Σ :');
disp(Sigma);
disp(diag(D));
disp(V);
disp(phi);