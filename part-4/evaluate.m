function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    % preprocesez imaginile
    [X, y] = preprocess(path_to_testset, histogram, count_bins);

    [l c] = size(X);
    
    % scalez matricea
    X(: , 1 : c) = double(X(: , 1 : c) 
    .- mean(X(:, 1 : c))) ./ std(X(:, 1 : c));
    % adaug coloana de 1
    X(:, c + 1) = 1;
    
    contor = 0;

    for i = 1 : l
        % iau fiecare linie si determin clasa din care se afla
        x_col = X(i, :);
        y_p = w' * x_col';
        
        % verific daca a fost prezisa corect
        if ((y_p >= 0 & y(i) == 1) || (y_p < 0 & y(i) == -1))
            contor++;
        endif
    endfor
    
    % calculez procentajul
    percentage = double(contor / l);
    
endfunction