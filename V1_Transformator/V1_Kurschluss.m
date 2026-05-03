% ==========================================
% Messwerte eingeben
% ==========================================
% U1 = Primärspannung
% I1k = Primärstrom
% U2 = Sekundärspannung
% I2 = Sekundärstrom

U1 = [10 20 30 40 50 60 70 80 90 100]
I1k = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]
I2k = [0.87 1.73 2.6 3.46 4.33 5.2 6.06 6.93 7.8 8.66]
cos_phi = [36 36 36 36 36 36 36 36 36 36]



% ==========================================
% Diagramm 1: I1k über U1
% ==========================================
figure;
plot(U1, I1k, '-o', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('I_1 [A]');
title('Primärstrom über Primärspannung');

% ==========================================
% Diagramm 2: U2 über U1
% ==========================================
figure;
plot(U1, I2k, '-s', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('U_2 [V]');
title('Sekundärstrom über Primärspannung');

% ==========================================
% Diagramm 4: Leistungsfaktor cosphi
% ==========================================
figure;
plot(U1, cos_phi, '-s', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('cos_phi');
title('cos_phi über Primärspannung');
