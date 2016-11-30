function shared = Broadcast(m1, m2)
% 0 = unexplored
% 1 = open
% 2 = wall
% 3 = frontier
% 4 = occupied by robot
if size(m1) ~= size(m2)
   error('maps do not match');
end
[x,y] = size(m1);
shared = zeros(x,y);
for i= 1:x
    for j = 1:y
        if m1(i,j)==1 || m2(i,j)==1
            shared(i,j) = 1;
        end
        if m1(i,j)==2 || m2(i,j)==2
            shared(i,j) = 2;
        end
        if m1(i,j)==3 || m2(i,j)==3
            shared(i,j) = 3;
        end
    end
end