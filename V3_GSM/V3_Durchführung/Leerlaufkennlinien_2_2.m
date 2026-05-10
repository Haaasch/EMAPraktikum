#Leerlaufkennlinien

% Kennlinie der Gleichstrommaschine
% UA über IE für verschiedene Drehzahlen

clear;
clc;
close all;

% =========================
% Messung für n0|1 = 1400 1/min
% =========================

IE_n1 = [0.01 0.19 0.41 0.61 0.79 1.02 1.18 1.39 1.61 1.81 2.03 2.21 2.42 2.59 2.81];
UA_n1 = [0 5 11 17 23 28 32 35 37 38 39 39.5 40 40.2 40.3];

% =========================
% Messung für n0|2 = 1000 1/min
% =========================

IE_n2 = [0.00 0.22 0.39 0.63 0.82 1.01 1.19 1.43 1.57 1.84 2.02 2.18 2.41 2.62 2.79];
UA_n2 = [0 8 16 25 33 40 46 50 53 55 56 57 57.5 58 58.2];

% =========================
% Messung für n0|3 = 750 1/min
% =========================

IE_n3 = [0.02 0.18 0.43 0.58 0.81 0.99 1.22 1.38 1.63 1.79 2.01 2.24 2.37 2.61 2.83];
UA_n3 = [0 10 21 32 42 51 58 64 68 71 73 74 75 75.5 76];

% =========================
% Plot
% =========================

figure;

plot(IE_n1, UA_n1, '-o', 'LineWidth', 1.5);
hold on;

plot(IE_n2, UA_n2, '-s', 'LineWidth', 1.5);

plot(IE_n3, UA_n3, '-^', 'LineWidth', 1.5);

grid on;

xlabel('Erregerstrom I_E [A]');
ylabel('Ankerspannung U_A [V]');

title('Leerlaufkennlinie der Gleichstrommaschine');

legend('n_{0|1}', 'n_{0|2}', 'n_{0|3}', ...
       'Location', 'southeast');
