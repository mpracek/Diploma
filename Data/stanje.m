function[stanja] = stanje(zacetek, opazovanja)
%stanja so lahko pozitiven trend, ni spremembe ali negativen trend.
%torej rast, padec, stagnacija;
%za trend pogledamo povpre�no ceno zadnjih 10 dni in primerjamo z danaj�njo
%�e je rast, bo vrednost stanja(i) = 3, �e je stagnacija bo 2, �e padec = 1

stanja = zeros(length(opazovanja),1);
for i = 1:length(opazovanja)-10
    if sum(opazovanja(i:i+10))/10 > opazovanja(i)
        stanja(i) = 3;
    elseif sum(opazovanja(i:i+10))/10 < opazovanja(i)
        stanja(i) = 1;
    else
        stanja(i) = 2;
    end
end

