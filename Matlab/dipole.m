% dipole.m - Script qui trace le diagramme de rayonnement 
% de plusieurs antennes filaires de differentes longeurs dans le plan E 
% 
% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015

clc;
clear all;
close all;

t=linspace(0,2*pi,400);
figure('color',[1 1 1],'units','pixels','Position',[0 0 1200 400])
subplot(1,3,1)
f=abs(sin(t));
f=20.*log10(f);
DIAG = mmpolar(t,f,'Rlimit',[-20 0],'style','compass','TTickDelta',30);
set(DIAG,'LineWidth',2,'color','black');
title('Doublet de Hertz');


n=0.5;
subplot(1,3,2)
f=(cos(n.*pi.*cos(t))-cos(n.*pi))./sin(t);
f=20.*log10((f./max(f)));
DIAG = mmpolar(t,f,'Rlimit',[-20 0],'style','compass','TTickDelta',30);
set(DIAG,'LineWidth',2,'color','black');
title('l = 0.5 lambda');


n=1.25;
subplot(1,3,3)
f=(cos(n.*pi.*cos(t))-cos(n.*pi))./sin(t);
f=20.*log10((f./max(f)));
DIAG = mmpolar(t,f,'Rlimit',[-20 0],'style','compass','TTickDelta',30);
set(DIAG,'LineWidth',2,'color','black');
title('l = 1.25 lambda');

export_fig ./Figures/Dipolelong.png -m2
