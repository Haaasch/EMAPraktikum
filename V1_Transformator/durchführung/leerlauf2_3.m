% Leerlaufkennlinie eines Transformators
% -------------------------------------

clear;
clc;

% =========================
% MESSWERTE HIER EINTRAGEN
% =========================

% Primärspannung U1 in Volt (10% bis 110% in 20% Schritten)
U1 = [39.04 119.7 198.4 275.1 360 442];

% Leerlaufstrom I0 (Effektivwert) in A
I0 = [0.11 0.338 0.581 0.884 1.38 3.24];

% Leistungsfaktor cos(phi)
cos_phi = [0.0 0.244 0.207 0.180 0.158 0.109];

% Wirkleistung P0 in W
P0 = [0.0 9.89 23.9 43.7 78.4 156];

% Blindleistung Q0 in var
Q0 = [0.0 39.26 113.0 239 489 1424];

#{
U1 = [23 46 69 92 115 138 161 184 207 230];
I0 = [0.1 0.12 0.15 0.2 0.28 0.4 0.6 0.9 1.3 1.8];
cos_phi = [0.2 0.22 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6];
P0 = [5 7 10 15 22 35 50 75 110 160];
Q0 = [20 30 45 60 80 110 150 200 270 350];
S0 = []
cos_phi = Po./(U1.*I0)
#}
% =========================
% PLOTS
% =========================

U1 = [23 46 69 92 115 138 161 184 207 230];
I0 = [0.1 0.12 0.15 0.2 0.28 0.4 0.6 0.9 1.3 1.8];
cos_phi = [0.2 0.22 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6];
P0 = [5 7 10 15 22 35 50 75 110 160];
Q0 = [20 30 45 60 80 110 150 200 270 350];



figure;

% 1. Leerlaufstrom über Spannung
subplot(2,2,1);
plot(U1, I0, 'o-b', 'LineWidth', 2);
grid on;
xlabel('U1 [V]');
ylabel('I0 [A]');
title('Leerlaufstrom I0 = f(U1)');

% 2. Wirkleistung über Spannung
subplot(2,2,2);
plot(U1, P0, 'o-r', 'LineWidth', 2);
grid on;
xlabel('U1 [V]');
ylabel('P0 [W]');
title('Wirkleistung P0 = f(U1)');

% 3. Blindleistung über Spannung
subplot(2,2,3);
plot(U1, Q0, 'o-g', 'LineWidth', 2);
grid on;
xlabel('U1 [V]');
ylabel('Q0 [var]');
title('Blindleistung Q0 = f(U1)');

% 4. Leistungsfaktor über Spannung
subplot(2,2,4);
plot(U1, cos_phi, 'o-m', 'LineWidth', 2);
grid on;
xlabel('U1 [V]');
ylabel('cos(\phi)');
title('Leistungsfaktor cos(\phi) = f(U1)');

sgtitle('Leerlaufkennlinie des Transformators');
