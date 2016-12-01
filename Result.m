function [final] = Result(robots)
    %final = robots(1).map;
    [x,y] = size(robots(1).map);
    final = zeros(x,y);
    for i=1:1:length(robots)
        new = robots(i).map;
        for a=1:x
            for b = 1:y
                if final(a,b) == 2
                elseif new(a,b) == 2
                    final(a,b) = 2;
                elseif final(a,b) == 1
                elseif new(a,b) == 1
                    final(a,b) = 1;
                elseif new(a,b) == 3
                    final(a,b) = 3;
                end
            end
        end
    end
figure(20);
image(final.*15)
title('final returned result')
end

