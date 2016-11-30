function [move,map,v ] = Move(birdseye,map,position,v,gp,local)
    c1 = 1;
    c2 = .6;
    w = .5;
    %replace with robot specific variables eventually
    x = position(1);
    y = position(2);
    FRONT = 0;
    map(x,y) = 1;  % Mark current cell as free
    %mark neighbors as wall or frontier
    for i = -1:2:1
        if birdseye(x,y+i)~= 2 %not a wall in global map
           if map(x,y+i) ~=1 %not open in local map
               map(x,y+i) = 3; %set to frontier
               FRONT = 1;
           end
        else
            map(x,y+i) = 2; %set to wall in local map
        end

        if birdseye(x+i,y)~= 2 %not a wall in global map
           if map(x+i,y) ~=1 %not open in local map
               map(x+i,y) = 3; %set to frontier
               FRONT = 1;
           end
        else
            map(x+i,y) = 2; %set to wall in local map
        end
    end

    %if known frontier is in "area"
    if FRONT == 1
        % order of precedence of movement - {foward, left, right,
        % rear
        q=any(~ismember(local,[x,y+1]));
        w=any(~ismember(local,[x,y+2]));
        r=any(~ismember(local,[x+1,y+1]));
        t=any(~ismember(local,[x-1,y+1]));
        if map(x,y+1) == 3 &&q(1)&&q(2)&&w(1)&&w(2)&&r(1)&&r(2)&&t(1)&&t(2)
            position= [x,y+1];
        elseif map(x-1,y) == 3
            position= [x-1,y];
        elseif map(x+1,y) == 3
            position= [x+1,y];
        elseif map(x,y-1) == 3
            position= [x,y-1];
        end
        
        move = position;

    else
        v = Velocity(c1,c2,w,map,position,v,gp);
        if v<= 45 || v>=315 %north (foward) velocity
            if map(x,y+1) == 0 || map(x,y+1) == 1 || map(x,y+1) == 3
                position = [x,y+1];
            else
                v = v+45; %shift velocity to next direction
            end
        end
        if v>45 && v<135 %east (left) velocity
            if map(x-1,y) == 0 || map(x+-1,y) == 1 || map(x-1,y) == 3
                position = [x-1,y];
            else
                v = v+45; %shift velocity to next direction
            end
        end
        if v>=135 && v<225 %south (rear) velocity
            if map(x,y-1) == 0 || map(x,y-1) == 1 || map(x,y-1) == 3
                position = [x,y-1];
            else
                v = v+45; %shift velocity to next direction
            end
        end
        if v<315 && v>=225 % west (right) velocity
            if map(x+1,y) == 0 || map(x+1,y) == 1 || map(x+1,y) == 3
                position = [x+1,y];
            else
                position = [x,y]; % no move (shouldn't happen)
            end
        end
        move = position;
    end
    v = v;
end