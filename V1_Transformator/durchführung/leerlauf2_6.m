% --- Messwerte
U1   = 396.7;    % Effektivwert Primärspannung [V]
I0   = 1.82;   % Effektivwert Leerlaufstrom [A]
I0_pk = 3.3;  % Peak-Wert Strom [A]
P0   = 103.1;     % Wirkleistung [W]
Q0   = 726;     % Blindleistung [var]

% --- Berechnungen ---

% Scheinleistung
S0 = U1 * I0;

% Leistungsfaktor
cos_phi = P0 / S0;

% Phasenwinkel
phi = acos(cos_phi);   % in rad
phi_deg = phi * 180/pi;

% Crest-Faktor (zeigt Verzerrung des Stroms)
crest = I0_pk / I0;

% --- Ausgabe ---
fprintf('--- Leerlaufmessung ---\n');

fprintf('U1      = %.2f V\n', U1);
fprintf('I0      = %.3f A\n', I0);
fprintf('I0_peak = %.3f A\n', I0_pk);

fprintf('\nLeistungen:\n');
fprintf('P0 = %.2f W\n', P0);
fprintf('Q0 = %.2f var\n', Q0);
fprintf('S0 = %.2f VA\n', S0);

fprintf('\nLeistungsfaktor:\n');
fprintf('cos(phi) = %.3f\n', cos_phi);
fprintf('phi      = %.2f °\n', phi_deg);

fprintf('\nCrest-Faktor:\n');
fprintf('I_peak / I_eff = %.2f\n', crest);
