function[varianca,najvec,najmanj] = Analiza(podatki,stevilo_stanj)
%Rezultat funkcije HMM damo v to in analiziramo podatke
%Podatki so isti kot v HMM
A = podatki;
vektor = HMM(podatki,stevilo_stanj)
zaporedje = A.Close;
dolzina = length(zaporedje)/2;
opazovanja = A.Close(dolzina:end,:);
razlika = vektor - podatki;
najvec = max(razlika)
najmanj = min(razlika)
varianca = var(razlika)
