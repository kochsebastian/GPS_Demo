function [data, Fs] = aufnehmen(aufnahmezeit)
%AUFNEHMEN nimmt ein Signal mit Fs = 22050 auf.
% Sobald aufnahmezeit > 5 wird aufnahmezeit auf 5 gesetzt

    Fs = 22050; %Samplingfrequenz
    Channels = 1; % Standardchannel
    Bits = 16; % Standardbits
    
    if aufnahmezeit > 5 % pruefen auf Maximalzeit
        aufnahmezeit = 5;
    end
    
    Recorder = audiorecorder(Fs, Bits, Channels); % create Recorder
    record(Recorder,aufnahmezeit); % aufnehmen
    pause(aufnahmezeit+.1);
    data = getaudiodata(Recorder); % daten sichern
   
    % sound(data, Fs); %test
    
end