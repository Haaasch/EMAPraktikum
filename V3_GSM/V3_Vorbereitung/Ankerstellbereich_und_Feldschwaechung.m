#Ankerstellbereich + Feldschwächung
clc; clear; close all;

%% Drehmomentbereich
M = -50:25:50;

%% 🔽 HIER deine Messwerte eintragen

% Ankerspannung UA1
n_UA1  = [1346, 1224, 1102, 980, 859 ];   % Drehzahl
I_A1   = [-20.6, -10.26, 0.05, 10.36, 20.6 ];   % Ankerstrom

% Ankerspannung UA2
n_UA2  = [1189,1067, 944, 823, 701];   % Drehzahl
I_A2   = [-20.6, -10.26, 0.04, 10.35, 20.6];   % Ankerstrom

# Ankerspannung UA2 mit Feldschwächung I_E2

n_IE2  = [1692,1476, 1259, 1043, 826];   % Drehzahl
I_A_IE2   = [-27.4, -13.7, 0.07, 13.8, 27.6];   % Ankerstrom

# Ankerspannung UA2 mit Feldschwächung I_E3

n_IE3  = [2860, 2373, 1887, 1401, 913];   % Drehzahl
I_A_IE3   = [-41, -20.42, 0.16, 20.75, 41.3];   % Ankerstrom

%% 📊 Diagramm 1: n über M
figure;

plot(M, n_UA1, '-k', 'LineWidth', 2);
hold on;

plot(M, n_UA2, '--r', 'LineWidth', 2);

plot(M, n_IE2, '-.g', 'LineWidth', 2);

plot(M, n_IE3, ':b', 'LineWidth', 2);

grid on;

xlabel('Drehmoment M [Nm]');
ylabel('Drehzahl n [1/min]');

title('Drehzahl n über Drehmoment M');

legend('U_{A1}', ...
       'U_{A2}', ...
       'U_{A2} mit I_{E2}', ...
       'U_{A2} mit I_{E3}', ...
       'Location', 'best');


%% 📊 Diagramm 2: n über I_A
figure;

plot(I_A1, n_UA1, '-k', 'LineWidth', 2);
hold on;

plot(I_A2, n_UA2, '--r', 'LineWidth', 2);

plot(I_A_IE2, n_IE2, '-.g', 'LineWidth', 2);

plot(I_A_IE3, n_IE3, ':b', 'LineWidth', 2);

grid on;

xlabel('Ankerstrom I_A [A]');
ylabel('Drehzahl n [1/min]');

title('Drehzahl n über Ankerstrom I_A');

legend('U_{A1}', ...
       'U_{A2}', ...
       'U_{A2} mit I_{E2}', ...
       'U_{A2} mit I_{E3}', ...
       'Location', 'best');
