function s = Frontier_Find(map, pos,local)
    x = pos(1);
    y = pos(2);
    [h,w] = size(map);
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
    [bound,~] = size(free_neighbor);
    [halt,~] = size(front);
    tags = [];
    
    %setup for Dijkstra
    nodes = [x y];
    for j = 1:h
        for i = 1:w
            if map(j,i) == 1
                nodes = [nodes;j i];
            end
        end
    end
    nodes = [nodes;1 1];
    [num, ~] = size(nodes);
    distances = [];
    next = [];
    
    [A,~] = size(front);
    for a=1:A
         nodes(num,1) = front(a,1);
         nodes(num,2) = front(a,2);
        [xd,yd,ld] = dijk(nodes);
        distances = [distances ld];
        next = [next;xd yd];
    end
    next;
    [~,I]=min(distances);
    %distances(I) = 1000;
    %[~,I]=min(distances);
     s = [next(I,1),next(I,2)];
    
   
    %%%%%
%     for i = 1:1:halt
%         for k = 1:1:bound
%             
%             d = [d, sqrt((free_neighbor(k,2)-front(i,2))^2 - (free_neighbor(k,1)-front(i,1))^2 )];
%             %currently using shortest distance as crow flies should
%             %change to shortest free path using algorithm
%             %(dijkstra)
%             tags = [tags, k];
%         end
%     end
%     [~,I] = min(d);
%     s = [free_neighbor(tags(I),1), free_neighbor(tags(I),2)];
end