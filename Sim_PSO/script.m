clear all;
data = [];
agents = [12,20,20,30,2,4,5,10,5,10,20,5,10,20];
areas = [10,20,40,40,5,5,45,45,50,50,50,100,100,100];

for i = 1:1:length(areas)
    i
        time =Run(areas(i),agents(i));
        data = [data ;[areas(i), agents(i), time]];
        
    
end
data
