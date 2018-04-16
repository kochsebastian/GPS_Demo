function plotFigures(N, time,sendeSignal,x, c1, c2, c3, c4)
%plottet alle geforderten Graphen
   figure;
    plot(time,x);
    figure;
    
    subplot(5,1,1);
    plot(time,sendeSignal(:,1));
    subplot(5,1,2);
    plot(time,sendeSignal(:,2));
    subplot(5,1,3);
    plot(time,sendeSignal(:,3));
    subplot(5,1,4);
    plot(time,sendeSignal(:,4));
    subplot(5,1,5);
    plot(time,x);
    
    figure;
    
    subplot(4,1,1);
    plot(time, c1(end-N+1:end));
    
    subplot(4,1,2);
    
    plot(time, c2(end-N+1:end));
    
    subplot(4,1,3);
    
    plot(time, c3(end-N+1:end));
    
    subplot(4,1,4);
     
    plot(time, c4(end-N+1:end));
    
    
end