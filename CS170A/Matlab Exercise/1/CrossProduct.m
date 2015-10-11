function w = CrossProduct(u,v)
   %  u and v should be 3-dimensional vectors
   w = [ (u(2) * v(3) - u(3) * v(2)) ;
       - (u(1) * v(3) - u(3) * v(1)) ;
         (u(1) * v(2) - u(2) * v(1)) ];
