% Okumura/Hata Model
clc;
close all;
clear all;
freq=800:200:2000;
Hb = 100;
d1 = 5;
d2 = 10;
Hm = 5;
ahm = 3.2*(log10(11.75*Hm)).^2 - 4.97;
%% 1.Urban model%%
Lurban1 = 69.55 + 26.16*log10(d1) + (44.9 -6.55*log10(Hb))*log10(freq) - 13.82*log10(Hb) - ahm;
Lurban2 = 69.55 + 26.16*log10(d2) + (44.9 -6.55*log10(Hb))*log10(freq) - 13.82*log10(Hb) - ahm;
%% 2.Suburban model%%
Lsuburban1 = 69.55 + 26.16*log10(d1) + (44.9 -6.55*log10(Hb))*log10(freq) - 13.82*log10(Hb) -2*(log10(d1/28))^2 +5.4;
Lsuburban2 = 69.55 + 26.16*log10(d2) + (44.9 -6.55*log10(Hb))*log10(freq) - 13.82*log10(Hb) -2*(log10(d2/28))^2 +5.4;
%% 3.Rural model%%
Lrural1 = 69.55 + 26.16*log10(d1) + (44.9 -6.55*log10(Hb))*log10(freq) - (13.82*log10(Hb) -4.78*(log10(d1))^2 +18.33*log10(d1) + 40.94);
Lrural2 = 69.55 + 26.16*log10(d2) + (44.9 -6.55*log10(Hb))*log10(freq) - (13.82*log10(Hb) -4.78*(log10(d2))^2 +18.33*log10(d2) + 40.94);
%% Graph plot
figure(1);
plot(freq, Lurban1, 'r', freq, Lurban2, '--r');
hold on;
plot(freq, Lsuburban1, 'b', freq, Lsuburban2, '--b');
hold on;
plot(freq, Lrural1, 'g', freq, Lrural2, '--g');
hold on;
legend('large urban d1=5km', 'large urban d2=10km', 'suburband1=5km', 'suburban d2=10km', 'rural d1=5km', 'rural d2=10km');
grid on;
xlabel('frequency [MHz]');
ylabel('Path Loss [dB]');
title('Okumura Hata Model LdB v/s frequency Plot');