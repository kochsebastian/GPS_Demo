function gpsdemo()
    input = load('SAT_gold1023x5.txt');
    %hier aufnehmen einbauen
    [x, Fs] = audioread('Testaufnahme1.wav');
    
    N = length(x)
    time = (0:N-1)/Fs;
    
    subplot(4,1,1);
    c = KF(x,input(:,1));
     plot(time, c(end-N+1:end));
    
    subplot(4,1,2);
    c = KF(x,input(:,2));
     plot(time, c(end-N+1:end));
    
    subplot(4,1,3);
    c = KF(x,input(:,3));
     plot(time, c(end-N+1:end));
    
    subplot(4,1,4);
    c = KF(x,input(:,4));
    
    plot(time, c(end-N+1:end));
    

end

function c = KF(x,y)
    
    N = length(x);
    n = 1:N;
    
    x = [x ; x];
    x = x - mean(x);
    y = y - mean(y);
    
    c = ones(N,1);
    for k = 0:N-1
        c(k+1) = 1/N * sum(x(1:N,1).*y);
        x(1,:) = [];
    end
    c = abs(c);
    
end