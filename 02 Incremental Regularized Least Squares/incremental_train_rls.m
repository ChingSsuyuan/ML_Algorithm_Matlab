function [w, b] = incremental_train_rls(X, y, lambda, epsilon)
    [m,d]=size(X);
    X_1=[ones(m,1),X];
    Q=[epsilon,zeros(1,d);zeros(d,1),lambda*eye(d)];
    C=X_1'*X_1+Q;
    W=pinv(C)*(X_1'*y);
    for i =2:m
        X_2=X_1(i,:)';
        Y_2=y(i);
        C_2=pinv(C)-(pinv(C)*X_2*X_2'*pinv(C))/(1+X_2'*pinv(C)*X_2);
        W=W+C_2*X_2*(Y_2-X_2'*W);
    end
    b=W(1);
    w=W(2:end);
end