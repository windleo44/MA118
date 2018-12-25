close all
clear all
format long 
load ('acq.mat')

w=2*pi*fin/fs

A=moindrecarres(w,data,n);

a0=A(1);
a1=A(2);
a2=A(3);

C=a0
phi=atan(a2/a1)
A=a1/(cos(phi))

V=a0+a1*sin(w*n)+a2*cos(w*n);
Erreur=(data-V);

plot(n,Erreur)
title('Signal d`erreur')

varErreur = var(Erreur);

varErreur



