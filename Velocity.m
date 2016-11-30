function v = Velocity(c1,c2,w,map,pos,v,gp)
   pi = Frontier_Find(map,pos) ;
   if isempty(pi)
       v = 777
   else
       x = tan(pos(2)/pos(1))*365;
       front = tan(pi(2)/pi(1))*365;

       v = w*v + c1*rand()*(front-x)+ c2*rand()*(gp-x);
   end
   %I don't have a good way of caculating so not including global best position
   %+ c2*rand()*(-x);
end