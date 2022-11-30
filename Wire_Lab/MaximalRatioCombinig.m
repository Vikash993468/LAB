%%  Maximal Ratio Combining in Rayleigh fading channel
close all;
clear all;
clear
N = 10^6; % number of bits or symbols
%% Transmitter
ip = rand(1,N)>0.5; % generating 0,1 with equal probability
s = 2*ip-1; % BPSK modulation 0 -> -1; 1 -> 0
nRx = [1 2];
Eb_N0_dB = [0:35]; % multiple Eb/N0 values
for jj = 1:length(nRx)
for ii = 1:length(Eb_N0_dB)
n = 1/sqrt(2)*[randn(nRx(jj),N) + j*randn(nRx(jj),N)]; % white gaussian noise, 0dB variance
h = 1/sqrt(2)*[randn(nRx(jj),N) + j*randn(nRx(jj),N)]; % Rayleigh channel
%% Channel and noise Noise addition
sD = kron(ones(nRx(jj),1),s);
y = h.*sD + 10^(-Eb_N0_dB(ii)/20)*n;
%% equalization maximal ratio combining
yHat = sum(conj(h).*y,1)./sum(h.*conj(h),1);
%% receiver - hard decision decoding
ipHat = real(yHat)>0;
% counting the errors
nErr(jj,ii) = size(find([ip- ipHat]),2);
end
end
simBer = nErr/N; %% simulated ber
EbN0Lin = 10.^(Eb_N0_dB/10);
theoryBer_nRx1 = 0.5.*(1-1*(1+1./EbN0Lin).^(-0.5));
p = 1/2 - 1/2*(1+1./EbN0Lin).^(-1/2);
theoryBer_nRx2 = p.^2.*(1+2*(1-p));
close all
figure
semilogy(Eb_N0_dB,theoryBer_nRx1,'g','LineWidth',2);
hold on
semilogy(Eb_N0_dB,theoryBer_nRx2,'b','LineWidth',2);
;
axis([0 35 10^-5 0.5])
grid on
legend('N=1 ', 'N=2 ');
xlabel('Eb/No(dB)');
ylabel('BER');
title('Rayleigh channel with Maximal Ratio Combining');