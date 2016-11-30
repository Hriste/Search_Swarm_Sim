classdef Robot
    
    properties (SetAccess = public, GetAccess = public)
        comm_range
        map 
        position
        velocity
    end
    
    methods
        function R = Robot(n,m,i,comm)
            %n and m are the intial matix size
            %i is the intial location of the robot (x,y)
            %comm is the communication range
            R.map = zeros(n,m);
            R.position = i;
            R.velocity = 0;
            R.comm_range = comm;
        end
        


    end
    methods(Static)
        
    end
    
end

