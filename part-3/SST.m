function [x] = SST(A, b)
    [n m] = size(A);
    
    %initializez solutia
    x = zeros(m, 1);
    
    if (n > m)
        % calculez ultimul element
        x(m) = b(m) / A(m, m);
        
        % rezolv de jos in sus
        for i = m - 1 : -1 : 1 
            x(i) = ( b(i) - A(i, i + 1 : m) * x(i + 1 : m) ) / A(i, i);
        endfor
    elseif (n < m)
        % nu se poate rezolva
        return;
    else
        % calculez ultimul element
        x(n) = b(n) / A(n, n);
        
        % rezolv de jos in sus
        for i = n - 1 : -1 : 1
            x(i)=( b(i) - A(i, i + 1 : n) * x(i + 1 : n) ) / A(i, i);
        endfor
    endif
end
    