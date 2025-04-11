function [w, b] = train_rls(X, y, lambda, epsilon)
    [m,d]=size(X);
    X_1=[ones(m,1),X];
    Q=[epsilon,zeros(1,d);zeros(d,1),lambda*eye(d)];
    C=X_1'*X_1+Q;
    W=pinv(C)*(X_1'*y);
    b=W(1);
    w=W(2:end);
end

