function[najboljsi_rezultat,varianca,najvec,najmanj] = HMM(podatki,stevilo_stanj)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski model. 
%Stevilo stanj je stevilo, doloceno na podlagi pogleda na podatke.
%Podatki je vektor podatkov.
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z dejanskimi vrednostmi.
A = podatki;
zaporedje = A.Close;
dolzina = length(zaporedje)/2;
opazovanja = A.Close(2:dolzina,:);
Prehod = 1/stevilo_stanj .* ones(stevilo_stanj);
Emit = 1/stevilo_stanj .* ones(stevilo_stanj);
[prehod,emit] = hmmtrain(opazovanja,Prehod,Emit);
najboljsi_rezultat = hmmviterbi(opazovanja,prehod, emit);
razlika = vektor - najboljsi_rezultat;
najvec = max(razlika)
najmanj = min(razlika)
varianca = var(razlika)
