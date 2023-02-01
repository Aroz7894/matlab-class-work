%Plot Mandelbrot in 3D
clear all
close all

i = 20;
m = 200;
x = 0;
y = 0;
z = 0;
l = 2;
x = linspace(x-l,x+l,m);
y = linspace(y-l,y+l,m);
z = linspace(z-l,z+l,m);
[X,Y,Z] = meshgrid(x,y, z);
g = zeros(m);
c = X+Y*1i + Z*1j;
for k=1:i;
    g = g.^2+c;
    p = exp(-abs(g));
end
colormap default;
pcolor(p);
shading flat;
axis('square','equal','off');
title('Mandelbrot 2D Plot');