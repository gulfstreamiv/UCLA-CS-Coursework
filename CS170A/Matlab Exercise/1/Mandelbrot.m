%----------------------------------------------------------------------------
% Mandelbrot.m
%----------------------------------------------------------------------------

function Mandelbrot(n,t)
global M
%  
%  creates an  n x n  matrix M whose (i,j)-th entry contains the
%  number of iterations (at most t) that the iteration z = z^2 + c
%  completes before |z|>2,  when started at  z=0  and  c = x+iy
%  where x = (i interpolated to n points between -2 and +2)
%  and   y = (i interpolated to n points between -2 and +2)
%
%  Afterwards, M is plotted with 'pcolor(M)' and the 'jet' colormap.
%  You may prefer another colormap; type 'help colormap' to find out more.
%  The list of all colormaps is below; type 'help GRAPH3D' for info.
%
%  Using n=100 and t=30 gives a semi-decent rendering of the Mandelbrot set
%  Using n=200 and t=30 gives a better rendering.
%  Using n=1000 may take a nontrivial amount of time.

x = linspace(-2.0, 0.5, n);
y = linspace(-2.0, 2.0, n);
M = zeros(n,n);

for i=1:n
    for j=1:n
        c = x(i) + y(j)*1i;
        z = 0;
        for k=1:t
            z = z^2 + c;
            if abs(z) >= 2 break; end;
        end;
        M(j,i) = k;
    end;
end;

pcolor(x,y,M)
axis equal
colormap(jet)
colorbar('vert') % put the colormap scale on the right
shading('interp') % interpolate between grid values
zoom on

