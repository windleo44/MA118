function [A]=moindrecarres(w,data,n)
    x11=1024;
    x12=sum(sin(w*n));
    x13=sum(cos(w*n));
    x22=sum(sin(w*n).^2);
    x23=sum(cos(w*n).*sin(w*n));
    x33=sum(cos(w*n).^2);
    y1=sum(data);
    y2=sum(data.*sin(w*n));
    y3=sum(data.*cos(w*n));
    
    X=[x11 x12 x13 ; x12 x22 x23 ; x13 x23 x33];
    Y=[y1;y2;y3];
    A=inv(X)*Y;
end
    
    
    
    


