close all
clear all
format long 
load ('acq.mat')

w=2*pi*fin/fs;

T=variation(w,data,n);

subplot(221)
plot(T(:,1),T(:,2))
title('C en fonction de \omega')
xlabel('\omega') 
ylabel('C(\omega)') 

subplot(222)
plot(T(:,1),T(:,4))
title('\phi en fonction de \omega')
xlabel('\omega') 
ylabel('\phi(\omega)')

subplot(223)
plot(T(:,1),T(:,3))
title('A en fonction de \omega')
xlabel('\omega')  
ylabel('A(\omega)')

subplot(224)
plot(T(:,1),T(:,5))
title('Variance du signal d`erreur')
xlabel('\omega')  
ylabel('varianceErreur(\omega)')

