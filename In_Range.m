function In_Range(robots)
    for robot = 1:1:length(robots)
        x1 = robots(robot).position(1);
        y1 = robots(robot).position(2);
        r1 = robots(robot).comm_range;
        for other = robot+1:1:length(robots)
            x2 = robots(other).position(1);
            y2 = robots(other).position(2);
            r2 = robots(other).comm_range; 
            
            distance = sqrt((x1-x2)^2 + (y1-y2)^2);
            if distance <= r1 || distance <= r2
                new = Broadcast(robots(robot).map, robots(other).map);
                robots(robot).map = new;
                robots(other).map = new;
            end
        end
    end
end