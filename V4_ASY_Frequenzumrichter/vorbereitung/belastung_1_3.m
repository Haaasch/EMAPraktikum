load('kennlinie_nref.m');
load('kennlinie_n0_5ref.m');
kappa = 3
function Ihat = strom_amplitude(i)

    Imax = max(i);
    Imin = min(i);

    Ihat = (Imax - Imin)/2;

end

%% n_ref

for k = 1:length(data_ref.results)

    d = data_ref.results(k).data;

    f1_ref(k) = mean(d.f1);
    f2_ref(k) = mean(d.f2);

    I2_ref(k) = strom_amplitude(d.i2);

    M_ref(k) = mean(d.M);

end


%% 0.5*n_ref

for k = 1:length(data_half.results)

    d = data_half.results(k).data;

    f1_half(k) = mean(d.f1);
    f2_half(k) = mean(d.f2);

    I2_half(k) = strom_amplitude(d.i2);

    M_half(k) = mean(d.M);

end

figure(1)

plot(f1_ref, f2_ref,'o-','LineWidth',2)
hold on

plot(f1_half, f2_half,'s-','LineWidth',2)

grid on

xlabel('f_1 [Hz]')
ylabel('f_2 [Hz]')

legend('n = n_{Ref}','n = 0.5 n_{Ref}')
title('Rotorfrequenz über Statorfrequenz')

################

figure(2)
M_reff = 20;
plot(M_ref, I2_ref,'o-','LineWidth',2)
hold on

plot(M_half, I2_half,'s-','LineWidth',2)

grid on

xlabel('M [Nm]')
ylabel('\hat{i}_{2k} [A]')

legend('n = n_{Ref}','n = 0.5 n_{Ref}')
title('Amplitude Rotorstrom')

######

M_soll_ref = [-1 -0.5 0 0.5 1];
M_soll_half = [-1 -0.5 0 0.5 1];

M_soll_ref = M_soll_ref*M_reff;
M_soll_half = M_soll_half*M_reff

figure(3)

plot(M_soll_ref, M_ref,'o-','LineWidth',2)
hold on

plot(M_soll_half, M_half,'s-','LineWidth',2)

grid on

xlabel('M_{Last} [Nm]')
ylabel('M [Nm]')

legend('n = n_{Ref}','n = 0.5 n_{Ref}')
title('Maschinenmoment über Lastmoment')
