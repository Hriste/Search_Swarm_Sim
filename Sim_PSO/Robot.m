classdef Robot
    
    properties (SetAccess = public, GetAccess = public)
        comm_range
        map 
        position
        v
        prev
        stuck
    end
    
    methods
        function R = Robot(n,m,i,comm)
            %n and m are the intial matix size
            %i is the intial location of the robot (x,y)
            %comm is the communication range
            R.map = zeros(n,m);
            R.position = i;
            R.prev = [i(1)-1, i(2)];
            R.v = 0;
            R.comm_range = comm;
            R.stuck = 6;
        end
        


    end
    methods(Static)
        
    end
    
end

