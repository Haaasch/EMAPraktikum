#Leerlaufkennlinien

% Kennlinie der Gleichstrommaschine
% UA über IE für verschiedene Drehzahlen

clear;
clc;
close all;

% =========================
% Messung für n0|1 = 1400 1/min
% =========================

IE_n1 = [0, 0.2, 0.39, 0.6, 0.79, 1, 1.19, 1.39, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.81];
UA_n1 = [9.5, 42.7, 79.4, 123, 161, 202.4, 237, 267.5, 294.8, 315, 333, 348, 362, 374, 384];

% =========================
% Messung für n0|2 = 1000 1/min
% =========================

IE_n2 = [0, 0.2, 0.39, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8];
UA_n2 = [7, 30, 57.4, 88.7, 116.6, 146, 171.4, 193, 210, 228, 238, 248, 259, 267, 274];

% =========================
% Messung für n0|3 = 750 1/min
% =========================

IE_n3 = [0, 0.2, 0.4, 0.6, 0.8, 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8];
UA_n3 = [5.55, 22.5, 42.3, 65.9, 86.9, 112.5, 129, 144.6, 157.6, 169, 179, 186, 193.5, 200, 206];

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
