function [final] = Result(robots)
    final = robots(1).map;
    [x,y] = size(final);
    for i=2:1:length(robots)
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
image(final.*15)
title('final returned result')
end

