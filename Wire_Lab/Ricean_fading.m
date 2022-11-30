clear all;
close all;
clc;
N= 10^6; % Total number of transmitted bits
SNR_db = 0:2:20;
error = zeros(1,length(SNR_db));
k=1.8; % Rician factor
message_bit = rand(1,N); % message
for i=1:length(message_bit)
if message_bit(i)>0.5
X_message(i)=1;
end
if message_bit(i)<0.5
X_message(i)=0;
end
end
for i=1:length(X_message)
if X_message(i)==0
X(i)=-1;
end
if X_message(i)==1
X(i)=1;
end
end
n = sqrt(1/2)*(randn(1,N)+1i*randn(1,N));
% Transmission
for s=1:length(SNR_db)
P = 10^(SNR_db(s)/10);
H_los = sqrt(1/2)*(randn(1,N)+1i*randn(1,N));
H_nlos = sqrt(1/2)*(randn(1,N)+1i*randn(1,N));
H = sqrt(k/(1+k))*H_los + sqrt(1/(1+k))*H_nlos;
Y = sqrt(P)*X.*H+n; % Trasmission
Y_hat = Y./H;
for i=1:N
if real(Y_hat(i))>0
X_hat(i)=1;
end
if real(Y_hat(i))<0
X_hat(i)=0;
end
if X_hat(i)~=X_message(i)
error(s) = error(s)+1;
end
end
end
ber = error./N;
semilogy(SNR_db, ber);
xlabel("SNR in db");
ylabel("BER");
title("BER Vs SNR for Ricien");