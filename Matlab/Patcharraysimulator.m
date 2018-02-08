% Patch_Array_simulator - Script qui trace le diagramme de rayonnement
% d'un reseau de 3 antennes patch pour un lobe principal que
% l'utilisateur introduira
% 
% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015

clc;
clear all;
close all;

str=' Angle du lobe principal (en degres) :  ';
wanted=input(str);

t=linspace(-pi/2,pi/2,100);

N=3;

INI_A= -209;
INI_B= -232;
Phase_Att = -8;


lambda=30;
k=2*pi/lambda;
d=lambda/2;
TP=deg2rad(wanted);


delta_r=rad2deg(-k*d*sin(TP));
Phase_A=Phase_Att + delta_r 
Phase_B=Phase_Att + 2*delta_r

[VA VB] = phase2volt(Phase_A,Phase_B);
Arduino_A = roundn(VA/5*255,0);
Arduino_B = roundn(VB/5*255,0);

X = sprintf('\nDelta = %.2f degres',delta_r);
disp(X)
X = sprintf('Tension dephaseur A = %.2f V',VA);
disp(X)
X = sprintf('Tension dephaseur B = %.2f V ',VB);
disp(X)
X = sprintf('Valeur Arduino A = %.0f',Arduino_A);
disp(X)
X = sprintf('Valeur Arduino B = %.0f',Arduino_B);
disp(X)


%BEAM PLOT
L=9.21;
W=6.08;
delta_r=deg2rad(delta_r);

phi=0;
X=k*L/2*sin(t);

f=cos(t).*cos(X)./(X.*X-(pi/2).^2).*sqrt(cos(t).^2+1);
f=20.*log10(f);

psiy=k*d*sin(t)+delta_r;
AF=abs(sin(N*psiy./2)./sin(psiy./2))./N;
AF=20*log10(AF);
f2=(f+AF);

plot(rad2deg(t),f2,'linewidth',2);
axis([-90 90 -20 0]);
grid on

