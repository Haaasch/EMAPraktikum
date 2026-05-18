U10 = 405; %[V] Effektivwert der Leiter-Leiter-Spannung im Stator für Leerlauf- und Belastungsmessungen
U1k = 105; %[V] Effektivwert der Leiter-Leiter-Spannung im Stator für Kurzschlussmessung
RV1 = 3*1.5; %[Ohm] Belstungswiderstand

%% ================================================================
%% Kapitel 2.6 – Ermittlung der Eisen- und Reibungsverluste
%% Drehstromasynchronmaschine
%% ================================================================

clear;
clc;
close all;

%% ================================================================
%% 1. KONSTANTEN
%% ================================================================

%R1 = 3.2;     % Stator-Phasenwiderstand [Ohm]

%% ================================================================
%% 2. MESSWERTE EINTRAGEN
%% ================================================================

% Ändern Sie den Eﬀektivwert der Statorspannung in 20 V-Schritten von 0,5*U10=202,5V bis 1,1*U10=445,5V
% Ergeben 10 Messwerte

UL = []; % Leiterspannung [V]
I0 = []; % Leerlaufstrom [A]
P01 = []; % Wirkleistung Strang 1 [W]
P02 = []; % Wirkleistung Strang 2 [W]
P03 = []; % Wirkleistung Strang 3 [W]
Q01 = []; % Blindleistung Strang 1 [var]
Q02 = []; % Blindleistung Strang 2 [var]
Q03 = []; % Blindleistung Strang 3 [var]
cphi = []; % Leistungsfaktor
nmech = []; % Tatsächliche Drehzahl [min-1]
nn = ; % Nenndrehzahl vom Typenschild für Schlupf bzw. Eisenverluste

%% ================================================================
%% 3. GESAMTLEISTUNGEN
%% ================================================================

% Gesamtwirkleistung
P0 = P01 + P02 + P03;

% Gesamtblindleistung
Q0 = Q01 + Q02 + Q03;

% Gesamtscheinleistung
S0 = sqrt(P0.^2 + Q0.^2);

% Leistungsfaktor
%cosphi = P0 ./ S0;
%cosphi(S0 == 0) = NaN;

%% ================================================================
%% 4. VERLUSTBERECHNUNG
%% ================================================================

% Stator-Kupferverluste
%PCu1 = 3 .* R1 .* I0.^2;

% Eisen- und Reibungsverluste
%PFe_R = P0 - PCu1;

S = (nn - nmech) ./ nn;
PCu1 = P0 .* S;

%% ================================================================
%% 6. DIAGRAMME
%% ================================================================

% Gesamtwirkleistung
figure;
subplot(4,1,1);
plot(UL, P0, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Gesamtwirkleistung P_0 [W]');
title('Leerlaufwirkleistung');

% Gesamtblindleistung
subplot(4,1,2);
plot(UL, Q0, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Gesamtblindleistung Q_0 [var]');
title('Leerlaufblindleistung');

% Eisen- und Reibungsverluste
subplot(4,1,3);
plot(UL, PCu1, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('P_{Cu1} [W]');
title('Eisen- und Reibungsverluste');

% Leistungsfaktor
subplot(4,1,4);
plot(UL, cphi, 'o-');
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Leistungsfaktor cos(phi)');
title('Leistungsfaktor');

% ggf. Alle drei Wirk-/Blindleistungen übereinander
% 3x Wirkleistung
figure;
subplot(2,1,1);
hold on;
plot(UL, P01);
plot(UL, P02);
plot(UL, P03);
legend('P01', 'P02', 'P03')
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Wirkleistung [W]');
title ('Wirkleistungen');

% 3x Blindleistung
subplot(2,1,2);
hold on;
plot(UL, Q01);
plot(UL, Q02);
plot(UL, Q03);
legend('Q01', 'Q02', 'Q03')
grid on;
xlabel('Leiterspannung U_L [V]');
ylabel('Blindleistung [var]');
title ('Blindleistungen');
