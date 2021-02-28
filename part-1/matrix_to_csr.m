function [values, colind, rowptr] = matrix_to_csr(A)
    % nr de linii din matrice
    n = length(A);
    % nr de valori nenule din matrice
    nz = length(A(A ~= 0));
    
    % vectorul ce contine valorile nenule
    values = A'(A' ~= 0)';

    % initializez vectorul colind
    colind = zeros(1, nz);
    
    % index care ma ajuta la completarea vectorului colind
    idx = 1;
    % vector care ma ajuta la completarea vect rowptr
    % contine cate elemente se afla pe o linie
    lungime = zeros(1, n);
    
    % parcurg matricea
    for i = 1 : n
        for j = 1 : n
            % guard
            if (idx > length(values))
                break
            endif
            
            % daca am gasit o valoare
            if (A(i, j) == values(idx))
                % ii salvez indexul
                colind(idx) = j;
                % maresc idx
                idx++;
                % maresc lungime(i)
                lungime(i)++;
            endif
        endfor
    endfor
    
    % initializez rowptr
    rowptr = zeros(1, n + 1);
    % ultima pozitie contine nz + 1
    rowptr(n + 1) = nz + 1;
    
    % vector ce va contine primul element de pe fiecare linie a matricei
    prim = zeros(1, n + 1);
    
    % parcurg fiecare linie
    for i = 1 : n
        % extrag elementele nenule
        vec = A(i, :)';
        vec = vec(vec ~= 0);
        
        % pun primul element nenul in vect prim
        prim(i) = vec(1);
    endfor
    
    idx = 1;
    idx2 = 1;
    
    while 1
        % guard
        if (idx2 > length(values))
            break;
        endif
        
        if (prim(idx) == values(idx2))
            % ii salvez indicele
            rowptr(idx) = idx2;
            
            % incrementez indicii
            idx++;
            idx2 += lungime(idx - 1);
        else
            idx2++;
        endif
    endwhile
    
endfunction