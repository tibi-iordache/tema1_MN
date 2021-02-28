function [sol] = hsvHistogram(path_to_image, count_bins)
    % initializez solutia
    sol = zeros(1, 3 * count_bins);
   
    % citesc imaginea
    A = imread(path_to_image);
    % castez la double
    A = double(A);
    
    % conversia pixelilor
    [H S V] = RGB2HSV(A(: , :, 1), A(: , :, 2), A(: , :, 3));
    
    % calculez raportul din formula
    rap = double(1.01 / count_bins);
    
    % initializez vectorii de culori
    vector_culoare_H = zeros(1, count_bins);
    vector_culoare_S = zeros(1, count_bins);
    vector_culoare_V = zeros(1, count_bins);
    
    % calculez histograma pt fiecare vector
    for j = 0 : count_bins - 1
       vector_culoare_H(j + 1) = ( histc(H(:),
        [j * rap, j * rap + rap - 1e-6]) )(1);
        
       vector_culoare_S(j + 1) = ( histc(S(:),
        [j * rap, j * rap + rap - 1e-6]) )(1);
        
       vector_culoare_V(j + 1) = ( histc(V(:),
         [j * rap, j * rap + rap - 1e-6]) )(1);
    endfor    
    
    % pun vectorii rezultati in solutie       
    sol(1,1:count_bins) = vector_culoare_H;
    
    sol(1,count_bins + 1 : count_bins * 2) = vector_culoare_S;
     
    sol(1,count_bins * 2 + 1 : count_bins * 3) = vector_culoare_V;
end