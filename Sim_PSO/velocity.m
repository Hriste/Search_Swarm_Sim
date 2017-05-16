function new_v = velocity(pos,prev,map,local,n,m)

    %for now these are hardcoded but these parameters can be tunable
    x = pos(1);
    y = pos(2);
    w = 0.5; %interial factor
    c1 = 1;
    c2 = 0.6 ;%accelerate factors
    %prev is velocity of previous step if it exists (otherwise is zero)
    r1 = rand();
    r2 = rand();

    %position of nearest frontier cell & caculation of local best position
    s=Frontier_Find(map,pos,local);
    if size(s) > 0
        pt1 = s(1);
        if pt1 < x
            pt1 = -1 * pt1;
        end
        pt2 = s(2);
        if pt2 < y
            pt2 = -1*pt2;
        end
        local_pos = (atan(pt2/pt1)*180)/pi;
    else
        local_pos = 0;
    end
    
    %Caculation of position of agent
    if x<n/2
        pt1 = -x;
    else
        pt1=x;
    end
    if y<m/2
        pt2 = -y;
    else
        pt2 = y;
    end
    p = (atan(pt2/pt1)*180)/pi;

    %global best position Caculation
    %known robot locations - for now assume perfect knowlwege 
    locations = [];
    for k = 1:size(local,1)
        pt1 = local(k,1);
        pt2 = local(k,2);
        if pt1 < x
            pt1 = -1 * pt1;
        end
        if pt2 < y
            pt2 = -1*pt2;
        end
       locations(k) = (atan(pt2/pt1)*180)/pi;
    end
    
  free_neighbor = [];
    count = 1;
    for j = -1:2:1
        if x+j >0
            if map(x+j,y) == 1
                free_neighbor(count,1) = x+j;
                free_neighbor(count,2) = y;
                count = count + 1;
            end
        end
        if y+j >0
            if map(x,y+j) == 1
                free_neighbor(count,1) = x;
                free_neighbor(count,2) = y+j;
                count = count+1;
            end
        end
    end  
    
    for k = 1:length(free_neighbor)
        pt1 = free_neighbor(k,1);
        pt2 = free_neighbor(k,2);
        if pt1 < x
            pt1 = -1 * pt1;
        end
        if pt2 < y
            pt2 = -1*pt2;
        end
        free_neighbor(k) = (atan(pt2/pt1)*180)/pi ;
    end
    
    % N,E,S,W
    tracker = zeros(length(free_neighbor));
    for k =1:length(free_neighbor)
        for j = 1:length(local)
            if (free_neighbor(k) <= 45 && local(j) <=45) || (free_neighbor(k) >315 && local(j)>315)
                tracker(k)=tracker(k)+1;
            end
            if (free_neighbor(k)<=135 && free_neighbor(k)>45 && local(j)<=135 && local(j)>45 )
                tracker(k)=tracker(k)+1;
            end
            if (free_neighbor(k)<=225 && free_neighbor(k)>135 && local(j)<=225 && local(j)>135 )
                tracker(k)=tracker(k)+1;
            end
            if (free_neighbor(k)<=315 && free_neighbor(k)>225 && local(j)<=315 && local(j)>225 )
                tracker(k)=tracker(k)+1;
            end
        end
    end
    
    
    if length(tracker) == 0
        [~,tracker] = min(tracker);
        global_pos = free_neighbor(tracker);
    else
        global_pos = 0;
    end
    
    new_v = w*prev* + c1*r1*(local_pos - p) + c2*r2*(global_pos - p);
end
  