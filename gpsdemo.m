function gpsdemo()
    
    posS1 = [9.19, 2.82];
    posS2 = [0.12, 6.13];
    posS3 = [0.30, 1.39];
    posS4 = [0.30, 6.11];
    
    c_s = 343;
   
    input = load('SAT_gold1023x5.txt');
    %hier aufnehmen einbauen
    [x, Fs] = audioread('Testaufnahme1.wav');
    
    N = length(x);
    time = (0:N-1)/Fs;
    
    subplot(4,1,1);
    c1 = KF(x,input(:,1));
    [max1,index1] = max(c1);
    time_peak1 = time(index1);
    plot(time, c1(end-N+1:end));
    
    subplot(4,1,2);
    c2 = KF(x,input(:,2));
    [max2,index2] = max(c2);
    time_peak2 = time(index2);
    plot(time, c2(end-N+1:end));
    
    subplot(4,1,3);
    c3 = KF(x,input(:,3));
    [max3,index3] = max(c3);
    time_peak3 = time(index3);
    plot(time, c3(end-N+1:end));
    
    subplot(4,1,4);
    c4 = KF(x,input(:,4));
    [max4,index4] = max(c4);
    time_peak4 = time(index4); 
    plot(time, c4(end-N+1:end));
    
    
    
    x0 = 5;
    y0 = 3;
    
    
    
    
    t_shift = 0;
    start = [x0;
             y0;
             t_shift];
         
         P_1 = c_s * time_peak1;
        P_2 = c_s * time_peak2;
        P_3 = c_s * time_peak3;
        P_4 = c_s * time_peak4;
        
    for i=0:10
    
        L1 = sqrt((posS1(1)-start(1))^2 + ((posS1(2)-start(2))^2));
        L2 = sqrt((posS2(1)-start(1))^2 + ((posS2(2)-start(2))^2));
        L3 = sqrt((posS3(1)-start(1))^2 + ((posS3(2)-start(2))^2));
        L4 = sqrt((posS4(1)-start(1))^2 + ((posS4(2)-start(2))^2));

       
        A = [(x0-posS1(1))/L1 (y0-posS1(2))/L1 c_s;
             (x0-posS2(1))/L2 (y0-posS2(2))/L2 c_s;
             (x0-posS3(1))/L3 (y0-posS2(2))/L3 c_s;
             (x0-posS4(1))/L4 (y0-posS2(2))/L4 c_s];


        P_V = [P_1 - L1;
               P_2 - L2;
               P_3 - L3;
               P_4 - L4];


        V = A\P_V;

        start(1)= start(1) + V(1);
        start(2)= start(2) + V(2);
        start(3) = V(3);
    
    end
    start(1)
    start(2)

end

function c = KF(x,y)
    
    N = length(x);
    n = 1:N;
    
    x = [x ; x];
    x = x - mean(x);
    y = y - mean(y);
    
    c = ones(N,1);
    for k = 0:N-1
       % c(k+1) = 1/N * sum(x(1:N,1).*y);
        c(k+1) = sum(x(n + k).* y(n));
       % x(1,:) = [];
    end
    c = 1/N * c;
    c = abs(c);
     
end