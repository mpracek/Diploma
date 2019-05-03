function[] = narisi(podatki, zacetek, stevilo_stanj, dolzina)
%S to funkcijo narišemo grafe za  grafièno primerjanje ujemanja dejanskih
%podatkov in našega modela
[najboljsi_rezultat,varianca,najvec,najmanj,rezultat,standard,vrednosti] = HMM(podatki,zacetek,stevilo_stanj, dolzina);
vektor = podatki.data(zacetek+dolzina:zacetek+dolzina+dolzina-1,4);
plot(vektor)
hold on
plot(vrednosti)
hold off
% 
% histogram(nizek)
% histogram(visok)
% histogram(variance)
% histogram(variance, 0:1:400)
% histogram(variance, 0:1:1000)