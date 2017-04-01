clear all;
areas = [10:5:55];
agents = [1:1:10];
data = [];

for i = 1:1:length(areas)
    comm = [2:2:areas(i)];
    for j=1:1:length(agents)
        for k=1:1:length(comm)
            time =Run(areas(i),comm(k),agents(j));
            data = [data ;[areas(i), comm(k), agents(j), time]];
        end
    end
end
data
