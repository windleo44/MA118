function [T] = variation(w,data,n)
    T=zeros(200,5);
    load ('acq.mat')
    wmin = w - w*2e-4;
    wmax = w + w*2e-4;
    pas = (wmax-wmin)/200;
    i = 1;
    for ww=wmin : pas : wmax
        A=moindrecarres(ww,data,n);
        a0=A(1);
        a1=A(2);
        a2=A(3);
        V=a0+a1*sin(ww*n)+a2*cos(ww*n);
        Erreur=(data-V);
        varErreur = var(Erreur);
        
        C=a0;
        phi=atan(a2/a1);
        A=a2/sin(phi);
        
        T(i,1) = ww;
        T(i,2)= C;
        T(i,3) = A;
        T(i,4) = phi;
        T(i,5) = varErr;
        ii = ii + 1;
    end
end
        
        
        