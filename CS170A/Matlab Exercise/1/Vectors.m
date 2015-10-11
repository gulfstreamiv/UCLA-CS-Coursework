%--------------------------------------------------------------------------
% Vectors.m
%--------------------------------------------------------------------------
%
% some simple vector operations
%

echo on

x = [1 2 3 4 5 6 7 8 9 10]
y = [1^2 2^2 3^2 4^2 5^2 6^2 7^2 8^2 9^2 10^2]
n = length(x)

pause(5)

n = 10
u = 1:n
v = zeros(1,n);
for i=1:n;
  v(i) = u(i)^2;
end;
v

pause(5)

n = 10
p = 1:n
q = p.^2
plot(p,q)

pause(5)

c = linspace(1,n,10)
d = c.^2
plot(c,d,'r-')  % plot red lines (instead of blue default)

pause(5)

e = linspace(1,n,10)
f = e.^2
g = 0.7*e.^2 + 0.3*e + 1.2
plot(e,f,'ro-', e,g,'b+-')
% this makes two overlaid plots, one with red circles, one with blue +'s

echo off


