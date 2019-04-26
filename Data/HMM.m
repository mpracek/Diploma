function[najboljsi_rezultat,varianca,najvec,najmanj,rezultat] = HMM(podatki,zacetek,stevilo_stanj)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski model. 
%Stevilo stanj je stevilo, doloceno na podlagi pogleda na podatke. V veèini
%primerov iz naših podatkov je ta vrednost enaka 10.
%Podatki je vektor podatkov.
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z dejanskimi vrednostmi.
%Rezultat pove, v kakšnem procentu se najbolj verjetno zaporedje ujema z
%nekim poljubnim
zaporedje_opazovanj = podatki.Close;
dolzina = 100;
stevilo_izhodov = 3;

opazovanja = podatki.Close(zacetek:zacetek+dolzina,:);
[zaporedje, sredina] = kmeans(opazovanja, stevilo_stanj);

[trans,emis]= hmmestimate(opazovanja, opazovanja);
[prehod,emit] = hmmtrain(opazovanja',trans,emis);
najboljsi_rezultat = hmmviterbi(opazovanja',prehod, emit);
razlika = vektor - najboljsi_rezultat;
najvec = max(razlika);
najmanj = min(razlika);
varianca = var(razlika);
likelystates = hmmviterbi(opazovanja', Prehod, Emit);
rezultat = sum(states==likelystates)/1000;
