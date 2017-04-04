clear all;
areas = [10:5:30];
agents = [1:2:9];
data = [];

for i = 1:1:length(areas)
    i
    comm = [2:2:areas(i)];
    for j=1:1:length(agents)
        j
        for k=1:1:length(comm)
            k
            time =Run(areas(i),comm(k),agents(j));
            data = [data ;[areas(i), comm(k), agents(j), time]];
        end
    end
end
data
