% Ouverture.m - Script qui trace le diagramme de rayonnement d'une patch
% ouverture de dimensions 5 lambda x 2 lambda dans les plan E et H
% 
% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015

clc;
clear all;
close all;

t=linspace(-pi./2,pi./2,400);
lambda=30;
k=2*pi/lambda;
a=5*lambda;
b=2*lambda;

fE= sin(pi.*b./lambda.*sin(t))./(pi*b./lambda.*sin(t));
fE=20.*log10(fE);

fH= cos(t).* sin(pi.*a./lambda.*sin(t))./(pi*a./lambda.*sin(t));
fH=20.*log10(fH);

figure('color',[1 1 1],'units','pixels','Position',[0 0 1500 1500])
subplot(1,2,1)
DIAG_E = mmpolar(t,fE,'Rlimit',[-30 0],'style','compass');
set(DIAG_E,'LineWidth',3,'color','black');

subplot(1,2,2)
DIAG_H = mmpolar(t,fH,'Rlimit',[-30 0],'style','compass');
set(DIAG_H,'LineWidth',3,'color','black');
export_fig ./Figures/OuvertureDiag.png -m2
