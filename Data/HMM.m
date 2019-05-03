function[najboljsi_rezultat,varianca,najvec,najmanj] = HMM(zacetek,stevilo_stanj)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski model. 
%Stevilo stanj je stevilo, doloceno na podlagi pogleda na podatke. V veèini
%primerov iz naših podatkov je ta vrednost enaka 10.
%Podatki je vektor podatkov.
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z dejanskimi vrednostmi.
%Rezultat pove, v kakšnem procentu se najbolj verjetno zaporedje ujema z
%nekim poljubnim
podatki = importdata('amzn.us.txt');
dolzina = 100;
%Izbor podatkov
opazovanja = podatki.data(zacetek:zacetek+dolzina,4);
vektor = podatki.data(zacetek+dolzina:zacetek+dolzina+dolzina-1,4);
vrednosti = zeros(dolzina,1);
matrika = 1/stevilo_stanj * ones(stevilo_stanj);

%Prvi pregled podatkov
[zaporedje, sredina] = kmeans(opazovanja, stevilo_stanj);



%Trening modela
[prehod,emit] = hmmtrain(zaporedje,matrika,matrika);
%[trans,emis]= hmmestimate(zaporedje, states);
%[prehod,emit] = hmmtrain(zaporedje,trans,emis);

%Delni rezultat
najboljsi_rezultat = hmmviterbi(zaporedje,prehod, emit);

for stevilo = 1:(dolzina)
    for stevec = 1:stevilo_stanj
        if najboljsi_rezultat(stevilo) == stevec
            vrednosti(stevilo) = sredina(stevec);
        end
    end
end

razlika = vektor - vrednosti;

%Statisticna "analiza"
najvec = max(razlika);
najmanj = min(razlika);
varianca = var(razlika);
rezultat = sum(zaporedje==najboljsi_rezultat)/1000;

plot(vektor)
hold on
plot(vrednosti)
hold off