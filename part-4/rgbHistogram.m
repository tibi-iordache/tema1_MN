function [sol] = rgbHistogram(path_to_image, count_bins)
    % initializez solutia
    sol = zeros(1, 3 * count_bins);
   
    % citesc imaginea
    A = imread(path_to_image);
    
    % calculez raportul din formula
    rap = double(256 / count_bins);
    
    % initializez vectorii de culori
    vector_culoare_R = zeros(1, count_bins);
    vector_culoare_G = zeros(1, count_bins);
    vector_culoare_B = zeros(1, count_bins);
       
    % calculez histograma pt fiecare vector
    for j = 0 : count_bins - 1
       vector_culoare_R(j + 1) = ( histc(A(:, :, 1)(:), 
                  [j * rap,j * rap + rap - 1e-6]) )(1);
       vector_culoare_G(j + 1) = ( histc(A(:, :, 2)(:),
                 [j * rap, j * rap + rap - 1e-6]) )(1);
       vector_culoare_B(j + 1) = ( histc(A(:, :, 3)(:),
                 [j * rap, j * rap + rap - 1e-6]) )(1);
    endfor
       
    % pun vectorii rezultati in solutie       
    sol(1, 1 : count_bins) = vector_culoare_R;
    
    sol(1, count_bins + 1 : count_bins * 2) = vector_culoare_G;
     
    sol(1, count_bins * 2 + 1 : count_bins * 3) = vector_culoare_B;
endfunction