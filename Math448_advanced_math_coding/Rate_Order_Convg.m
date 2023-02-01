clear all
close all

%Declare Variables
x = 0:0.5:10;
ak = 1./(2.^x);
bk = 1./(4.^floor(x./2));
ck = 1./(2.^(2.*x));
dk = 1./(x+1);



