function[najboljsi_rezultat,varianca,najvec,najmanj,rezultat,standard,vrednosti] = HMM(podatki, zacetek,stevilo_stanj, dolzina)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski model. 
%Stevilo stanj je stevilo, doloceno na podlagi pogleda na podatke. V veèini
%primerov iz naših podatkov je ta vrednost enaka 10.
%Podatki je vektor podatkov.
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z dejanskimi vrednostmi.
%Rezultat pove, v kakšnem procentu se najbolj verjetno zaporedje ujema z
%nekim poljubnim

%datoteka mora biti navedena v enojnih narekovajih s konènico prek
%naslednjega ukaza:
%podatki = importdata(datoteka);

%Izbor podatkov
opazovanja = podatki.data(zacetek:zacetek+dolzina,4);
opazovanja2 = podatki.data(zacetek-11:zacetek+dolzina,4);

vektor = podatki.data(zacetek+dolzina:zacetek+dolzina+dolzina-1,4);
vrednosti = zeros(dolzina,1);

%stanja so lahko pozitiven trend, ni spremembe ali negativen trend.
%torej rast, padec, stagnacija;
%za trend pogledamo povpreèno ceno zadnjih 10 dni in primerjamo z danajšnjo
%èe je rast, bo vrednost stanja(i) = 3, èe je stagnacija bo 2, èe padec = 1
stanja = zeros(length(opazovanja),1);
for i = 1:dolzina
    if sum(opazovanja2(i:i+10))/10 > opazovanja(i)
        stanja(i) = 3;
    elseif sum(opazovanja2(i:i+10))/10 < opazovanja(i)
        stanja(i) = 1;
    else
        stanja(i) = 2;
    end
end
%Prvi pregled podatkov
[zaporedje, sredina] = kmeans(opazovanja, stevilo_stanj);

%Trening modela
[trans,emis]= hmmestimate(zaporedje, randi(3, length(zaporedje),1));
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

razlika = abs(vektor - vrednosti);

%Statisticna "analiza"
najvec = max(razlika);
najmanj = min(razlika);
varianca = var(razlika);
standard = std(razlika);
rezultat = sum(zaporedje==najboljsi_rezultat)/dolzina;

