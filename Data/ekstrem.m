function[nizek_1, visok_1, variance_1, deviation_1] = ekstrem(datoteka, dolzina, stevilo_stanj, zacetek)
%analiza za ekstreme; bitcoin in sp500
%standard_and_poors_csv.csv; zaèetek 706, torej 
ponovitve = 100000;

podatki = importdata(datoteka);
nizek_1 = ones(dolzina,1);
visok_1 = ones(dolzina,1);
variance_1 = ones(dolzina,1);
deviation_1 = ones(dolzina,1);

for i = 1:ponovitve
    [najboljsi_rezultat,varianca,najvec,najmanj,rezultat,standard ,vrednosti] = HMM(podatki,zacetek-dolzina,stevilo_stanj, dolzina);
    nizek_1(i) = najmanj;
    visok_1(i) = najvec;
    variance_1(i) = varianca;
    deviation_1(i) = standard;
end
