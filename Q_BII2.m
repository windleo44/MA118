close all
clear all
format long 
load ('acq.mat')

% VALEURS INITIALES CHOISIES A PARTIR DE LA PREMIERE PARTIE 
C=6.3;
A=1004.9;
w=0.518555;
phi=0.0498;

% CALCUL DE X AVEC LE PROCESSUS ITERATIF DE NEWTON
X = Newton(C,A,w,phi,0.001);

% VALEURS FINALES
C = X(1)
A = X(2)
w = X(3)
phi = X(4)


%SIGNAL D'ERREUR
V=C+A*sin(w*n + phi);
Erreur=V-data;
plot(n,Erreur);
title('Signal erreur');

varErreur = var(Erreur)

varErreur



