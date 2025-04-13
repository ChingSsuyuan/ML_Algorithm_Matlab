function test_adult()
    load('adult_data.mat');
    num_runs = 10;
    acc_last = zeros(num_runs,1);
    acc_avg = zeros(num_runs,1);

    for run = 1:num_runs
        m = size(X_train, 1);
        idx = randperm(m);
        X_train_shuffled = X_train(idx, :);
        y_train_shuffled = y_train(idx);
        [w, b, average_w, average_b] = train_perceptron(X_train_shuffled, y_train_shuffled);
        y_pred_last = sign(X_test * w + b);
        acc_last(run) = mean(y_pred_last == y_test);
    end
end