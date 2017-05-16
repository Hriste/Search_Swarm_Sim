function [testx,testy,testl] = dijk(nodes)
[num, ~] = size(nodes);
s = 1;
d = num;
x = zeros([1 num]);
y = zeros([1 num]);
status = zeros([1 num]);
backwards = zeros([1 num]);
status(s) = 1;
fail = 0;
traveled = 0;


for i=1:1:num
    x(i) = nodes(i,1);
    y(i) = nodes(i,2);
end
% figure(1)
% title('scatter plot of nodes')
% scatter(x,y,3);
%hold on;
dijk_dist = zeros([1 num]);
for j = 1:1:num
    %hold on;
    dist_dijk = sqrt(abs(x(s)-x(j))^2 + abs(y(s)-y(j))^2);%distance from source to each point
    if dist_dijk <=1
        dijk_dist(j)=dist_dijk;
        backwards(j) = s;
    else
        dijk_dist(j)=100;
    end
    dijk_dist(s) = 100;
%     for k = 1:1:num
%         dist = sqrt(abs(x(k)-x(j))^2 + abs(y(k)-y(j))^2);
%         if dist <= 1
%             a = [x(k) x(j)];
%             b = [y(k) y(j)];
% %             hold on;
% %             figure(2)
% %             title('Unit Distance Graph (r=2)')
% %             plot(a,b);
%         end
%     end
end
%disp('The direct distance between the start node and destination node is...');
direct_distance = 0;
direct_distance = sqrt(abs(x(s)-x(d))^2 + abs(y(s)-y(d))^2);

current = s;
map = [s];
[m,closest]= min(dijk_dist);
hops = 0;
% figure(3)
% title('Dijkstra backwards');
% a = [x(current) x(closest)];
% b = [y(current) y(closest)];
% plot(a,b)

while(current ~= d);
    hops = hops +1;
    status(closest) = 1;
    traveled = dijk_dist(closest);
    dijk_dist(closest) = 100;
    current = closest;
    for j = 1:1:num
        dist_dijk = sqrt(abs(x(current)-x(j))^2 + abs(y(current)-y(j))^2);%distance from source to each point
        if dist_dijk<=1 && status(j)== 0 && dijk_dist(j)==100
            dijk_dist(j) = dist_dijk+m;
            backwards(j) = current;
        else
            if dist_dijk<=1 && dist_dijk + m < dijk_dist(j) && status(j)==0;
                dijk_dist(j) = dist_dijk+m;
                backwards(j) = current;
            end
    
        end
    end
    dijk_dist(closest) = 100;
    map = [map current];
    [m,closest]= min(dijk_dist);
    if m == 100
        fail = 1;
        break
    end
end

% for thingies=1:1:length(map)
%     dex = backwards(map(thingies));
% %     a = [ x(map(thingies)) x(dex)];
% %     b = [ y(map(thingies)) y(dex)];
% %     hold on;
% %     title('Dijkstra all explored paths');
% %     plot(a,b)
% end
%figure(4);
point1 = backwards(d);
point2 = d;
short = 1;
power = 0;
test=[];
for steps = hops-1:-1:1
    if point2==1 || point1==1
        break
    end
    point2 = point1;
    point1 = backwards(point1);
    testx = x(point2);
    testy = y(point2);
    test = [test [testx testy]];
    if point1 > 1
        short = short + 1;
    end
end
test;
testl = short+1;
% disp('the number of hops in the final path is ...')
% short+1
% disp('the total number of hops in the search is..')
% hops
% disp('The final multi-hop distance is..')
%traveled %+ sqrt(abs(x(map(hops))-x(d))^2 + abs(y(map(hops))-y(d))^2)
% if short <1
%      fail = 1
% end
%y = [direct_distance short+1 traveled fail];
%power
