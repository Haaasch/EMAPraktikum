% Motorbetrieb der Gleichstrommaschine - Kombinierte Auswertung
% 3.4 Belastungsversuch im Ankerstellbereich
% 3.5 Belastungsversuch in der Feldschwächung
% 3.6 Gegenüberstellung der Messungen

clear;
clc;
close all;

% =========================================================
% 3.4 Belastungsversuch im Ankerstellbereich (IE = 2.4 A)
% =========================================================
%UA = 280V
UA_3_4_1 = [280 280 280 280 280 280];      % Ankerspannung [V]
IA_3_4_1 = [0.2 0.4 0.6 0.8 1.0 1.2];      % Ankerstrom [A]
IE_3_4_1 = [0.78 0.79 0.80 0.80 0.81 0.81]; % Erregerstrom [A]
n_3_4_1  = [1495 1488 1479 1468 1455 1440]; % Drehzahl [1/min]
M_3_4_1  = [0.3 0.6 0.9 1.2 1.5 1.8];      % Drehmoment [Nm]


%UA = 240 V
UA_3_4_2 = [240 240 240 240 240 240];
IA_3_4_2 = [0.2 0.4 0.6 0.8 1.0 1.2];
IE_3_4_2 = [0.79 0.80 0.80 0.81 0.81 0.82];
n_3_4_2  = [1820 1812 1801 1789 1774 1758];
M_3_4_2  = [0.3 0.6 0.9 1.2 1.5 1.8];

% =========================================================
% 3.5 Belastungsversuch in der Feldschwächung (UA = 240 V)
% =========================================================

% IE = 1.8 A
UA_3_5_1 = [240 240 240 240 240 240];
IA_3_5_1 = [0.2 0.4 0.6 0.8 1.0 1.2];
IE_3_5_1 = [0.79 0.80 0.80 0.81 0.81 0.82];
n_3_5_1  = [1820 1812 1801 1789 1774 1758];
M_3_5_1  = [0.3 0.6 0.9 1.2 1.5 1.8];

% IE = 1.2 A
UA_3_5_2 = [240 240 240 240 240 240];
IA_3_5_2 = [0.2 0.4 0.6 0.8 1.0 1.2];
IE_3_5_2 = [0.78 0.79 0.80 0.80 0.81 0.81];
n_3_5_2  = [1495 1488 1479 1468 1455 1440];
M_3_5_2  = [0.3 0.6 0.9 1.2 1.5 1.8];

% =========================================================
% 3.4 Diagramm: Drehzahl n über Drehmoment M
% =========================================================

figure(1);
plot(M_3_4_1, n_3_4_1, '-o', 'LineWidth', 1.5);
hold on;
plot(M_3_4_2, n_3_4_2, '-s', 'LineWidth', 1.5);
grid on;
xlabel('Drehmoment M [Nm]');
ylabel('Drehzahl n [1/min]');
title('3.4 Belastungsversuch im Ankerstellbereich (IE = 2.4 A)');
legend('U_{A|1} = 280 V', 'U_{A|2} = 240 V', ...
       'Location', 'southeast');

% =========================================================
% 3.5 Diagramm: Drehzahl n über Drehmoment M in Feldschwächung
% =========================================================

figure(2);
plot(M_3_5_1, n_3_5_1, '-o', 'LineWidth', 1.5);
hold on;
plot(M_3_5_2, n_3_5_2, '-s', 'LineWidth', 1.5);
grid on;
xlabel('Drehmoment M [Nm]');
ylabel('Drehzahl n [1/min]');
title('3.5 Belastungsversuch in der Feldschwächung (U_{A} = 240 V)');
% Use the fixed excitation currents from the comments: 1.8 A and 1.2 A
legend(sprintf('I_{E} = %.1f A', 1.8), sprintf('I_{E} = %.1f A', 1.2), ...
       'Location', 'southeast');

% =========================================================
% 3.6 Diagramm: Gegenüberstellung aller Messungen
% =========================================================

figure(3);
plot(M_3_4_1, n_3_4_1, '-o', 'LineWidth', 1.5);
hold on;
plot(M_3_4_2, n_3_4_2, '-s', 'LineWidth', 1.5);
plot(M_3_5_1, n_3_5_1, '-^', 'LineWidth', 1.5);
plot(M_3_5_2, n_3_5_2, '-d', 'LineWidth', 1.5);
grid on;
xlabel('Drehmoment M [Nm]');
ylabel('Drehzahl n [1/min]');
title('3.6 Gegenüberstellung: Belastungsversuch im Ankerstellbereich und Feldschwächung');
legend('Ankerstellbereich: U_{A|1} = 280 V, I_E = 2.4 A', ...
       'Ankerstellbereich: U_{A|2} = 240 V, I_E = 2.4 A', ...
       'Feldschwächung: U_{A} = 240 V, I_E = 1.8 A', ...
       'Feldschwächung: U_{A} = 240 V, I_E = 1.2 A', ...
       'Location', 'southeast');
