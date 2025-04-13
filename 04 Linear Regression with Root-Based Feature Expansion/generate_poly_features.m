function X_poly = generate_poly_features(X, k)
    [m,d]=size(X);
    X_poly=zeros(m,d*k);
    for i=1:d
        for j=1:k
            X_poly(:,(i-1)*k+j)=X(:,i).^(1/j);
        end
    end
end