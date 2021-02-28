function [H, S, V] = RGB2HSV(R, G, B) 
    % impart fiecare componenta
    Rp = double(R ./ 255);
    Gp = double(G ./ 255);
    Bp = double(B ./ 255);
    
    [linii coloane] = size(Rp);
    
    % calculez maxim si minim
    C_max = max(max(Rp, Gp), Bp);
    C_min = min(min(Rp, Gp), Bp);
    
    % initializez H si S
    H = zeros(linii, coloane);
    S = zeros(linii, coloane);
    
    % calculez delta
    delta = double(C_max - C_min);
   
    H(C_max == Rp & delta ~= 0) = 60 * mod(double( (Gp(C_max == Rp & delta ~= 0) 
                                                - Bp(C_max == Rp & delta ~= 0) )
                                       ./ delta(C_max == Rp & delta ~= 0) ), 6);
    
    H(C_max == Gp & delta ~= 0) = 60 * (double((Bp(C_max == Gp & delta ~= 0)
                                             - Rp(C_max == Gp & delta ~= 0)) 
                                    ./ delta(C_max == Gp & delta ~= 0)) + 2);
    
    H(C_max == Bp & delta ~= 0) = 60 * (double((Rp(C_max == Bp & delta ~= 0)
                                             - Gp(C_max == Bp & delta ~= 0)) 
                                    ./ delta(C_max == Bp & delta ~= 0)) + 4);
    
    H = double(H ./ 360);

    S(C_max ~= 0) = double(delta(C_max ~= 0) ./ C_max(C_max ~= 0));

    V = C_max;

endfunction