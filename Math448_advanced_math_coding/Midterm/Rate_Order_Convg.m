function x = Rate_Order_Convg(fun,s,q_n,q_n1)

%Declare Variables
c = 2; %convergence order
p = fzero(fun,s); %root
p_n = abs(q_n - p)/c;
p_n1 = abs(q_n1 - p);
x = log(p_n1)/log(p_n); 






