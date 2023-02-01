%Plotting Mandelbrot Set
clear all
close all

i = 20;
m = 200;
x0 = 0;
y0 = 0;
l = 2;
x = linspace(x0-l,x0+l,m);
y = linspace(y0-l,y0+l,m);
[X,Y] = meshgrid(x,y);
z = zeros(m);
c = X+Y*1i;
for k=1:i;
    z = z.^2+c;
    p = exp(-abs(z));
end
colormap default;
pcolor(p);
shading flat;
axis('square');
title('Mandelbrot 2D Plot');
