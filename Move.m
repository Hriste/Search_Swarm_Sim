function [move,map] = Move(birdseye,map,position,local)
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
        
        u= any(~ismember(local,[x-1,y]));
        o= any(~ismember(local,[x-2,y]));
        p= any(~ismember(local,[x-1,y-1]));
        f= any(~ismember(local,[x-1,y+1]));
        
        g= any(~ismember(local,[x+1,y]));
        h= any(~ismember(local,[x+2,y]));
        n= any(~ismember(local,[x+1,y-1]));
        m= any(~ismember(local,[x+1,y+1]));
        if map(x,y+1)==3%&&q(1)&&q(2)&&w(1)&&w(2)&&r(1)&&r(2)&&t(1)&&t(2)
            position= [x,y+1];
        elseif map(x-1,y)==3%&&u(1)&&u(2)&&o(1)&&o(2)&&p(1)&&p(2)&&f(1)&&f(2)
            position= [x-1,y];
        elseif map(x+1,y)==3%&&g(1)&&g(2)&&h(1)&&h(2)&&n(1)&&n(2)&&m(1)&&m(2)
            position= [x+1,y];
        elseif map(x,y-1)==3
            position= [x,y-1];
        end
    else
        new = Frontier_Find(map,position,local) ;
        if isempty(new)
            new(1) = x;
            new(2) = y;
        end
        position = [new(1), new(2)];
        
    end
    move = position;
end