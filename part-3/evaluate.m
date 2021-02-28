function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
    % preprocesez imaginile
    [X, y] = preprocess(path_to_testset, histogram, count_bins);
    
    [linii coloane] = size(X);
    
    % formez X_til
    X_til = X;
    X_til(:, coloane + 1) = 1;
    
    contor = 0;
    % iau fiecare poza in parte
    for i = 1 : linii
        % ii determin clasa in care se afla
        x_col = X_til(i, :);
        y_p = w' * x_col';
        
        % verific daca predicitia a fost buna
        if ((y_p >= 0 & y(i) == 1) || (y_p < 0 & y(i) == -1))
            contor++;
        endif
    endfor
    
    % calculez procentul de poze prezise corect
    percentage = double(contor / linii);
endfunction