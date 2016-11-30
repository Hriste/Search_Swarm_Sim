function [ hit, gp, local ] = Collide(robots,new)
    hit = 0;
    gp = 0; % gp is global best position - basically which direction has the fewet robots
    up = 0;
    dwn = 0;
    l = 0; 
    r = 0;
    local = [];
    for robot = 1:1:length(robots)
        x1 = robots(robot).position(1);
        y1 = robots(robot).position(2);
        local(robot,1) = x1;
        local(robot,2) = y1;
        if (x1 == new(1) && y1 == new(2))
            hit = 1;
        end
        if x1 > new(1)
            r = r+1;
        elseif x1 < new(1)
            l = l+1;
        end
        if y1 > new(2)
            up = up+1;
        elseif y1 < new(2)
            dwn = dwn+1;
        end
    end
    
    %assign direction to gp
    if up >= dwn && up >= l && up >=r
        gp = 1;
    elseif dwn > l && dwn > r
        gp = 180;
    elseif l > r
        gp = 90;
    else
        gp = 270;
    end
    
end

