function [centroids] = clustering_pc(points, NC)
    % nr de linii si coloane
    linii_points = rows(points);
    coloane_points = columns(points);
    
    % initializez matricea de cluster
    cluster_matrix = zeros(NC, linii_points / NC);
    
    % pun toate punctele mod NC pe fiecare linie a clusterului
    for i = 1 : NC
        cluster_matrix(i, 1) = i;
        for j = 2 : linii_points / NC
            cluster_matrix(i, j) = cluster_matrix(i, j - 1) + NC;
        endfor
    endfor
    
    % initializez centroizii
    centroids = zeros(NC, coloane_points);
    
    for j = 1 : coloane_points
        for i = 1 : NC
            % centrul de masa
            centroids(i, j) = mean(points(cluster_matrix(i, :), j));
        endfor
    endfor
    
    % salvez centroidul initial
    prev_cen = centroids;
    contor = 1;
    
    while 1
        % initializez grupul
        grup = zeros(NC, linii_points);
               
        % iau ficare punct si fiecare centroid
        for i = 1 : linii_points
            minim = inf;
            
            for j = 1 : NC
                % calculez distanta
                dist = norm(points(i, :) -  centroids(j, :));
                
                % daca e minima salvez pozitia
                if (dist < minim)
                    minim = dist;
                    pozitie_cen = j;
                endif
            endfor
            
            % am gasit cel mai apropiat centroid, pun punctul in grup
            % pe linia centroidului respectiv
            for k = 1 : linii_points
                if (grup(pozitie_cen, k) == 0)
                    grup(pozitie_cen, k) = i;
                    break;
                endif
            endfor
        endfor
        
        % recalculez centroidul
        for i = 1 : NC
            for j = 1 : coloane_points
                elem_nen = grup(i, :);
                
                elem_nen = elem_nen(elem_nen ~= 0);
                
                centroids(i, j) = mean(points(elem_nen, j));
            endfor
        endfor
        
        %guard
        if (prev_cen == centroids)
            return;
        endif
        
        prev_cen = centroids;
    endwhile   
endfunction