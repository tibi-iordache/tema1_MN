function [w] = learn(X, y, lr, epochs)
    [m n] = size(X);
   
    % scalez matricea X
    X(:, 1 : n) = double(X(:, 1 : n) .- mean(X(:, 1 : n ))) ./ std(X(:, 1 : n));
                       
    % ii adaug coloana de 1                  
    X(:, n + 1) = 1;
    
    % actualizez dimensiunile
    [l c] = size(X);
  
    % generez vectorul cu valori random
    w = -0.1 + (0.1 + 0.1) * rand(c, 1);
     
    for epoch = 1 : epochs
        % vect care ma ajuta sa iau cele 64 de linii random
        vec_poz = randperm(l);
        
        % selectez x si y
        x_batch = X( vec_poz(1 : 64), : );
        y_batch = y( vec_poz(1 : 64) );
        
        % recalculez w
        w(1 : c) = w(1 : c) .- double(lr / l) * (x_batch(1 : 64, 1 : c)'
                        * ( x_batch(1 : 64, :) * w - y_batch(1 : 64) ) );
    endfor
endfunction
