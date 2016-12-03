function [map] = Comm(local,pos,robots,map,num,dead)
x0 = pos(1);
y0 = pos(2);
range = robots(num).comm_range;
[x,y] = size(map);

if ~dead(x0,y0)
    for robot=1:1:length(robots)
    x1 = local(robot,1);
    y1 = local(robot,2);
    dist = sqrt((y1-y0)^2 + (x1-x0)^2 );
    new = robots(robot).map;
    if dist <= range && ~dead(x1,y1);
        for a=1:x
            for b = 1:y
                if map(a,b) == 4
                    map(a,b) = 4;
                    new(a,b) = 1;
                elseif new(a,b) == 4
                    new(a,b) = 4;
                    map(a,b) = 1;
                elseif map(a,b) == 2 || new(a,b) == 2
                    map(a,b) = 2;
                    new(a,b) = 2;
                elseif map(a,b) == 1 || new(a,b) == 1
                    map(a,b) = 1;
                    new(a,b) = 1;
                elseif new(a,b) == 3 || map(a,b) == 3
                    map(a,b) = 3;
                    new(a,b) = 3;
                end
            end
        end
    end
    robots(robot).map = new;
    end
end
robots(num).map = map;
map = map;
end

