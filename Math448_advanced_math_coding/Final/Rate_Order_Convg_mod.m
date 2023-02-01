function Rate_Order_Convg_mod(e_nx, e_ny)

% pass in absolute error

%Declare Variables
en = e_nx(4:length(e_nx));
en1 = e_nx(3:length(e_nx)-1);
eny = e_ny(4:length(e_ny));
eny1 = e_ny(3:length(e_ny)-1);
x = polyfit(log(en1),log(en),1);
y = polyfit(log(eny1),log(eny),1);
orderx = x(1);
ratex = exp(x(2));
ordery = y(1);
ratey = exp(y(2));

fprintf('Order And Rate For X:\nOrder: %24.12f, Rate = %24.16f\n', orderx, ratex);
fprintf('Order And Rate For Y:\nOrder: %24.12f, Rate = %24.16f\n', ordery, ratey);







