function [w] = learn(X, y)
    [linii coloane] = size(X);
    
    % initializez x_til si ii pun coloana de 1 la final
    X_til = zeros(linii, coloane + 1);
    
    X_til(:, 1 : end - 1) = X;
    X_til(:, end) = 1;
    
    % initializez w
    w = zeros(coloane + 1, 1);
    
    % descompun X_til
    [Q R] = Householder(X_til);
    
    % rezolv sistemul 
    w = SST(R, Q' * y);
end
