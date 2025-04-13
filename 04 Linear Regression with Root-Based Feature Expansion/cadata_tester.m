clear all
close all

load cadata_train_test
train_err_array = zeros(1, 10);
loo_err_array = zeros(1, 10);
test_err_array = zeros(1, 10);

for k=1:10
    [Xtrain_poly]=generate_poly_features(Xtrain_norm,k);
    [Xtest_poly]=generate_poly_features(Xtest_norm,k);
    
    [w,b,train_err,loo_err]=train_rls_loo(Xtrain_poly,ytrain,1e-3);
    train_err_array(k)=train_err;
    loo_err_array(k)=loo_err;
    test_err_array(k)=mean((ytest-Xtest_poly*w-b).^2);
end

plot(train_err_array,'r')
hold on
plot(loo_err_array,'b')
plot(test_err_array,'k')
xlabel('k')
ylabel('Errors')
legend('Training error', 'LOOCV error', 'Testing error')
fprintf('Results for each k:\n');
