function time = Run(a,net,agents)
num = agents;%input('input the number of robots ') ;
width = a;%input('input the width of the map ');
height = a;%input('input the height of the map ');
comm_range = net;%input('input communication range');
actual = Map(width,height);
finish_case = actual;
finish_case(1,1) = 0;
finish_case(1,width) = 0;
finish_case(height,1) = 0;
finish_case(height,width) =0;
robots = []; 

start = [];
starty = [];
for k= height:-1:1
    for l = 1:1:width
        if actual(k,l) == 1
            start=[start l];
            starty=[starty k];
        end
    end 
end
for i =1:1:num
    %inital = intial place for robot i
    if length(start) < num
        error('there are not enough places to put the robots');
    end
    inital = [start(i) starty(i)];
    inital;
    %make robot instances
    robots = [robots Robot(width,height,inital,comm_range)];
end
iteration = 0;
done = 1;
X=1;
dead = DEATH(width);
check = 0;
while(check == 0)
   
    iteration = iteration+1;
    
    for j = 1:length(robots)
        %Setup
        current = robots(j);
        FLAG = robots(j).stuck;
        map = current.map;
        pos = robots(j).position;
        prev = current.prev;
        [~,local] = Collide(robots, pos);
        map = Comm(local,pos,robots,map,j,dead);
        
        [move,map, check] = Move(actual,map,pos,local);
        %check to see if move will result in a collision
        [hit,~] = Collide(robots, move);
        if hit==1
            %make space with other robot free
            map(move(1), move(2)) = 1;
            robots(j).map = map;
            [move,map, check] = Move(actual, map, pos,local);
            [hit,~] = Collide(robots,move); 
            if hit ==1
                move = pos;
            end
        end
        move;
%update object parameters
        map(move(1), move(2)) = 1;
        map = Comm(local,pos,robots,map,num,dead);
        robots(j).map = map;
  
        robots(j).position = move;
        robots(j).prev = pos;
        robots(j).stuck = FLAG;
        final = Result(robots);
        if (final == finish_case)
            check = 1;
        end
    end
end

   


final = Result(robots);
time = iteration;
end