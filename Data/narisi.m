function[] = narisi(podatki, zacetek, stevilo_stanj, dolzina)
%S to funkcijo narišemo grafe za  grafièno primerjanje ujemanja dejanskih
%podatkov in našega modela
[najboljsi_rezultat,varianca,najvec,najmanj,rezultat,vrednosti] = HMM(podatki,zacetek,stevilo_stanj, dolzina);
vektor = podatki.data(zacetek+dolzina:zacetek+dolzina+dolzina-1,4);
plot(vektor)
hold on
plot(vrednosti)
hold off