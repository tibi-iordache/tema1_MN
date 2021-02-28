function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
    n = length(G_rowptr) - 1;
    % prev_x = Vectorul initial cu care se aprox  solutia
    prev_x = zeros(1, n);
    
    while 1
        % calculez x
        x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
        %calculez eroarea
        err = norm(x - prev_x);
        
        % guard
        if (err < tol)
            return;
        endif
        
        %salvez x
        prev_x = x;
    endwhile
endfunction