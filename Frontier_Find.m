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
     if size(next) == [0,0]
           s = int16.empty();
    
     else
         s = [next(I,1),next(I,2)];
     end
   
end