echo on

u = rand(3,1)  % a random 3D vector
v = rand(3,1)  % a random 3D vector

w = CrossProduct(u, v)  % the cross product of u and v

ScalarProduct = @(x,y) (x' * y)   % a new scalar product function 

should_be_approximately_zero = ScalarProduct( u, w )
should_be_approximately_zero = ScalarProduct( v, w )

echo off
