% --- ASM Vergleichsauswertung rv=0 vs rv=1.5 ---

clear; clc;
close all;

% Daten laden
run('kennlinie_rv_0.m');
n0 = n_list;
i10 = i1_vec;
i20 = i2_vec;
torque0 = torque_vec;
f0 = f_vec;

% Real- und Imaginäranteil I1 (rv=0)
i1r_0 = i1_vec .* cos_vec;
i1i_0 = sqrt(i1_vec.^2 - i1r_0.^2);


run('kennlinie_rv_1_5.m');
n1 = n_list;
i11 = i1_vec;
i21 = i2_vec;
torque1 = torque_vec;
f1 = f_vec;

% Real- und Imaginäranteil I1 (rv=1.5)
i1r_1 = i1_vec .* cos_vec;
i1i_1 = sqrt(i1_vec.^2 - i1r_1.^2);


% =========================
% 1) Drehmoment über Drehzahl
% =========================
figure;
plot(n0, torque0, 'o-'); hold on;
plot(n1, torque1, 's-');
grid on;
xlabel('Drehzahl n');
ylabel('Drehmoment [Nm]');
title('Drehmoment über Drehzahl');
legend('rv=0','rv=1.5');

% =========================
% 2) Schlupffrequenz über Drehzahl
% =========================
figure;
plot(n0, f0, 'o-'); hold on;
plot(n1, f1, 's-');
grid on;
xlabel('Drehzahl n');
ylabel('Schlupffrequenz [Hz]');
title('Schlupffrequenz über Drehzahl');
legend('rv=0','rv=1.5');

% =========================
% 3) Drehmoment über Schlupffrequenz
% =========================
figure;
plot(f0, torque0, 'o-'); hold on;
plot(f1, torque1, 's-');
grid on;
xlabel('Schlupffrequenz [Hz]');
ylabel('Drehmoment [Nm]');
title('Drehmoment über Schlupffrequenz');
legend('rv=0','rv=1.5');

% =========================
% 4) Rotorstrom über Schlupffrequenz
% =========================
figure;
plot(f0, i20, 'o-'); hold on;
plot(f1, i21, 's-');
grid on;
xlabel('Schlupffrequenz [Hz]');
ylabel('Rotorstrom I2 [A]');
title('Rotorstrom über Schlupffrequenz');
legend('rv=0','rv=1.5');

% =========================
% 5) Stromortskurve
% =========================
figure;
plot(i1i_0, i1r_0, 'o-'); hold on;
plot(i1i_1, i1r_1,  's-');

grid on;
axis equal;

xlabel('I_{1r} [A]');
ylabel('I_{1i} [A]');
title('Stromortskurve');

legend('rv=0','rv=1.5');

% --- Schlupf berechnen ---
n_sync = 25;
s0 = (n_sync - n0)/n_sync;

% gewünschte Schlupfwerte
s_mark = 1:-0.25:-1;

for k = 1:length(s_mark)

    % nächsten vorhandenen Datenpunkt finden
    [~, idx] = min(abs(s0 - s_mark(k))); %wo ist s0 = s_mark

    % Markierung für rv=0
    text(i1i_0(idx), i1r_0(idx), ...
         sprintf('s=%.1f', s_mark(k)));

    % Markierung für rv=1.5
    text(i1i_1(idx), i1r_1(idx), ...
         sprintf('s=%.1f', s_mark(k)));

end

n_sync = 25;

% --- Kipppunkt rv=0 ---
[~, idxK0] = max(torque0);

s_kipp0 = (n_sync - n0(idxK0)) / n_sync;

plot(i1i_0(idxK0), i1r_0(idxK0), 'rx', 'markersize', 12, 'linewidth', 2);
text(i1i_0(idxK0), i1r_0(idxK0), ...
    sprintf(' Kipp rv=0\n s=%.2f', s_kipp0));

% --- Kipppunkt rv=1.5 ---
[~, idxK1] = max(torque1);

s_kipp1 = (n_sync - n1(idxK1)) / n_sync;

plot(i1i_1(idxK1), i1r_1(idxK1), 'rx', 'markersize', 12, 'linewidth', 2);
text(i1i_1(idxK1), i1r_1(idxK1), ...
    sprintf(' Kipp rv=1.5\n s=%.2f', s_kipp1));

    legend( ...
    sprintf('rv = 0, s_{kipp} = %.2f', s_kipp0), ...
    sprintf('rv = 1.5, s_{kipp} = %.2f', s_kipp1) ...
);
