function [w,b, average_w, average_b] =  train_perceptron(X, y)
    [m,d]=size(X);
    X=[ones(m,1) X];
    w_t=zeros(d+1,1);
    average_w=zeros(d+1,1);
    C=1;
    for i=1:m
        x_i=X(i,:)';
        y_i=y(i);
        if y_i*(w_t'*x_i)<=0
            w_t=w_t+x_i*y_i;
        end
        average_w=average_w+w_t;
        C=C+1;
    end
    average_w=average_w/C;
    b=w_t(1);
    w=w_t(2:end);
    average_b=average_w(1);
    average_w=average_w(2:end);
end