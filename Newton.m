function [X] = Newton(C,A,w,phi,eps)
    load ('acq.mat')
    %PROCESSUS ITERATIF DE NEWTON

    % CALCUL DES VALEURS INITIALES
    [F,J] = FJ(C,A,w,phi);
    X = [C;A;w;phi];
    
    % 1ERE ITERATION
    Xavant = X;
    X = X - inv(J)*F;
    [F,J] = FJ(X(1),X(2),X(3),X(4));
    
    % HEREDITÉ
    while (X(1)-Xavant(1))/Xavant(1) >= eps || (X(2)-Xavant(2))/Xavant(2) >= eps || (X(3)-Xavant(3))/Xavant(3) >= eps || (X(4)-Xavant(4))/Xavant(4) >= eps
        Xavant = X;
        X = X - inv(J)*F;
        [F,J] = FJ(X(1),X(2),X(3),X(4));    
    end
end