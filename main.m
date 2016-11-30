close all;
clear all;
num = 2;%input('input the number of robots ') ;
width = 9;%input('input the width of the map ');
height = 9;%input('input the height of the map ');
comm_range = 10;
actual = Map(width,height);
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
    %actual(inital(1),inital(2)) = 4;
    %make robot instances
    robots = [robots Robot(width,height,inital,comm_range)];
end
figure(1)
image(actual.*15)
title('Intial Setup');
iteration = 0;
while(1)
    iteration = iteration + 1;
    X = input('enter a number if you whish to continue, or enter 0 to exit');
    if X == 0
        break
    end
    In_Range(robots);
    for j = 1:length(robots)
        current = robots(j);
        map = current.map;
        pos = current.position;
        v = current.velocity;
        [~, gp,local] = Collide(robots, pos);
        [move,map,v] = Move(actual,map,pos,v,gp,local);
        if v == 777
            break
        end
        %check to see if move will result in a collision
        [hit,~,~] = Collide(robots, move);
        if hit==1
            %make space with other robot free
            map(move(1), move(2)) = 1;
            robots(j).map = map;
            [move,map,v] = Move(actual, map, pos,v,gp,local);
            if v == 777
                break
            end
            [hit,~,~] = Collide(robots,move); 
            if hit ==1
                move = pos;
            end
        end
        %update object parameters
        map(move(1), move(2)) = 4;
        robots(j).map = map;
        figure(j+1);
        image(map.*15);
        robots(j).position = move;
        robots(j).velocity = v;
        In_Range(robots);
        if v == 777
            break
        end
    end
end

final = Result(robots);
iteration