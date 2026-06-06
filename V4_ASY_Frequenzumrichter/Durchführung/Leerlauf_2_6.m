
n = [0.2, 0.4, 0.6]

I_1u = [1, 2, 3]

U_u1u2 = [400, 400, 400]

f_i1 = [50, 20, 50]

I2k_peak = [1, 1, 1]
f_i2k = [2, 2, 2]

figure(1);
plot(f_i1, U_u1u2)
title("Statorphasenspannung U_{U1U2} über elektrischer Statorfrequenz f1")

figure(2);
plot(f_i1, I_1u)
title("Statorphasenstrom über elektrischer Statorfrequenz f1")


