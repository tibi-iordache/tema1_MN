function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
    % calea catre setul de poze
    cale_pisici = strcat(path_to_dataset, 'cats/');
    cale_not = strcat(path_to_dataset, 'not_cats/');

    % matrici ce contin numele fisierelor
    [ imgs_pisici ]  = getImgNames(cale_pisici);
    [ imgs_not ]  = getImgNames(cale_not);

    [m_p n_p] = size(imgs_pisici);
    [m_n n_n] = size(imgs_not);

    % initializez X
    X = zeros(m_p + m_n, count_bins * 3);    

    %intializez y si ii pun valorile corespunzatoare
    y = zeros(m_p + m_n, 1);

    y(1 : m_p) = 1;

    y(m_p + 1 : m_p + m_n) = -1;

    % concatenez calea completa catre imagini
    imagine_pisici(1 : m_p, :) = strcat( cale_pisici, imgs_pisici(1 : m_p, :) );
    imagine_not(1 : m_n, :) = strcat( cale_not, imgs_not(1 : m_n, :) );

    % verific tipul histogramei cerute
    if (histogram == 'RGB')
        % parcurg imaginile cu pisici
        for i = 1 : m_p
            % realizez pt fiecare histograma
            X(i, :) = rgbHistogram(imagine_pisici(i, :), count_bins);
        endfor

        % parcurg imaginile fara pisici
        for i = 1 : m_n
            % realizez pt fiecare histograma
            X(i + m_p, :) = rgbHistogram(imagine_not(i, :), count_bins);
        endfor
    elseif (histogram == 'HSV')
        % parcurg imaginile cu pisici
        for i = 1 : m_p
            % realizez pt fiecare histograma
            X(i, :) = hsvHistogram(imagine_pisici(i, :), count_bins);
        endfor

        % parcurg imaginile fara pisici
        for i = 1 : m_n
            % realizez pt fiecare histograma
            X(i + m_p, :) = hsvHistogram(imagine_not(i, :), count_bins);
        endfor
    endif  
endfunction
