r = [-1; 2; -1; 0; 2];
s = [1; -1; -1; 1; 1];
disp('rr^T =');
disp(r * r');
disp('ss^T =');
disp(s * s');
Sigma = (1/8) * (20 * (r * r') + 50 * (s * s'));

disp('Sigma =');
disp(Sigma);

diag_elements = diag(Sigma);
disp('Diagonal of Sigma:');
disp(diag_elements);

[V, D] = eig(Sigma);
disp('Eigenvalues (diagonal of D):');
disp(diag(D));
disp('Eigenvectors (columns of V):');
disp(V);