% clear all;
% areas = [10:5:30];
% agents = [1:2:9];
% data = [];
% 
% for i = 1:1:length(areas)
%     i
%     comm = [2:2:areas(i)];
%     for j=1:1:length(agents)
%         j
%         for k=1:1:length(comm)
%             k
%             time =Run(areas(i),comm(k),agents(j));
%             data = [data ;[areas(i), comm(k), agents(j), time]];
%         end
%     end
% end
% data
clear all;
data = [];
agents = [12,20,20,30,2,4,5,10,5,10,20,5,10,20];
areas = [10,20,40,40,5,5,45,45,50,50,50,100,100,100];

for i = 1:1:length(areas)
    agents(i)
        time =Run(areas(i),agents(i));
        data = [data ;[areas(i), agents(i), time]];
        
    
end
data