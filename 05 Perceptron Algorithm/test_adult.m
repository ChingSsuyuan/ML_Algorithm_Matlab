function test_adult()
    load('adult_data.mat');
    num_runs = 10;
    acc_last = zeros(num_runs,1);
    acc_avg = zeros(num_runs,1);
end