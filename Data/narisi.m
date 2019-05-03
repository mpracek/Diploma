function[] = narisi(podatki, zacetek, stevilo_stanj, dolzina)
%S to funkcijo nari�emo grafe za  grafi�no primerjanje ujemanja dejanskih
%podatkov in na�ega modela
[najboljsi_rezultat,varianca,najvec,najmanj,rezultat,vrednosti] = HMM(podatki,zacetek,stevilo_stanj, dolzina);
vektor = podatki.data(zacetek+dolzina:zacetek+dolzina+dolzina-1,4);
plot(vektor)
hold on
plot(vrednosti)
hold off