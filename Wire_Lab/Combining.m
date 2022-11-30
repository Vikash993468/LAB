%% Rayleigh channel with selection combining
clc;
close all;
clear all;
gamma_ratio_db = -10:2:41;
Ns = [1,3,4,10,20,30];
%% Average SNR
gamma_ratio = 10.^(gamma_ratio_db/10);
y=1-exp(-1./gamma_ratio);
for N = [1,5,10,15,20]
   p_outage = (y).^N; % Outage probability
   hold on ;
   semilogy(gamma_ratio_db,p_outage);
   xlim([-10 30])
end
legend('N=1 ', 'N=5 ', 'N=10', 'N=15', 'N=20');
title("Rayleigh channel with Selection Combining");
xlabel("SNR(dB)");
ylabel("Pr(outage)");