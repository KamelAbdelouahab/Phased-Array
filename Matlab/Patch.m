% Patch.m - Script qui trace le diagramme de rayonnement d'un patch
% de longueur L=lambda/2 et W=Lambda/2 dans les plan E et H
% 
% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015
clc;
clear all;
close all;

p=linspace(-pi./2, pi./2,400);
t=linspace(0,pi,400);
lambda=30;
k=2*pi/lambda;

L=lambda./2;
W=lambda./2;

fE=cos(pi.*L./lambda.*sin(p));
fE=20.*log10(fE);

fH=sin(t).*sinc(pi.*W./lambda.*cos(t));
fH=20.*log10(fH);

figure('color',[1 1 1],'units','pixels','Position',[0 0 1500 1500])

subplot(1,2,1)
DIAG_E = mmpolar(p,fE,'Rlimit',[-30 0],'style','compass');
set(DIAG_E,'LineWidth',3.5,'color','black');

subplot(1,2,2)
DIAG_H = mmpolar(t,fH,'Rlimit',[-30 0]);
set(DIAG_H,'LineWidth',3.5,'color','black');


export_fig ./Figures/PatchDiag.png -m2.5
