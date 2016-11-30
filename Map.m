function y = Map(n,m)

% 0 = unexplored
% 1 = open
% 2 = wall
% 3 = frontier
% 4 = occupied by robot
maps = ones(n,m);
start = [];
starty = [];
%starting with the simplest case set all perimiters to walls
for i=1:1:n
    maps(i,1) = 2;
    maps(i,end) = 2;
end
for j=2:1:m-1
    maps(1,j) = 2;
    maps(end,j) = 2;
end

%array of potential starting positions, beginning lower left
for k= 1:1:m
    for l = n:-1:1
        if maps(k,l) == 1
            start=[start l];
            starty=[starty k];
        end
    end 
end
y = maps;
figure(2)
image(y.*15);
title('Map')
end
