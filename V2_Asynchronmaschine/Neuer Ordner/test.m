modelName = 'V2_ASMAmNetz';
n_list = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];
t_val = 14.0;

fprintf('\nStarte Kennlinienaufnahme R=1.5 (I2 aus Zeile 1)...\n');
fprintf('n [1/s] | I1_eff [A] | cosPhi | Torque [Nm] | I2_eff [A] | f2_meas [Hz]\n');
fprintf('------------------------------------------------------------------------\n');

for n = n_list
    f2_calc = abs(25 - n) * 2;
    if f2_calc < 0.5, f2_calc = 0.5; end

    vars = struct('nMech', n, 'f_rotor_sync', f2_calc, 't_span', t_val);
    opts = struct('ModelVars', vars);

    out = plecs('simulate', opts);

    i2_eff  = out.Values(1, end); % Zeile 1 (Rotor Phase A)
    f2_meas = out.Values(4, end); % Zeile 4 (Frequenz)
    torque  = out.Values(5, end); % Zeile 5 (Moment)
    cosPhi  = out.Values(6, end); % Zeile 6 (Leistungsfaktor)
    i1_eff  = out.Values(7, end); % Zeile 7 (Stator Phase A)

    fprintf('%.1f \t| %.2f \t   | %.3f  | %.1f \t | %.2f \t    | %.2f\n', ...
            n, i1_eff, cosPhi, torque, i2_eff, f2_meas);
end
