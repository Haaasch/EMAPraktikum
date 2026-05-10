#Leerlauf

#n01

I_E_n01 = 0:0.2:2.4
U_A_n01 = 0:29.6:355.2


#n02

I_E_n02 = 0:0.2:2.4
U_A_n02 = 0:21.1:253.7

#n03

U_A_n03 = 0:15.8:190.3
I_E_n03 = 0:0.2:2.4


% ==========================================
% Diagramm 1: I10 über U1
% ==========================================
figure;
plot(I_E_n01, U_A_n01, '-k', 'LineWidth', 2);
hold on;
plot(I_E_n02, U_A_n02, '-o', 'LineWidth', 2);
plot(I_E_n03, U_A_n03, '-m', 'LineWidth', 2);
grid on;
xlabel('Erregerstrom I_E [A]');
ylabel('Ankerspannung U_A [V]');
title('Ankerspannung über Erregerstrom');
legend('n_{01}', 'n_{02}', 'n_{03}');
