function [ hit,local ] = Collide(robots,new)
    hit = 0;
    local = [];
    for robot = 1:1:length(robots)
        x1 = robots(robot).position(1);
        y1 = robots(robot).position(2);
        local(robot,1) = x1;
        local(robot,2) = y1;
        if (x1 == new(1) && y1 == new(2))
            hit = 1;
        end
    end
end

