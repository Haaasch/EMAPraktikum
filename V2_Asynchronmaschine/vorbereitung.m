% --- ASM Vergleichsauswertung rv=0 vs rv=1.5 ---

clear; clc;

% Daten laden
run('kennlinie_rv_0.m');
n0 = n_list;
i10 = i1_vec;
i20 = i2_vec;
torque0 = torque_vec;
f0 = f_vec;

run('kennlinie_rv_1_5.m');
n1 = n_list;
i11 = i1_vec;
i21 = i2_vec;
torque1 = torque_vec;
f1 = f_vec;

% =========================
% 1) Drehmoment über Drehzahl
% =========================
figure;
plot(n0, torque0, 'o-', 'LineWidth', 1.5); hold on;
plot(n1, torque1, 's-', 'LineWidth', 1.5);
grid on;
xlabel('Drehzahl n');
ylabel('Drehmoment [Nm]');
title('Drehmoment über Drehzahl');
legend('rv = 0', 'rv = 1.5');

% =========================
% 2) Schlupffrequenz über Drehzahl
% =========================
figure;
plot(n0, f0, 'o-', 'LineWidth', 1.5); hold on;
plot(n1, f1, 's-', 'LineWidth', 1.5);
grid on;
xlabel('Drehzahl n');
ylabel('Schlupffrequenz [Hz]');
title('Schlupffrequenz über Drehzahl');
legend('rv = 0', 'rv = 1.5');

% =========================
% 3) Drehmoment über Schlupffrequenz
% =========================
figure;
plot(f0, torque0, 'o-', 'LineWidth', 1.5); hold on;
plot(f1, torque1, 's-', 'LineWidth', 1.5);
grid on;
xlabel('Schlupffrequenz [Hz]');
ylabel('Drehmoment [Nm]');
title('Drehmoment über Schlupffrequenz');
legend('rv = 0', 'rv = 1.5');

% =========================
% 4) Rotorstrom über Schlupffrequenz
% =========================
figure;
plot(f0, i20, 'o-', 'LineWidth', 1.5); hold on;
plot(f1, i21, 's-', 'LineWidth', 1.5);
grid on;
xlabel('Schlupffrequenz [Hz]');
ylabel('Rotorstrom I2 [A]');
title('Rotorstrom über Schlupffrequenz');
legend('rv = 0', 'rv = 1.5');
