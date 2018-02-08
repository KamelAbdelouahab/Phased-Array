% PatchDim.m - Script calculant les dimensions d'une antenne patch
% rectangulaire ainsi que son impedance d'entree. 
% L'utilisateur entrera la frèquence de travail et les caracteristiques
% du substrat
close all;
clear all;
clc;


% AQUISITION DES PARAMETRES
str=' Frequence centrale du patch (GHz) :  ';
freq=input(str);
str=' Permitivite relative er du substrat :  ';
er=input(str);
str=' Epaisseur h du substrat (mm) :  ';
h=input(str);


% DIMENSIONS DU PATCH
Wp=300.0/(2.0*freq)*sqrt(2.0/(er+1.0));
ereff=(er+1.0)/2.0+(er-1)/(2.0*sqrt(1.0+12.0*h/Wp));
dl=0.412*h*((ereff+0.3)*(Wp/h+0.264))/((ereff-0.258)*(Wp/h+0.8));
lambda_o=300.0/freq;
lambda=300.0/(freq*sqrt(ereff));
Leff=300.0/(2.0*freq*sqrt(ereff));
Lp=Leff-2.0*dl;
k=2.0*pi/lambda;
ko=2.0*pi/lambda_o;
eta=120*pi/sqrt(ereff);

% CALCUL D'IMPEDANCE
X=2*pi*Wp./lambda_o;
G1=1./(eta*pi).*(-2+cos(X)+X.*sinint(X)+sinc(X));
f12=@(t) (sinc(cos(t).*(ko*Wp/2)./pi).^2.*sin(t).^2.*besselj(0,sin(t)
.*(ko*Lp)).*sin(t).*((ko*Wp/2)^2));
G12=integral(f12,0,pi)./(120*pi^2);
Rin0=(2.*(G1+G12))^-1;

% DIMENSIONS DE LA LIGNE D'ALIMENTATION
Zf=50;
B=(377*pi)./(2*Zf*sqrt(er));
Wf=(2*h/pi)*(B-1-log(2*B-1)+((er-1)/(2*er))*(log(B-1)+0.39-(0.61/er)));
erefff=(er+1.0)/2.0+(er-1)/(2.0*sqrt(1.0+12.0*h/Wf));
lambdaf=300.0/(freq*sqrt(erefff));
Lf=lambdaf/8;

% DIMENSIONS DE LA LIGNE QUART D'ONDE
Zs=sqrt(Zf*Rin0);
A=(Zs/60)*sqrt((er+1)/2)+((er-1)/(er+1))*(0.23+(0.11/er));
Ws=h*8*exp(A)/(exp(2*A)-2);
ereffs=(er+1.0)/2.0+(er-1)/(2.0*sqrt(1.0+12.0*h/Ws));
lambdas=300.0/(freq*sqrt(ereffs));
Ls=lambdas/4;

% AFFICHAGE DES RESULTATS
X = sprintf('\n \nLargeur du Patch Wp = %.2f mm ',Wp);
disp(X)
X = sprintf('Longueur du Patch Lp = %.2f mm ',Lp);
disp(X)
X = sprintf('Impedance d entree du Patch Zin = %.0f Ohms ',Rin0);
disp(X)
X = sprintf('Largeur de la ligne dalimentation  Wf = %.2f mm ',Wf);
disp(X)
X = sprintf('Longueur de la ligne dalimentation  Ls= %.2f mm ',Lf);
disp(X)
X = sprintf('Impedance caracteristique de la ligne quart d onde Zs = %.0f Ohms ',Zs);
disp(X)
X = sprintf('Largeur de la ligne quart donde  Ws = %.2f mm ',Ws);
disp(X)
X = sprintf('Longueur de la ligne quart donde  Ls= %.2f mm ',Ls);
disp(X)

% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015
