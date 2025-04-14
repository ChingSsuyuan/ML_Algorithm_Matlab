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
figure; hold on; axis equal;
scatter(X(:,1), X(:,2), 80, 'filled', 'MarkerFaceColor', 'b');
text(X(:,1)+0.1, X(:,2), {'x1','x2','x3','x4'});
scatter(mu(1), mu(2), 100, 'k', 'filled');
text(mu(1)+0.1, mu(2), '\mu');
quiver(mu(1), mu(2), v(1)*2, v(2)*2, 'r', 'LineWidth', 2, 'MaxHeadSize', 0.5);
text(mu(1)+v(1)*2+0.1, mu(2)+v(2)*2, 'Principal Direction');
scatter(proj_points(:,1), proj_points(:,2), 80, 'filled', 'MarkerFaceColor', 'g');
for i = 1:4
    plot([X(i,1), proj_points(i,1)], [X(i,2), proj_points(i,2)], 'k--');
end

title('PCA: Projection of Data Points onto Principal Component');
xlabel('x_1'); ylabel('x_2');
legend('Original Points','Mean (\mu)','Principal Direction','Projections','Location','best');
disp('Matrix Σ :');
disp(phi);