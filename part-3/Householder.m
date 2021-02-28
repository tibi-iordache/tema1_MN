function [Q, R] = Householder(A)
	[m n] = size(A);
    
    %initializez Q
    Q = eye(m);
    
    % parcurg fiecare coloana din A
    for i = 1 : n
        % vectorul vp
        v = zeros(m, 1);
        
        % elementul ce contine sigma
        v(i) = A(i, i) + sign( A(i, i) ) * norm( A(i : m, i) );
        
        % restul elementelor
        v(i + 1 : m) = A(i + 1 : m, i);
        
        % reflectorul householder
        H = eye(m) - 2 * v * v' / (v' * v);
        
        % actualizez A
        A = H * A;
        
        % actualizez Q
        Q = Q * H;
    endfor
    R = A;
endfunction