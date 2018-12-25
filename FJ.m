function [F,J] = FJ(C,A,w,phi) 
    load ('acq.mat')
    
    f1 = 2*( 1024*C + A*(sum(sin(w*n+phi))) - sum(data) );
    f2 = 2*( C*(sum(sin(w*n+phi))) + A*(sum(sin(w*n+phi).^2)) - sum(data.*sin(w*n+phi)) );
    f3 = 2*( A*C*(sum(n.*cos(w*n+phi))) + A*A*(sum(n.*sin(w*n+phi).*cos(w*n+phi))) - A*(sum(n.*data.*cos(w*n+phi))) );
    f4 = 2*( A*C*(sum(cos(w*n+phi))) + A*A*(sum(sin(w*n+phi).*cos(w*n+phi))) - A*(sum(data.*cos(w*n+phi))) );

    j11 = 2* 1024;
    j21 = 2* sum(sin(w*n+phi));
    j22 = 2* sum(sin(w*n+phi).^2);
    j31 = 2* A*sum(cos(w*n+phi));
    j32 = 2*( C*sum(n.*cos(w*n+phi)) + 2*A*sum(n.*sin(w*n+phi)) - sum(data.*cos(w*n+phi)) );
    j33 = 2*( (-1)*A*C*sum(n.*sin(w*n+phi)) + A*A*(sum(n.*n.*(cos(w*n+phi).^2-sin(w*n+phi).^2))) + A*sum(n.*data.*sin(w*n+phi)) );
    j41 = 2* A*sum(cos(w*n+phi));
    j42 = 2*( C*sum(cos(w*n+phi)) + 2*A*(sum(cos(w*n+phi).*sin(w*n+phi))) - sum(data.*cos(w*n+phi)) );
    j43 = 2*( (-1)*A*C*sum(n.*n.*sin(w*n+phi)) + A*A*(sum(n.*(cos(w*n+phi).^2-sin(w*n+phi).^2))) + A*sum(n.*n.*data.*sin(w*n+phi)) );
    j44 = 2*( A*C*sum(sin(w*n+phi)) + A*A*(sum(cos(w*n+phi).^2-sin(w*n+phi).^2)) + A*sum(data.*sin(w*n+phi)) );

    J = [j11 j21 j31 j41;j21 j22 j32 j42;j31 j32 j33 j43;j41 j42 j43 j44];
    F = [f1;f2;f3;f4];
end