function[najboljsi_rezultat,varianca,najvec,najmanj,rezultat] = HMM(podatki,zacetek,stevilo_stanj)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski model. 
%Stevilo stanj je stevilo, doloceno na podlagi pogleda na podatke. V ve�ini
%primerov iz na�ih podatkov je ta vrednost enaka 10.
%Podatki je vektor podatkov.
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z dejanskimi vrednostmi.
%Rezultat pove, v kak�nem procentu se najbolj verjetno zaporedje ujema z
%nekim poljubnim
zaporedje = podatki.Close;
dolzina = 100;
stevilo_izhodov = 3;
opazovanja = podatki.Close(zacetek:zacetek+dolzina,:);
Prehod = 1/stevilo_stanj .* ones(stevilo_stanj);
Emit = 1/stevilo_izhodov .* ones(stevilo_stanj,stevilo_izhodov);
[prehod,emit] = hmmtrain(opazovanja,Prehod,Emit);
najboljsi_rezultat = hmmviterbi(opazovanja,prehod, emit);
razlika = vektor - najboljsi_rezultat;
najvec = max(razlika);
najmanj = min(razlika);
varianca = var(razlika);
likelystates = hmmviterbi(opazovanja, Prehod, Emit);
rezultat = sum(states==likelystates)/1000;
