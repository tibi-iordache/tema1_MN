function [G_J, c_J] = Jacobi_factorization(A, b)
    % matricea diagonala
    N = diag(diag(A));
    
    % elementele care se afla deasupra si sub diag principala
    P = N - A;
    
    % matricea de iteratie
    G_J = inv(N) * P;
    
    % vectorul de iteratie
    c_J = inv(N) * b;
endfunction