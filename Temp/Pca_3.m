r = [-1; 2; -1; 0; 2];
s = [1; -1; -1; 1; 1];

X = [3*r'; r'; -r'; -3*r'; 3*s'; 2*s'; s'; -6*s'];  
y = [1; 1; 1; 1; -1; -1; -1; -1];  

Sigma = (1/8) * (20 * (r * r') + 50 * (s * s'));
[V, D] = eig(Sigma);
eigvals = diag(D);
[~, idx] = sort(eigvals, 'descend'); 

v1 = V(:, idx(1)); 
v2 = V(:, idx(2));  
z1 = X * v1;  
z2 = X * v2;  

function [CCR, best_t] = find_best_CCR(z, y)
    [zs, idx] = sort(z);
    ys = y(idx);
    max_correct = 0;
    best_t = 0;

    for i = 1:length(zs)-1
        t = (zs(i) + zs(i+1)) / 2;
        y_pred = double(z > t) * 2 - 1;
        correct = sum(y_pred == y);
        if correct > max_correct
            max_correct = correct;
            best_t = t;
        end
    end
    y_pred_all_pos = ones(size(y));
    y_pred_all_neg = -ones(size(y));
    max_correct = max([max_correct, sum(y_pred_all_pos == y), sum(y_pred_all_neg == y)]);
    
    CCR = max_correct / length(y);
end

[CCR1, t1] = find_best_CCR(z1, y);
fprintf('\nFirst Priciple Max CCR: %.2f threshold = %.4f\n', CCR1, t1);

[CCR2, t2] = find_best_CCR(z2, y);
fprintf('Second Priciple Max: %.2f threshold = %.4f\n', CCR2, t2);