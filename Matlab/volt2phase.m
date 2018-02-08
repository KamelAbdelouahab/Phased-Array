% volt2phase.m  : interpole les resultats des dephaseurs et donne 
% à une tension donne sa phase correspondante
% phiA,phiB = volt2phase ( tensionA , tensionB )
% 
% FAIT PAR ABDELOUAHAB KAMEL EDDINE / BENSMAIL CHAHIR
% ANTENNE RESEAU A COMMANDE DE PHASE - PFE -
% ECOLE NATIONALE POLYTECHNIQUE - ENP ALGER  - JUIN 2015
function [phiA,phiB] = volt2phase(VA,VB)

    V1=[[0:1],[3:51]]*25./255;
    V2=[[0:12],[14:51]]*25./255;

    
    PA=[[151 165]-360 -172 -160 -149 -139 -130 -120 -112 -102 -94 -87 -80 -73 -65 -59 -52 -46 -40 -34 -28 -22 -17 -11 -6 -2 3 7 12 16 21 25 29  33 37 40 44 47 51 55 58 61 64 68 71 74 77 80 83 86 88];
    PB=[[128 142 156 169]-360 -181 -171 -161 -150 -141 -132 -123 -113 -106 -89 -83 -76 -70 -63 -57 -51 -45 -39 -35 -30 -25 -21 -17 -12 -8 -4 0 3 7 10 13 17 20 23 26 28 31 34 37 39 43 45 48 50 53 55 57]; 

    P=polyfit(V1,PA,4);
    Q=polyfit(V2,PB,4);

    phiA=polyval(P,VA)
    phiB=polyval(Q,VB)
   
end

