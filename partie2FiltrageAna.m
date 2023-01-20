clear all 
close all 
clc




 %Lire le fichier test.wav
[y, fs] = audioread('test.wav');

N=length(y);
te = 1/fs;
t = (0:N-1)*te;
f = (0:N-1)*(fs/N);
fshift = (-N/2:N/2-1)*(fs/N);

%La représentation du Signal dans le domaine temporel
subplot(121)
plot(t,y)
title(' Signal Original' )

%La représentation du Signal dans le domaine fréquentiel
subplot(122)
transF = fft(y);
plot(fshift,fftshift(abs(transF)/N)*2);
title(' la représentation du Signal dans le domaine fréquentiel ' )




% Définir les paramètres de filtrage
fc = 1000; % fréquence de coupure pour un filtre passe-bas
[b, a] = butter(5, fc/(fs/2), 'low'); 

% Obtenir la transmittance complexe du filtre
[H, w] = freqz(b, a);

% Appliquer le filtre au signal
filtered_music = filter(b, a, y);



%la représentation du Signal filtré dans le domaine temporel
% subplot(133);
% plot(filtered_music);
% title('Signal filtré');
% trans2F = fft(filtered_music);

%la représentation du Signal filtré dans le domaine fréquentiel
% subplot(122);
% plot(fshift,fftshift(abs(trans2F)/N)*2);































































% t=linspace(0,length(y)/fs,length(y));




% k = 1;
% fc = 5000;
% %la transmitance complexe 
% h =k./(1+1j*(f/fc).^1000);
% h_filter = [h(1:floor(N/2)), flip(h(1:floor(N/2)))];
% 
% semilogx(f(1:floor(N/2)),abs( h(1:floor(N/2))),'linewidth',1.5)
% 
% % %diagramme de bode en fct de la phase 
% % P = angle(h);
% % P1 = angle(H1);
% % P2 = angle(H2);
% 
% y_filtr = y_trans(1:end-1).*h_filter;
% sig_filtred= ifft(y_filtr,"symmetric");
% 
% plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))))