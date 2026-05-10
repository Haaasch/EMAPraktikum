% Belastungsversuch der Gleichstrommaschine
% Generatorbetrieb

clear;
clc;
close all;
#n = nb = 750 1/min
% =========================================================
% Messwerte für Erregerstrom IE|1
% =========================================================

IA_1 = [0 0.2 0.4 0.6 0.8 1.0 1.2];      % Ankerstrom [A]
UA_1 = [220 216 211 205 198 190 181];    % Ankerspannung [V]
PA_1 = [0 43 84 123 158 190 217];        % Ankerleistung [W]

UE_1 = [110 110 110 110 110 110 110];    % Erregerspannung [V]
IE_1 = [0.80 0.80 0.81 0.80 0.79 0.80 0.80]; % Erregerstrom [A]
PE_1 = [88 88 89 88 87 88 88];           % Erregerleistung [W]


M_1  = [0.1 0.3 0.5 0.7 0.9 1.1 1.3];    % Drehmoment [Nm] der Messwelle

% =========================================================
% Messwerte für Erregerstrom IE|2
% =========================================================

IA_2 = [0 0.2 0.4 0.6 0.8 1.0 1.2];
UA_2 = [260 255 249 242 234 225 214];
PA_2 = [0 51 100 145 187 225 257];

UE_2 = [110 110 110 110 110 110 110];
IE_2 = [1.20 1.20 1.19 1.21 1.20 1.20 1.19];
PE_2 = [132 132 131 133 132 132 131];


M_2  = [0.2 0.4 0.7 1.0 1.2 1.5 1.8];

% =========================================================
% Messwerte für Erregerstrom IE|3
% =========================================================

IA_3 = [0 0.2 0.4 0.6 0.8 1.0 1.2];
UA_3 = [300 294 287 279 270 259 247];
PA_3 = [0 59 115 167 216 259 296];

UE_3 = [110 110 110 110 110 110 110];
IE_3 = [1.60 1.61 1.60 1.59 1.60 1.61 1.60];
PE_3 = [176 177 176 175 176 177 176];


M_3  = [0.3 0.6 0.9 1.3 1.6 1.9 2.2];

% =========================================================
% Diagramm: Ankerspannung UA über Ankerstrom IA
% =========================================================

figure;
plot(IA_1, UA_1, '-o', 'LineWidth', 1.5);
hold on;

plot(IA_2, UA_2, '-s', 'LineWidth', 1.5);

plot(IA_3, UA_3, '-^', 'LineWidth', 1.5);

grid on;

xlabel('Ankerstrom I_A [A]');
ylabel('Ankerspannung U_A [V]');

title('Belastungsversuch: Ankerspannung über Ankerstrom');

legend('I_{E|1}', 'I_{E|2}', 'I_{E|3}', ...
       'Location', 'southeast');
