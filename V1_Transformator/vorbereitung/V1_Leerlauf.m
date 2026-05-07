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
I10 = [0.072 0.217 0.362 0.507 0.652 0.796]
U2 = [2.27 6.82 11.37 15.92 20.47 25]
cos_phi = [0 0 0 0 0 0]



% ==========================================
% Diagramm 1: I10 über U1
% ==========================================
figure;
plot(U1, I10, '-o', 'LineWidth', 2);
grid on;
xlabel('U_1 [V]');
ylabel('I_{10} [A]');
title('Leerlaufstrom über Primärspannung');

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
ylabel('cos(\phi)');
title('cos(\phi) über Primärspannung');
