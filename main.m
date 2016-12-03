%close all;
clear all;
num = input('input the number of robots ') ;
width = 17;%input('input the width of the map ');
height = 17;%input('input the height of the map ');
comm_range = input('input communication range');
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
    inital;
    %make robot instances
    robots = [robots Robot(width,height,inital,comm_range)];
end
figure(1)
image(actual.*15)
title('Intial Setup');
iteration = 0;
done = 1;
X=1;
dead = DEATH(width);
while(1)
   % X = input('enter a number if you whish to continue, or enter 0 to exit');
    iteration = iteration + 1;
    
    %X = input('enter a number if you whish to continue, or enter 0 to exit');
    if X == 0 
        break
    end
    %In_Range(robots);
    for j = 1:length(robots)
        %Setup
        current = robots(j);
        FLAG = robots(j).stuck;
        map = current.map;
        pos = robots(j).position;
        prev = current.prev;
        [~,local] = Collide(robots, pos);
        map = Comm(local,pos,robots,map,j,dead);
        
        [move,map] = Move(actual,map,pos,local);
        %check to see if move will result in a collision
        [hit,~] = Collide(robots, move);
        if hit==1
            %make space with other robot free
            map(move(1), move(2)) = 1;
            robots(j).map = map;
            [move,map] = Move(actual, map, pos,local);
            [hit,~] = Collide(robots,move); 
            if hit ==1
                move = pos;
            end
        end
        move;
%         if move==prev
%             if FLAG > 4
%                 FLAG  = 1;
%             end
%         end
%         if FLAG<5 && mod(FLAG,3);
%             if move(1)+1 > height-1
%                 move = [move(1)-1, move(2)];
% %                 if move(2)+1 > width-1
% %                     move = [move(1)-1,move(2)-1];
% %                 else
% %                     move = [move(1)-1,move(2)+1];
% %                 end
%             else
%                 move = [move(1)+1,move(2)];
% %                  if move(2)+1 > width-1
% %                     move = [move(1)+1,move(2)-1];
% %                 else
% %                     move = [move(1)+1,move(2)+1];
%             end
%             
%         elseif FLAG<5 && ~mod(FLAG,3)
%              if move(2)-1 < 2
%                      move = [move(1)-1,move(2)+1];
%              else
%                      move = [move(1)-1,move(2)-1];
%              end
%         end
%            FLAG = FLAG+1; 
    
    
%update object parameters
        map(move(1), move(2)) = 4;
        map = Comm(local,pos,robots,map,num,dead);
        robots(j).map = map;
        figure(j+1);
        image(map.*15);
        robots(j).position = move;
        robots(j).prev = pos;
        robots(j).stuck = FLAG;
        Result(robots);
    end
end

   


final = Result(robots);
iteration