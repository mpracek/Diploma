function[nizek, visok, variance] = skozi_vec(datoteka, dolzina, stevilo_stanj)
%S to funkcijo bomo šli skozi celotno datoteko in ugotavljali povazavo.
%Za stevilo stanj predpostavimo 7

podatki = importdata(datoteka);
razdalja = length(podatki.data);
obseg = razdalja-2*dolzina;
nizek = ones(obseg,1);
visok = ones(obseg,1);
variance = ones(obseg,1);
for i = 1: obseg
    [najboljsi_rezultat,varianca,najvec,najmanj,rezultat,vrednosti] = HMM(podatki,i,stevilo_stanj, dolzina);
    nizek(i) = najmanj;
    visok(i) = najvec;
    variance(i) = varianca;
end
