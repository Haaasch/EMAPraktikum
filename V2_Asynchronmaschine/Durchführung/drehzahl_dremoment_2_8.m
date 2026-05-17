clc; clear;

%% CSV-Dateien einlesen

files = {
  "csvs/drehzahl_dremoment_2_8_rv0_1800.csv",
  "csvs/drehzahl_dremoment_2_8_rv0_1000.csv",
  "csvs/drehzahl_dremoment_2_8_rv1_5_1000.csv",
  "csvs/drehzahl_dremoment_2_8_rv1_5_1800.csv"
};

for k = 1:length(files)


  fid = fopen(files{k}, "r");

  if fid == -1
    error(["Datei nicht gefunden: ", files{k}]);
  end

  % Header überspringen
  headerLine = fgetl(fid);
  header = strsplit(headerLine, ";");

  % flexible Formatierung (alles als Zahl lesen)
  format = repmat("%f", 1, length(header));

  data = textscan(fid, format, "Delimiter", ";", ...
                  "CollectOutput", true);

  fclose(fid);

  data = data{1};

  % Falls leere Zeilen drin sind → entfernen
  data = data(~any(isnan(data),2), :);

  % Variablen speichern
  M{k}       = data(:,1);
  n{k}       = data(:,2);
  u10{k}     = data(:,3);
  i10{k}     = data(:,4);
  cosphi0{k} = data(:,5);
  p1{k}      = data(:,6);
  q1{k}      = data(:,7);
  p2{k}      = data(:,8);
  q2{k}      = data(:,9);
  p3{k}      = data(:,10);
  q3{k}      = data(:,11);
  i2_peak{k} = data(:,12);
  i2_freq{k} = data(:,13);

end





%% Daten nach RV0 und RV1_5 gruppieren
n_rv0 = [n{1}(:); n{2}(:)];
M_rv0 = [M{1}(:); M{2}(:)];
u10_rv0 = [u10{1}(:); u10{2}(:)];
i10_rv0 = [i10{1}(:); i10{2}(:)];
cosphi0_rv0 = [cosphi0{1}(:); cosphi0{2}(:)];
p1_rv0 = [p1{1}(:); p1{2}(:)];
q1_rv0 = [q1{1}(:); q1{2}(:)];
p2_rv0 = [p2{1}(:); p2{2}(:)];
q2_rv0 = [q2{1}(:); q2{2}(:)];
p3_rv0 = [p3{1}(:); p3{2}(:)];
q3_rv0 = [q3{1}(:); q3{2}(:)];
i2_peak_rv0 = [i2_peak{1}(:); i2_peak{2}(:)];
i2_freq_rv0 = [i2_freq{1}(:); i2_freq{2}(:)];

n_rv15 = [n{3}(:); n{4}(:)];
M_rv15 = [M{3}(:); M{4}(:)];
u10_rv15 = [u10{3}(:); u10{4}(:)];
i10_rv15 = [i10{3}(:); i10{4}(:)];
cosphi0_rv15 = [cosphi0{3}(:); cosphi0{4}(:)];
p1_rv15 = [p1{3}(:); p1{4}(:)];
q1_rv15 = [q1{3}(:); q1{4}(:)];
p2_rv15 = [p2{3}(:); p2{4}(:)];
q2_rv15 = [q2{3}(:); q2{4}(:)];
p3_rv15 = [p3{3}(:); p3{4}(:)];
q3_rv15 = [q3{3}(:); q3{4}(:)];
i2_peak_rv15 = [i2_peak{3}(:); i2_peak{4}(:)];
i2_freq_rv15 = [i2_freq{3}(:); i2_freq{4}(:)];







%% Wirkungsgrad berechnen

% Wirkungsgrad für rv0 und rv15
omega_rv0 = 2*pi*n_rv0/60;
P_out_rv0 = M_rv0 .* omega_rv0;
P_in_rv0  = p1_rv0 + p2_rv0 + p3_rv0;
eta_rv0 = P_out_rv0 ./ P_in_rv0;

omega_rv15 = 2*pi*n_rv15/60;
P_out_rv15 = M_rv15 .* omega_rv15;
P_in_rv15  = p1_rv15 + p2_rv15 + p3_rv15;
eta_rv15 = P_out_rv15 ./ P_in_rv15;






%% Plots erstellen

% Synchrone Drehzahl
n_sync = 25*60;  % rpm

% Kippschlupf berechnen (Index des maximalen Drehmoments)
[M_max_rv0, idx_max_rv0] = max(M_rv0);
n_kipp_rv0 = n_rv0(idx_max_rv0);
s_kipp_rv0 = (n_sync - n_kipp_rv0) / n_sync;

[M_max_rv15, idx_max_rv15] = max(M_rv15);
n_kipp_rv15 = n_rv15(idx_max_rv15);
s_kipp_rv15 = (n_sync - n_kipp_rv15) / n_sync;

figure; hold on;
plot(n_rv0, M_rv0);
plot(n_rv15, M_rv15);
% Kippschlupf-Punkte markieren
plot(n_kipp_rv0, M_max_rv0, 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'red', 'LineWidth', 2);
plot(n_kipp_rv15, M_max_rv15, 's', 'MarkerSize', 8, 'MarkerFaceColor', 'blue', 'LineWidth', 2);
% Schlupf-Werte anzeigen
text(n_kipp_rv0, M_max_rv0 + 0.5, sprintf('s=%.3f', s_kipp_rv0), 'HorizontalAlignment', 'center');
text(n_kipp_rv15, M_max_rv15 + 0.5, sprintf('s=%.3f', s_kipp_rv15), 'HorizontalAlignment', 'center');
xlabel("n [rpm]");
ylabel("M [Nm]");
legend("RV0","RV1_5");
title("Drehmoment über Drehzahl");


%f2 über n
figure; hold on;
plot(n_rv0, i2_freq_rv0);
plot(n_rv15, i2_freq_rv15);
xlabel("n [rpm]");
ylabel("f2 [Hz]");
legend("RV0","RV1_5");
title("Schlupffrequenz");

figure; hold on;
%M über f2
plot(i2_freq_rv0, M_rv0);
plot(i2_freq_rv15, M_rv15);
xlabel("f2 [Hz]");
ylabel("M [Nm]");
legend("RV0","RV1_5");
title("M über Schlupffrequenz");

%i2 peak über f2
figure; hold on;
plot(i2_freq_rv0, i2_peak_rv0);
plot(i2_freq_rv15, i2_peak_rv15);
xlabel("f2 [Hz]");
ylabel("i2 peak [A]");
legend("RV0","RV1_5");
title("Rotorstrom");

%wirkungsgrad
figure; hold on;
plot(n_rv0, eta_rv0);
plot(n_rv15, eta_rv15);
xlabel("n [rpm]");
ylabel("η [-]");
legend("RV0","RV1_5");
title("Wirkungsgrad");


