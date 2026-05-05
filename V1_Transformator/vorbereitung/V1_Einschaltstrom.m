clear; clc; close all;
% clear     = löscht alle Variablen im Workspace
% clc       = leert das Command Window
% close all = schließt alle offenen Figuren/Fenster

winkel = [0 30 60 90 120];
% Vektor mit allen Phasenverschiebungen in Grad
% Diese Werte werden später nacheinander abgearbeitet

figure;
% Öffnet ein neues Diagrammfenster

hold on;
% Alle folgenden Kurven bleiben im selben Diagramm

grid on;
% Blendet Gitternetz ein

for k = 1:length(winkel)
% Schleife läuft von 1 bis Anzahl der Winkelwerte
% length(winkel) = 5

    grad = winkel(k);
    % Holt aktuellen Winkelwert aus dem Vektor
    % Bei k=1 -> 0
    % Bei k=2 -> 30 usw.

    datei = sprintf('V1_Einschaltstrom_%ddegree.mat', grad);
    % Erstellt automatisch den Dateinamen
    % Beispiel:
    % grad=30 ->
    % 'V1_Einschaltstrom_30degree.mat'

    s = load(datei);
    % Lädt die MAT-Datei in Struktur s

    fn = fieldnames(s);
    % Holt Namen der enthaltenen Variablen als Text (fn =   {'data'})

    data = s.(fn{1});
    % Nimmt die erste Variable aus der Datei (zeit)
    % und speichert sie in data

    if rows(data) == 2
    % Prüft ob Matrix 2 Zeilen hat (2xN)

        data = data';
        % Apostroph = transponieren
        % Aus 2x501 wird 501x2

    end

    t  = data(:,1);
    % Erste Spalte = Zeitvektor
    % : bedeutet alle Zeilen

    I = data(:,2);
    % Zweite Spalte = Signalwerte U1

    h(k) = plot(t, I, 'LineWidth', 1.5);
    % Zeichnet Kurve
    % Speichert Handle in h(k)
    % Handle braucht man für Legende
    % LineWidth = dickere Linie

end

legend(h, ...
% Erstellt Legende für die geplotteten Linien

    '0 Grad Verschiebung U1', ...
    '30 Grad Verschiebung U1', ...
    '60 Grad Verschiebung U1', ...
    '90 Grad Verschiebung U1', ...
    '120 Grad Verschiebung U1', ...
% Texte für jede Linie in gleicher Reihenfolge

    'Location', 'eastoutside');
% Legende rechts außerhalb des Diagramms

xlabel('Zeit [s]');
% Beschriftung x-Achse

ylabel('I [A]');
% Beschriftung y-Achse

title('Einschaltstrom bei verschiedenen Phasenverschiebungen');
% Überschrift des Diagramms

hold off;
% Hebt hold on wieder auf
% Neue Plots überschreiben wieder normal
