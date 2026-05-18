% Belastungsversuch der Gleichstrommaschine
% Generatorbetrieb

clear;
clc;
close all;
#n = nb = 750 1/min
% =========================================================
% Messwerte für Erregerstrom IE|1
% =========================================================
%15 ohm ohm, 26.1 ohm, 34,12 ohm
IA_1 = [
       12.37;
       7.26;
       5.59
];      % Ankerstrom [A] (Zeilen = verschiedene Widerstände)
UA_1 = [
       179;
       184;
       186
];    % Ankerspannung [V]
PA_1 = [
       2210;
       1336;
       1035
];        % Ankerleistung [W]

UE_1 = [
       234;
       237;
       239
];    % Erregerspannung [V]
IE_1 = [
       2.4;
       2.4;
       2.4
]; % Erregerstrom [A]
PE_1 = [
       540;
       560;
       571
];           % Erregerleistung [W]


M_1  = [
       32;
       19.5;
       15.8
];    % Drehmoment [Nm] der Messwelle

% =========================================================
% Messwerte für Erregerstrom IE|2
% =========================================================

IA_2 = [
       10.9;
       6.37;
       4.89
];
UA_2 = [
       159;
       163;
       164
];
PA_2 = [
       1743;
       1039;
       804
];

UE_2 = [
       184;
       181;
       182
];
IE_2 = [
       1.81;
       1.8;
       1.8
];
PE_2 = [
       333;
       326;
       328
];


M_2  = [
       26;
       16;
       12.5
];

% =========================================================
% Messwerte für Erregerstrom IE|3
% =========================================================

IA_3 = [
       8.5;
       4.93;
       3.77
];
UA_3 = [
       124;
       127;
       128
];
PA_3 = [
       1058;
       628;
       483
];

UE_3 = [
       122;
       121;
       121
];
IE_3 = [
       1.2;
       1.2;
       1.2
];
PE_3 = [
       149;
       146;
       146
];


M_3  = [
       16;
       10;
       8
];

% =========================================================
% Diagramm: Ankerspannung UA über Ankerstrom IA
% =========================================================

figure;
hold on;
markers = {'-o','-s','-^','-d','-x','-+'};
IA_all = {IA_1, IA_2, IA_3};
UA_all = {UA_1, UA_2, UA_3};
legend_entries = {};
for ie = 1:3
       AImat = IA_all{ie};
       UAmat = UA_all{ie};
       [numR, ~] = size(AImat);
       for r = 1:numR
              % skip empty rows (all NaN)
              if all(isnan(AImat(r,:))) || all(isnan(UAmat(r,:)))
                     continue;
              end
              marker = markers{mod((ie-1)*3 + r - 1, numel(markers)) + 1};
              plot(AImat(r,:), UAmat(r,:), marker, 'LineWidth', 1.5);
              legend_entries{end+1} = sprintf('IE%d R%d', ie, r);
       end
end

grid on;

xlabel('Ankerstrom I_A [A]');
ylabel('Ankerspannung U_A [V]');

title('Belastungsversuch: Ankerspannung über Ankerstrom');

legend(legend_entries, 'Location', 'southeast');
