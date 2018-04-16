function c = KF(x,y)
% KF berechnet die Korrelation zweier Vektoren und gibt einen
% Korrelationsvektor zurück.
%Berechnung nach Vorlesungsunterlagen

    N = length(x);
    n = 1:N;
    
    x = [x ; x];
    x = x - mean(x);
    y = y - mean(y);
    
    for k = 0:N-1
        c(k+1) = sum(x(n + k).* y(n));
    end
    c = 1/N * c;
    c = abs(c);
     
end