function dead = DEATH(n)
    dead = zeros(n);
    for i=1:n
        for j=1:n
            if rand() < .5
                dead(i,j)=1;
            end
        end
    end
    
end