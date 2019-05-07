function[najboljsi_rezultat,varianca,najvec,najmanj,rezultat,standard,vrednosti] = HMM(podatki, zacetek, dolzina)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski model. 
%Stevilo stanj je stevilo, doloceno na podlagi pogleda na podatke. V veèini
%primerov iz naših podatkov je ta vrednost enaka 10.
%Podatki je vektor podatkov.
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z dejanskimi vrednostmi.
%Rezultat pove, v kakšnem procentu se najbolj verjetno zaporedje ujema z
%nekim poljubnim
%Zaèetek vsaj 11 zaradi definicij
%število stanj je vedno = 3 (glej stanje.m)


%datoteka mora biti navedena v enojnih narekovajih s konènico prek
%naslednjega ukaza:
%podatki = importdata(datoteka);


stevilo_stanj = 3;

%Izbor podatkov
[stanja] = stanje(zacetek, podatki.data(:,4));

opazovanja = podatki.data(zacetek:zacetek+dolzina,4);
stanja2 = stanja(zacetek:zacetek+dolzina);
vektor = podatki.data(zacetek+dolzina:zacetek+dolzina+dolzina-1,4);
vrednosti = zeros(dolzina,1);


%Prvi pregled podatkov
[zaporedje, sredina] = kmeans(opazovanja, stevilo_stanj);

%Trening modela
[trans,emis]= hmmestimate(zaporedje, stanja2);
%[prehod,emit] = hmmtrain(zaporedje,trans,emis);

%Delni rezultat
najboljsi_rezultat = hmmviterbi(zaporedje,trans, emis);

for stevilo = 1:(dolzina)
    for stevec = 1:stevilo_stanj
        if najboljsi_rezultat(stevilo) == stevec
            vrednosti(stevilo) = sredina(stevec);
        end
    end
end

razlika = vektor - vrednosti;

%Statisticna "analiza"
najvec = max(abs(razlika));
najmanj = min(abs(razlika));
varianca = var(razlika);
standard = std(razlika);
rezultat = sum(zaporedje==najboljsi_rezultat)/dolzina;

