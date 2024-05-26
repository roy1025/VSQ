clc;
clear all;
path='斑状电荷——电荷.csv';%导入excl
path1='斑状电荷——origin.csv';
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

