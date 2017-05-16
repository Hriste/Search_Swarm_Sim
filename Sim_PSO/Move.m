function [move,map, FLAG] = Move(birdseye,map,position,local,pos,prev,n,m)
    x = position(1);
    y = position(2);
    FRONT = 0;
    FLAG = 0;
    map(x,y) = 1;  % Mark current cell as free
    %mark neighbors as wall or frontier
    for i = -1:2:1
        if y+i >0
            if birdseye(x,y+i)~= 2 %not a wall in global map
               if map(x,y+i) ~=1 %not open in local map
                   map(x,y+i) = 3; %set to frontier
                   FRONT = 1;
               end
            else
                map(x,y+i) = 2; %set to wall in local map
            end
        end
        if x+i >0
            if birdseye(x+i,y)~= 2 %not a wall in global map
               if map(x+i,y) ~=1 %not open in local map
                   map(x+i,y) = 3; %set to frontier
                   FRONT = 1;
               end
            else
                map(x+i,y) = 2; %set to wall in local map
            end
        end
    end

    %if known frontier is in "area"
    if FRONT == 1
        % order of precedence of movement - {foward, left, right,
        %rear}
        if map(x,y+1)==3
            position= [x,y+1];
        elseif map(x-1,y)==3
            position= [x-1,y];
        elseif map(x+1,y)==3
            position= [x+1,y];
        elseif map(x,y-1)==3
            position= [x,y-1];
        end
    else
        v=velocity(pos,prev,map,local,n,m);
        current = (atan(y/x)*180)/pi;
        new = current + v;
        new = new*pi/180;
        temp_x = cos(new);
        temp_y = sin(new);
        if temp_x > n
            temp_x = n;
        elseif temp_x <0
            temp_x =0;
        end
        if temp_y > m
            temp_y = m;
        elseif temp_y <0
            temp_y = 0;
        end
        FLAG =1;
        position = [ceil(temp_x),ceil(temp_y)];
       
      %  new = Frontier_Find(map,position,local) ;
      %  if isempty(new)
       %     new(1) = x;
        %    new(2) = y;
         %   FLAG = 1;
        %end
       % position = [new(1), new(2)];
        
    end
    move = position;
end