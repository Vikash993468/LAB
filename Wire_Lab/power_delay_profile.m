function [delay_spread] = power_delay_profile()
rows = input('No. of rows: ');
for i = 1: rows
tao(i) = input('Tao(i): ');
pr(i) = input('Power(i): ');
end
Y = 0;
x1 = 0;
x2 = 0;
for i = 1: length(tao)
x1 = x1 + tao(i)* (10^(pr(i)/10));
Y = Y + tao(i);
x2 = x2 + tao(i)*tao(i)* (10^(pr(i)/10));
end
z1 = x1/Y;
z2 = x2/Y;
delay_spread = sqrt(z2-(z1*z1));
end