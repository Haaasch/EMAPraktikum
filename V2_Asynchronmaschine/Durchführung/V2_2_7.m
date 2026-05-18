%% ================================================================
%% Kapitel 2.7 – Belastungsversuch
%% Drehstromasynchronmaschine
%% ================================================================

clear;
clc;
close all;

%% ================================================================
%% 1. KONSTANTEN
%% ================================================================

U10 = 405; %[V] Leiter-Leiterspannung für Belastungsversuch
RV1 = 3*1.5; %[Ohm] Belastungswiderstand

%% ================================================================
%% 2. MESSWERTE EINTRAGEN
%% ================================================================

% Drehmomentmesswert der Messwelle muss immer gleich 0 sein!
% Messwerte an der Phase U entnehmen!

UL = []; % [V] Leiter-Leiter-Spannung im Stator, U10
I10 = []; % [A] Effektivwert des Statorstroms
P01 = []; % Wirkleistung Strang 1 [W]
P02 = []; % Wirkleistung Strang 2 [W]
P03 = []; % Wirkleistung Strang 3 [W]
Q01 = []; % Blindleistung Strang 1 [var]
Q02 = []; % Blindleistung Strang 2 [var]
Q03 = []; % Blindleistung Strang 3 [var]
cphi = []; % Leistungsfaktor
nmech = []; % [min-1] Drehzahl

%% ================================================================
% Wiederholen der Messungen bei belastung durch GSM, sodass Nenndrehzahl der Asynchronmaschine einstellt
% Achte auf Statorspannung!

ULB = []; % [V] Leiter-Leiter-Spannung im Stator, U10
I10B = []; % [A] Effektivwert des Statorstroms
P01B = []; % Wirkleistung Strang 1 [W]
P02B = []; % Wirkleistung Strang 2 [W]
P03B = []; % Wirkleistung Strang 3 [W]
Q01B = []; % Blindleistung Strang 1 [var]
Q02B = []; % Blindleistung Strang 2 [var]
Q03B = []; % Blindleistung Strang 3 [var]
cphiB = []; % Leistungsfaktor
nmechB = []; % [min-1] Drehzahl

%% ================================================================
%% 3. GESAMTLEISTUNGEN
%% ================================================================

% Gesamtwirkleistung
P0 = P01 + P02 + P03;
P0B = P01B + P02B + P03B;

% Gesamtblindleistung
Q0 = Q01 + Q02 + Q03;
Q0B = Q01B + Q02B + Q03B;

%% ================================================================
%% 6. DIAGRAMME
%% ================================================================


% Gesamtwirkleistung A
figure;
subplot(3,2,1);
plot(UL, P0, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Gesamtwirkleistung P_0 [W]');
title('Leerlaufwirkleistung A');

% Gesamtblindleistung A
subplot(3,2,3);
plot(UL, Q0, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Gesamtblindleistung Q_0 [var]');
title('Leerlaufblindleistung A');

% Leistungsfaktor A
subplot(3,2,5);
plot(UL, cphi, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Leistungsfaktor cos(phi)');
title('Leistungsfaktor A');

% Gesamtwirkleistung B
subplot(3,2,2);
plot(ULB, P0B, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Gesamtwirkleistung P_0 [W]');
title('Leerlaufwirkleistung B');

% Gesamtblindleistung B
subplot(3,2,4);
plot(ULB, Q0B, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Gesamtblindleistung Q_0 [var]');
title('Leerlaufblindleistung B');

% Leistungsfaktor B
subplot(3,2,6);
plot(ULB, cphiB, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Leistungsfaktor cos(phi)');
title('Leistungsfaktor B');

% ggf. Alle drei Wirk-/Blindleistungen übereinander
% 3x Wirkleistung A
figure;
subplot(2,2,1);
hold on;
plot(UL, P01);
plot(UL, P02);
plot(UL, P03);
legend('P01', 'P02', 'P03')
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Wirkleistung [W]');
title ('Wirkleistungen');

% 3x Blindleistung A
subplot(2,2,3);
hold on;
plot(UL, Q01);
plot(UL, Q02);
plot(UL, Q03);
legend('Q01', 'Q02', 'Q03')
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Blindleistung [var]');
title ('Blindleistungen');

% ggf. Alle drei Wirk-/Blindleistungen übereinander
% 3x Wirkleistung B
subplot(2,2,2);
hold on;
plot(ULB, P01B);
plot(ULB, P02B);
plot(ULB, P03B);
legend('P01B', 'P02B', 'P03B')
grid on;
xlabel('Leiterspannung U_LB [V]');
ylabel('Wirkleistung B [W]');
title ('Wirkleistungen B');

% 3x Blindleistung B
subplot(2,2,4);
hold on;
plot(ULB, Q01B);
plot(ULB, Q02B);
plot(ULB, Q03B);
legend('Q01B', 'Q02B', 'Q03B')
grid on;
xlabel('Leiterspannung U_L B [V]');
ylabel('Blindleistung B [var]');
title ('Blindleistungen B');
