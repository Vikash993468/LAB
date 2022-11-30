% Okumura/Hata Model
clc;
close all;
clear all;
d = 1:0.01:15; % Tx-Rx distance
Hb = 100; % Tx height
fc1 = 900;
fc2 = 1200;
fc3 = 1800;
Hm = 5; % Rx height
ahm = 3.2*(log10(11.75*Hm)).^2 - 4.97;
%% 1.Urban model %%
Lurban1 = 69.55 + 26.16*log10(fc1) + (44.9 -6.55*log10(Hb))*log10(d) - 13.82*log10(Hb) - ahm;
Lurban2 = 69.55 + 26.16*log10(fc2) + (44.9 -6.55*log10(Hb))*log10(d) - 13.82*log10(Hb) - ahm;
Lurban3 = 69.55 + 26.16*log10(fc3) + (44.9 -6.55*log10(Hb))*log10(d) - 13.82*log10(Hb) - ahm;
%% 2.Suburban model %%
Lsuburban1 = 69.55 + 26.16*log10(fc1) + (44.9 -6.55*log10(Hb))*log10(d) - 13.82*log10(Hb) - 2*(log10(fc1/28))^2+5.4;
Lsuburban2 = 69.55 + 26.16*log10(fc2) + (44.9 -6.55*log10(Hb))*log10(d) - 13.82*log10(Hb) - 2*(log10(fc2/28))^2+5.4;
Lsuburban3 = 69.55 + 26.16*log10(fc3) + (44.9 -6.55*log10(Hb))*log10(d) - 13.82*log10(Hb) - 2*(log10(fc3/28))^2+5.4;
%% 3.Rural model%%
Lrural1 = 69.55 + 26.16*log10(fc1) + (44.9 -6.55*log10(Hb))*log10(d) - (13.82*log10(Hb) - 4.78*(log10(fc1))^2 +18.33*log10(fc1) + 40.94);
Lrural2 = 69.55 + 26.16*log10(fc2) + (44.9 -6.55*log10(Hb))*log10(d) - (13.82*log10(Hb) -4.78*(log10(fc2))^2 +18.33*log10(fc2) + 40.94);
Lrural3 = 69.55 + 26.16*log10(fc3) + (44.9 -6.55*log10(Hb))*log10(d) - (13.82*log10(Hb) -4.78*(log10(fc3))^2 +18.33*log10(fc3) + 40.94);
%% Graph Plot %%
figure(1);
plot(d, Lurban1, 'r', d, Lurban2, '--r', d, Lurban3,':r');
hold on;
plot(d, Lsuburban1, 'b', d, Lsuburban2, '--b', d, Lsuburban3,':b');

hold on;
plot(d, Lrural1, 'g', d, Lrural2, '--g', d, Lrural3, ':g');
hold on;
legend('large urban fc1=900MHz', 'large urban fc2=1200MHz','large urban fc3=1800MHz', 'suburban fc1=900MHz', 'suburban fc2=1200MHz', 'suburban fc3=1800MHz', 'rural fc1=900MHz', 'rural fc2=1200MHz','rural fc3=1800MHz');
grid on;
xlabel('distance [km]');
ylabel('Path Loss [dB]');
title('Okumura Hata Model LdB v/s Distance Plot');