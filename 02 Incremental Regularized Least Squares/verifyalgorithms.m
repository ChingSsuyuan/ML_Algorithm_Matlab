X=rand(100,2);  
y=3+2*X(:,1)-1.5*X(:,2)+0.01*randn(100,1); 

lambda = 0.1; 
epsilon = 0.1;

[w1,b1]=train_rls(X,y,lambda,epsilon);
[w2,b2]=incremental_train_rls(X,y,lambda,epsilon);
fprintf('b1: %.4f\n', b1);
fprintf('b2: %.4f\n', b2);
fprintf('w1: %.4f, %.4f\n', w1(1), w1(2));
fprintf('w2: %.4f, %.4f\n', w2(1), w2(2));