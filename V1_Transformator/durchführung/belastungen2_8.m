% ===============================
% Belastungsversuch Transformator
% ===============================

% ======== Messwerte eintragen ========

% ---- Ohm'sche Last ----
U1_R = 395;  I1_R = 7.22;  cosP1_R = 0.927;
U2_R = 127;  I2_R = 19.8;  cosP2_R = 0.989;
Ilast_R = 5.78;

% ---- Induktive Last ----
U1_L = 396.2;  I1_L = 8.21;  cosP1_L = 0.179;
U2_L = 192;  I2_L = 19.65;  cosP2_L = 0.166;
Ilast_L = 6.79;

% ---- Kapazitive Last ----
U1_C = 402.3;  I1_C = 4.77;  cosP1_C = 0.265;
U2_C = 133;  I2_C = 19.8;  cosP2_C = 0.135;
Ilast_C = 6.16;

% ======== Berechnung Funktion ========
function auswertung(U1, I1, cosP1, U2, I2, cosP2, Ilast, name)

  S1 = U1 * I1;
  P1 = S1 * cosP1;
  Q1 = sqrt(S1^2 - P1^2);

  S2 = U2 * I2;
  P2 = S2 * cosP2;
  Q2 = sqrt(S2^2 - P2^2);

  eta = P2 / P1;

  fprintf('\n===== %s =====\n', name);

  fprintf('Primärseite:\n');
  fprintf('U1 = %.1f V | I1 = %.2f A | cos(phi1) = %.2f\n', U1, I1, cosP1);
  fprintf('P1 = %.2f W | Q1 = %.2f var | S1 = %.2f VA\n', P1, Q1, S1);

  fprintf('\nSekundärseite:\n');
  fprintf('U2 = %.1f V | I2 = %.2f A | cos(phi2) = %.2f\n', U2, I2, cosP2);
  fprintf('P2 = %.2f W | Q2 = %.2f var | S2 = %.2f VA\n', P2, Q2, S2);

  fprintf('\nLaststrom (Multimeter): %.2f A\n', Ilast);

  fprintf('\nWirkungsgrad: %.2f %%\n', eta*100);

end

% ======== Auswertung aufrufen ========
auswertung(U1_R, I1_R, cosP1_R, U2_R, I2_R, cosP2_R, Ilast_R, 'Resistive Last');
auswertung(U1_L, I1_L, cosP1_L, U2_L, I2_L, cosP2_L, Ilast_L, 'Induktive Last');
auswertung(U1_C, I1_C, cosP1_C, U2_C, I2_C, cosP2_C, Ilast_C, 'Kapazitive Last');
