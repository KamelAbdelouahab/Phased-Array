% Helice.m - Script qui trace le diagramme de rayonnement
% d'une antenne helice dans le plan E
% 
% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015

clc;
clear all;
close all;

t=linspace(-pi,pi,500);
n=8;
S=7.5;
lambda=30;
k=2*pi/lambda;
delta=-k*S;
psix=k.*S.*cos(t)+delta;
f=cos(t).*sin(n.*psix./2)./sin(psix./2);
f=abs(f./max(f));
f=20.*log10(f);

figure('color',[1 1 1])
% DIAG = mmpolar(t,f,'Rlimit',[-35 0],'style','compass','TTickDelta',30);
% set(DIAG,'LineWidth',3,'color','black');
% 
% export_fig ./Figures/HeliceDiag.png -m2

plot(rad2deg(t),f,'--black','linewidth',2.5)
axis([-180 180 -60 5])
grid on
