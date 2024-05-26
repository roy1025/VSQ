clc;
clear all;
path='teng_charge_3600_10%noise.csv';%µº»Îexcl
path1='teng_charge_3600_origin.csv';
[D,TXT]=xlsread(path);
[E,TXT1]=xlsread(path1);
%%
f_noise = D(:,4)';
f_origin = E(:,4)';
h = f_noise-f_origin;
sum = 0;

for i = 1:1:3600;
    sum = sum+h(i)^2;
    i=i+1;
end
f_max=max(f_noise);

SNR = -10*log10(sum/(3600*f_max^2));
PMSE_square = sqrt(sum/(3600*f_max^2));

