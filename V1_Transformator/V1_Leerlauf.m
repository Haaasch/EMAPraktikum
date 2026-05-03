% ==========================================
% Messwerte eingeben
% ==========================================
% U1 = Primärspannung
% I10 = Primärstrom
% U2 = Sekundärspannung
% I2 = Sekundärstrom
h1 = 230
h2 = 0.1:0.2:1.1


U1 = h1 * h2
I10 = [0.0512 0.153 0.256 0.359 0.461 0.563];
U2 = [1.60 4.82 8.05 11.3 14.5 17.7];
cos_phi = [90 90 90 90 90 90]



% ==========================================
% Diagramm 1: I10 über U1
% ==========================================
figure;
plot(U1, I10, '-o', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('I_1 [A]');
title('Primärstrom über Primärspannung');

% ==========================================
% Diagramm 2: U2 über U1
% ==========================================
figure;
plot(U1, U2, '-s', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('U_2 [V]');
title('Sekundärspannung über Primärspannung');

% ==========================================
% Diagramm 4: Leistungsfaktor cosphi
% ==========================================
figure;
plot(U1, cos_phi, '-s', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('cos_phi');
title('cos_phi über Primärspannung');
