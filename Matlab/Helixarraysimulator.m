% Helix_Array_simulator - Script qui trace le diagramme de rayonnement
% d'un reseau de 3 antennes helices pour un lobe principal que
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

t2=linspace(-pi/2,pi/2,100);
n=8;
S=7.5;
N=3;
lambda=30;
k=2*pi/lambda;
delta=-k*S;
d=25;
Phase_Att = -8;


TP=deg2rad(wanted);
delta_r=rad2deg(-k*d*sin(TP));


Phase_A=Phase_Att + delta_r ;
Phase_B=Phase_Att + 2*delta_r;

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
TP=deg2rad(wanted);
delta_r=-k*d*sin(TP);
D=rad2deg(delta_r);
psiy=k*d*sin(t2)+delta_r;
psiz=k.*S.*cos(t2)+delta;

f=cos(t2).*sin(n.*psiz./2)./sin(psiz./2);
f=abs(f./max(f));
f=20*log10(f);

AF=abs(sin(N*psiy./2)./sin(psiy./2))./N;
AF=20*log10(AF);
f2=f+AF;

plot(rad2deg(t2),f2,'Linewidth',2);
grid on
axis ([-90 90 -40 0]);

% DIAG = mmpolar(t2,f2,'Tlimit',[-pi./2 pi./2],'Rlimit',[-30 0],'style','compas');
% set(DIAG,'LineWidth',1.8)
