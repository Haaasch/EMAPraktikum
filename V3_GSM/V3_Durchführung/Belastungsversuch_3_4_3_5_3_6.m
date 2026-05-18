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
UA_3_4_1 = [281, 280,280, 279, 278, 277, 277, 286.6, 286, 285, 284.6, 284, 283.2, 282.5];      % Ankerspannung [V]
IA_3_4_1 = [3.9, 6.3, 8.6, 11, 13.2, 15.6, 18,14, 11.8, 9.6, 7.4, 5.2, 3, 0.78];      % Ankerstrom [A]
IE_3_4_1 = [2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4]; % Erregerstrom [A]
n_3_4_1  = [1078, 1055, 1046, 1039, 1025, 1019, 1012, 1161, 1151, 1141, 1126, 1116, 1106, 1094]; % Drehzahl [1/min]
M_3_4_1  = [6.8, 12.6,18.3,24, 29.7, 35.5, 41.1, -37.8, -32.3, -26.8, -21.3, -15.7, -10.1, -4.5];      % Drehmoment [Nm]


%UA = 240 V
UA_3_4_2 = [240, 240, 239, 239, 238, 237, 236.6, 246.4, 245.7, 245, 244, 243, 243, 242];
IA_3_4_2 = [3.5, 6, 8.2, 10.6, 13, 15.3, 17.7, 14.2, 12, 9.8, 7.6, 5.4, 3.1, 1];
IE_3_4_2 = [2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4  ];
n_3_4_2  = [913, 901, 891, 881, 871, 861, 852, 1013, 994, 982, 971, 960, 953, 942  ];
M_3_4_2  = [6.7, 12.4, 18, 23.8, 29.5, 35.2, 40.8, -38, -32.5, -27, -21.4, -15.8, -10, -4.7];

% =========================================================
% 3.5 Belastungsversuch in der Feldschwächung (UA = 240 V)
% =========================================================

% IE = 1.8 A
UA_3_5_1 = [240, 240, 239, 238, 237.6, 236, 235, 247, 246, 245.5, 244.7, 244, 243, 242];
IA_3_5_1 = [4.1, 6.8, 9.4, 12, 14.7, 17.6, 20.4, 16, 13.5, 11, 8.6, 6, 3.5, 1];
IE_3_5_1 = [1.8, 1.8, 1.8, 1.8, 1.8, 1.8, 1.8, 1.8, 1.8, 1.8, 1.8, 1.8,  1.8, 1.8];
n_3_5_1  = [1028, 1014, 1000, 987, 974, 977, 964, 1153, 1135, 1119, 1109, 1095, 1082,  1067];
M_3_5_1  = [6.7, 12.5, 18, 24, 29.6, 35.3, 41, -38, -32.4, -27, -21.3, -15.8, -10.2, -4.6];

% IE = 1.2 A
UA_3_5_2 = [240, 239, 238, 237, 236, 235, 233.6, 247.5, 247.5, 246.4, 245.4, 244.4, 243, 242.4];
IA_3_5_2 = [5.5, 9, 12.4, 16, 19.8, 23.5, 27.5, 17.6, 17.5, 14.2, 10.9, 7.7, 4.5, 1.28];
IE_3_5_2 = [1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2];
n_3_5_2  = [1338, 1318, 1296, 1275, 1271, 1248, 1239, 1500, 1498, 1465, 1436, 1413, 1393, 1375];
M_3_5_2  = [6.8, 12.6, 18.3, 24, 29.7, 35.5, 41.1, -32.5, -32.3, -26.7, -21.1, -15.6, -9.9, -4.3];

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
plot(M_3_4_1, n_3_4_1, 'o', 'LineWidth', 1.5);
hold on;
plot(M_3_4_2, n_3_4_2, 's', 'LineWidth', 1.5);
plot(M_3_5_1, n_3_5_1, '^', 'LineWidth', 1.5);
plot(M_3_5_2, n_3_5_2, 'd', 'LineWidth', 1.5);
grid on;
xlabel('Drehmoment M [Nm]');
ylabel('Drehzahl n [1/min]');
title('3.6 Gegenüberstellung: Belastungsversuch im Ankerstellbereich und Feldschwächung');

legend('Ankerstellbereich: U_{A|1} = 280 V, I_E = 2.4 A', ...
       'Ankerstellbereich: U_{A|2} = 240 V, I_E = 2.4 A', ...
       'Feldschwächung: U_{A} = 240 V, I_E = 1.8 A', ...
       'Feldschwächung: U_{A} = 240 V, I_E = 1.2 A') ...
       #'Location', 'southeast');
