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

function [best_CCR, best_threshold] = find_best_CCR(z, y)
    z_sorted = sort(z);
    thresholds = [];
    for i = 1:(length(z_sorted)-1)
        thresholds = [thresholds; (z_sorted(i) + z_sorted(i+1))/2];
    end
    thresholds = [z_sorted(1)-0.1; thresholds; z_sorted(end)+0.1];
    best_CCR = 0;
    best_threshold = 0;
    
    for i = 1:length(thresholds)
        t = thresholds(i);
        pred1 = 2*(z > t) - 1; 
        CCR1 = sum(pred1 == y) / length(y);
     
        pred2 = 2*(z < t) - 1;
        CCR2 = sum(pred2 == y) / length(y);
        CCR = max(CCR1, CCR2);
        
        if CCR > best_CCR
            best_CCR = CCR;
            best_threshold = t;
        end
    end
end
[CCR1, t1] = find_best_CCR(z1, y);
fprintf('\nFirst Priciple Max CCR: %.2f threshold = %.4f\n', CCR1, t1);

[CCR2, t2] = find_best_CCR(z2, y);
fprintf('Second Priciple Max: %.2f threshold = %.4f\n', CCR2, t2);