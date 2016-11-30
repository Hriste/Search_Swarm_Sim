function s = Frontier_Find(map, pos)
    x = pos(1);
    y = pos(2);
    [row, col] = find(map==3);
    front = [row,col];
    free_neighbor = [];
    count = 1;
    for j = -1:2:1
        if map(x+j,y) == 1
            free_neighbor(count,1) = x+j;
            free_neighbor(count,2) = y;
            count = count + 1;
        end
        if map(x,y+j) == 1
            free_neighbor(count,1) = x;
            free_neighbor(count,2) = y+j;
            count = count+1;
        end
    end
    d = [];

    tags = [];
    for i = 1:1:length(front)
        for k = 1:1:length(free_neighbor)
            
            d = [d, sqrt((free_neighbor(k,2)-front(i,2))^2 - (free_neighbor(k,1)-front(i,1))^2 )];
            %currently using shortest distance as crow flies should
            %change to shortest free path using algorithm
            %(dijkstra)
            tags = [tags, k];
        end
    end
    [~,I] = min(d);
    s = [free_neighbor(tags(I),1), free_neighbor(tags(I),2)]; 
    %s = tan((close(2)-y)/(close(1)-x))
end