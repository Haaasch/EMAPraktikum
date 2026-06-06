clear;
clc;

% Datei laden
load('kennlinie_ASMAmFrequenzumrichter.m');


start_idx = round(length(t_vec)*0.8);

end_idx = start_idx+round(length(t_vec)*0.005);

t = t_vec(start_idx:end);

end_idx = end_idx - start_idx

i1_vec   = i1_vec(1,1:end_idx);
u_uu_vec = u_uu_vec(1:end_idx);
u_uv_vec = u_uv_vec(1:end_idx);
t = t(1:end_idx);

%% -------------------------
%% 1. Diagramm
%% i1U und uU1-N (u_uu_vec)
%% -------------------------
figure(1);

[ax, p1, p2] = plotyy(t, u_uu_vec, t, i1_vec);

grid on;

xlabel('Zeit [s]');
ylabel(ax(1), 'Spannung [V]');
ylabel(ax(2), 'Strom [A]');

title('i1U und uU1-uU2');

set(p1, 'LineWidth', 1.2);
set(p2, 'LineWidth', 1.2);

legend([p1 p2], {'uU1-uU2','i1U'});
%% -------------------------
%% 2. Diagramm
%% i1U und uU1-V (u_uv_vec)
%% -------------------------
figure(2);

[ax, p1, p2] = plotyy(t, u_uv_vec, t, i1_vec);

grid on;

xlabel('Zeit [s]');
ylabel(ax(1), 'Spannung [V]');
ylabel(ax(2), 'Strom [A]');

title('i1U und uU-V');

set(p1, 'LineWidth', 1.2);
set(p2, 'LineWidth', 1.2);

legend([p1 p2], {'uU-V','i1U'});
