function[matrika, vektor_stetja, razlike, vektor_simulacij,stanja, simulacija] = doloci_stanja(podatki)
%Na vektorju podatki najprej na polovici doloèimo verjetnosti prehodov med
%stanji. Tako najprej doloèimo zaporedje stanj, in nato na naslednji
%polovici poizkusimo ugotoviti prileganje.
dolzina = (length(podatki))/2;
stanja = stanje(1,podatki(1:dolzina));
stanja2 = stanje(dolzina, podatki(dolzina:end));
A = zeros(3,3);
razdalja = length(stanja);
vektor_stetja = [sum(stanja(:) == 1),sum(stanja(:) == 2),sum(stanja(:) == 3)];
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
        else stanja(i+1) == 3
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
 matrika = 1/(razdalja) * A;
end
%Matrika je prehodna matrika med stanji. Zanima nas kako bomo prehajali med
%stanji. 
mc = dtmc(matrika);
%figure;
%graphplot(mc,'ColorEdges',true);
%plot(stanja) 
%ylim([0 5])
    
%Simulirajmo prihodnja stanja v pri delnici
numSteps = length(podatki) - dolzina;
simulacija = simulate(mc, numSteps);
vektor_simulacij = [sum(simulacija(:) == 1),sum(simulacija(:) == 2),sum(simulacija(:) == 3)];
%plot(vektor_simulacij)
%ylim([0 5])

%plot(simulacija)
%ylim([0 5])
razlike = simulacija - stanja2;
%hist(razlike)
vektor_razlik = [sum(razlike(:) == -3),sum(razlike(:) == -2), sum(razlike(:) == -1),sum(razlike(:) == 0), sum(razlike(:) == 1),sum(razlike(:) == 2),sum(razlike(:) == 3)]
%plot(vektor_razlik)

%napoved
napoved = simulacija;