function input = laengeAnpassen(laenge)
%passt die Laenge des Aussendesignals an
%Hier Goldfolge
    gold = load('SAT_gold1023x5.txt');
    input = gold;
    while laenge > length(input)
        input = vertcat(input,gold);
    end
    input = input(1:laenge,1:4);
end