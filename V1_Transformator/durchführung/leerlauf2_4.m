% Leerlaufmessung Transformator mit mehreren Spannungsstufen

% --- Primärspannungen  --- 1U1 1U2
U1 = 401.6;

% --- Zugehörige Sekundärspannungen ---
U2U = 66.1;
U2V = 62.4;
U2W = 4.52;

% --- Mittelwert der Sekundärspannungen pro Messpunkt ---
U2_mean = (U2U + U2V + U2W) / 3;

% --- Übersetzungsverhältnis pro Messpunkt ---
uebersetzung = U1 ./ U2_mean;

% --- Ausgabe ---
fprintf(' U1[V]   U2_mean[V]   Übersetzung\n');
for i = 1:length(U1)
    fprintf('%6.1f   %10.2f     %6.3f\n', U1(i), U2_mean(i), uebersetzung(i));
end

% --- Plot (sehr sinnvoll fürs Protokoll) ---
figure;
plot(U1, U2U, 'o-', U1, U2V, 'x-', U1, U2W, 's-');
grid on;
xlabel('Primärspannung U1 [V]');
ylabel('Sekundärspannung [V]');
legend('U2U','U2V','U2W');
title('Leerlauf: Induzierte Spannungen');

% Optional: Mittelwert extra plotten
figure;
plot(U1, U2_mean, 'o-');
grid on;
xlabel('U1 [V]');
ylabel('U2 Mittelwert [V]');
title('Übersetzungsverhalten');
