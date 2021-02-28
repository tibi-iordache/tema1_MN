function [cost] = compute_cost_pc(points, centroids)
    linii_points = rows(points);
    linii_centroids = rows(centroids);
    
    cost = 0;
    
    % iau fiecare punct si fiecare centroid
    for i = 1 : linii_points
        minim = inf;
        
        for j = 1 : linii_centroids
            % calculez distanta
            dist = norm(points(i, :) -  centroids(j, :));
            
            % daca e minima o salvez
            if (dist < minim)
                minim = dist;
            endif
        endfor
           
        % adaug distanta minima la cost   
        cost = cost + minim;
    endfor
endfunction

