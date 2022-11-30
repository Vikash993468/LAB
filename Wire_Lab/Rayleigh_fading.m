clear all;
clc;
N = 10^5; %no. of bits to be transferred
SNR_db = 0:2:20;
error = zeros(1, length(SNR_db));
message_bit = rand(1, N); %message
for i = 1:length(message_bit)
if message_bit(i) >= 0.5
x_message(i) = 1;
end
if message_bit(i) < 0.5
x_message(i) = 0;
end
end
% BPSK modulation
for i = 1: length(x_message)
if x_message(i) == 0
x(i) = -1;
end
if x_message(i) == 1
x(i) = 1;
end
end
n = sqrt(1/2) * (randn(1, N) + i*randn(1, N));
% signal transmission
for s = 1:length(SNR_db)
P = 10^(SNR_db(s)/10);
H = sqrt(1/2) * (randn(1, N) + i*randn(1, N));
Y = sqrt(P)*x.*H + n;
Y_hat = Y./H;
for i = 1:N
if real(Y_hat(i)) > 0
x_hat(i) = 1;
end
if real(Y_hat(i)) < 0
x_hat(i) = 0;
end
if x_hat(i) ~= x_message(i)
error(s) = error(s) + 1;
end
end
end
ber = error./N;
semilogy(SNR_db, ber);
xlabel('SNR in db');
ylabel('BER')
title('BER vs SNR for Rayleigh channel');