function [A, b] = generate_probabilities_system(rows)
    % n = nr necunoscute/ecuatii/linii din matrice
    n = rows * (rows + 1) / 2;
    
    % initializez A si b
    A = zeros(n, n);
    b = zeros(n, 1);
    
    % pun 1 in b 
    b(n - rows + 1 : end) = 1;

    % nr de 6 de pe diag principala a matricii
    nr_mij = 0;
    it = 1;
    
    for j = 1 : (rows - 3)
        nr_mij += it++;
    endfor
    
    
    % pun 5 pe toata diagonala
    vec_diagonala(1 : n, 1) = 5;
    
    A = diag(vec_diagonala);

    % cei 3 de 4
    A(1, 1) = 4;
    A(n, n) = 4;
    p = rows * (rows - 1) / 2;
    A(1 + p, 1 + p) = 4;

    
    nr_init = 5;
    contor = 1;
    
    % pun valorile de 6 in matrice
    while(1)
        if(nr_mij == 0)
            break;
        endif

        for i = 1 : contor
            % pun elementul
            A(nr_init, nr_init) = 6;
            % ma deplasez la urmatoarea linie
            nr_init++;
        endfor
        % scad numarul de numere care trb adaugat
        nr_mij -= contor;

        contor++;
        % ma deplasez la urmatoarea linie
        nr_init += 2;
    endwhile
    
    A(1, 2) = -1;
    A(1, 3) = -1;
    
    % elemente de pe partea stanga 
    for i = 1 : rows - 1
        if (A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2) == 5) 
            % elementul din dreapta (urmatorul)
            A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2  + 1) = -1;
            %elementul de deasupra
            A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2 - i) = -1;
            % elem de jos
            A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2 + i + 1) = -1;
            % elem de jos dreapta
            A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2 + i + 2) = -1;
        elseif (A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2) == 4)
            % elementul din dreapta (urmatorul)
            A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2  + 1) = -1;
            %elementul de deasupra
            A(1 + i * (i + 1) / 2, 1 + i * (i + 1) / 2 - i) = -1;
        endif
    endfor
    
    %elemente de pe partea dreapta
    for i = 2 : rows
        if (A(i * (i + 1) / 2, i * (i + 1) / 2) == 5)
            %elementul de deasupra
           A(i * (i + 1) / 2, i * (i + 1) / 2 - i) = -1;
           %elementul din stanga
           A(i * (i + 1) / 2, i * (i + 1) / 2 - 1) = -1;
           %elementul de jos
           A(i * (i + 1) / 2, i * (i + 1) / 2 + i + 1) = -1;
           %elementul de jos stanga
           A(i * (i + 1) / 2, i * (i + 1) / 2 + i) = -1;
        elseif (A(i * (i + 1) / 2, i * (i + 1) / 2) == 4)
             %elementul de deasupra
           A(i * (i + 1) / 2, i * (i + 1) / 2 - i) = -1;
           %elementul din stanga
           A(i * (i + 1) / 2, i * (i + 1) / 2 - 1) = -1;
        endif
    endfor
    
    %mijloc
    nr_init = 5;
    contor = 1;
    rows_prev = 2;
    n = rows * (rows + 1) / 2;
    while(1)
        for i = 1 : contor
            if (A(nr_init, nr_init) == 6)
                % elementul din stanga
                A(nr_init, nr_init - 1) = -1;
                % elementul din dreapta
                A(nr_init, nr_init + 1) = -1;
                % elementul de deasupra stanga
                A(nr_init, nr_init - contor - 2) = -1;
                % elementul de deasupra dreapta
                A(nr_init, nr_init - contor- 1) = -1;
                % elementul de jos stanga
                A(nr_init, nr_init + 2 + contor) = -1;
                % elementul de jos dreapta
                A(nr_init, nr_init + 3 + contor) = -1;
            elseif (A(nr_init, nr_init) == 5)
                % elementul din stanga
                A(nr_init, nr_init - 1) = -1;
                % elementul din dreapta
                A(nr_init, nr_init + 1) = -1;
                % elementul de deasupra stanga
                A(nr_init, nr_init - contor- 2) = -1;
                % elementul de deasupra dreapta
                A(nr_init, nr_init - contor- 1) = -1;
            endif
            nr_init++;
        endfor
        
        rows_prev++;
        contor++;
        % guard
        if(nr_init == n)
            break;
        endif
        
        nr_init += 2;
    endwhile
endfunction