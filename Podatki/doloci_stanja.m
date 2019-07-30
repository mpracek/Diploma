function[zaporedje] = doloci_stanja(podatki)
%Na vektorju podatki najprej na polovici doloèimo verjetnosti prehodov med
%stanji. Tako najprej doloèimo zaporedje stanj, in nato na naslednji
%polovici poizkusimo ugotoviti prileganje.
dolzina = (length(podatki)-1)/2;
stanja = stanje(1,podatki(1:dolzina));
A = zeros(3,3);
razdalja = length(stanja);
%Tako dobimo zaporedje stanj. Nato izraèunamo prehodno matriko
for i = 1:  razdalja - 1
    if stanja(i) == 1
        if stanja(i+1) == 1
            A(1,1) = A(1,1) + 1;
        elseif stanja(i+1) == 2
            A(1,2) = A(1,2) + 1;
        else stanja(i+1) == 3
            A(1,3) = A(1,3) + 1;
        end
    elseif stanja(i) == 2
        if stanja(i+1) == 1
            A(2,1) = A(2,1) + 1;
        elseif stanja(i+1) == 2
            A(2,2) = A(2,2) + 1;
        else stanja(i+1) == 3;
            A(2,3) = A(2,3) + 1;
        end
        
    else stanja(i) = 3
        if stanja(i+1) == 1
            A(3,1) = A(3,1) + 1;
        elseif stanja(i+1) == 2
            A(3,2) = A(3,2) + 1;
        else stanja(i+1) == 3
            A(3,3) = A(3,3) + 1;
         end
    end
 matrika = 1/(razdalja) * A
end