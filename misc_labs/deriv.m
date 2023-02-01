h = 1/1024; 
x = 1/2; 
f_d = 1/h * (sin((x + h)/3) - sin(x/3));


fprintf('Computed Deriv: %f\n', f_d);
fprintf('Actual Deriv: %f\n', (1/3)*cos(x/3));