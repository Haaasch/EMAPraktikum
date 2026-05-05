% V2.7 Kurzschlussversuch
% NIEMALS IM KURZSCHLUSS NENNSPANNUNG ANLEGEN

% Kurzschluss zwischen 2U2 und 3U1, spezielle Leitungen verwenden
% Muss wegen Temperaturentwicklung schnell druchgeführt werden!
% Setze Spannungsquelle auf Ugrenz = 50V

% 31A ist I_N!
IkN27 = 31/ sqrt(3);

% Erhöhe Spannung auf Primärseite langsam, sodass Ik = 5A

Uk27 = 17.3;

% Erhöhe langsam in 2A Schritten bis I_1N

U1keff27 = [4.77 7.15 9.09 11.1 13.3 15.3 17.3]; % Messe Effektivwerte!  %U27eff = U1 .* U1;
I1keff27 = [5.17 7.72 9.74 11.9 14.1 16.2 18.1]; % passend zu U1eff27
cosPHIk27 = [0.908 0.909 0.909 0.91 0.91 0.911 0.913];
Pk27 = [22.4 50.2 80.5 120 171 225 288];
Qk27 = [10.4 23.0 36.8 54.8 77.6 102 128];
Sk27 = []; % wenn das auch gleich abzulesen ist, sonst:
%Sk27 = U1eff27 .* I1keff;
%cosPHIk27 = Pk27 ./ Sk27; % oder Pk27 ./ (sqrt(pow(Pk27) + pow(Qk27))
U2keffMAX = %ABLESEN bei I_1 = I_N

