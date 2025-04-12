function [w, b, train_err, loo_err] = train_rls_loo(X, y, lambda)
    [m,d]=size(X);
    X_1=[ones(m,1),X];
    loo_err=0;
    C=X_1'*X_1+lambda * eye(d + 1);
    C_inv=pinv(C);
    W=C_inv*(X_1'*y);
    b=W(1);
    w=W(2:end);
    y_training=X_1*W;
    train_err=sum((y_training-y).^2)/m;
    for i= 1:m
        x_i=X_1(i,:)';
        % c_i_inv=C+(C_inv*x_i*x_i'*C_inv)/(1-x_i'*C_inv*x_i);
        w_i=W+C_inv*x_i*(x_i'*W-y(i))/(1-x_i'*C_inv*x_i);
        y_loo=w_i'*x_i-y(i);
        loo_err=loo_err+y_loo^2;
    end    
    loo_err=loo_err/m;
end

