function[Nizek, Visok, Variance, Deviation] = celoten(dolzina, stevilo_stanj)
%Analiza za vse datoteke
nabor = ["amzn.us.txt", "cvx.us.txt", "gm.us.txt", "goog.us.txt", "msft.us.txt", "nvs.us.txt", "sbux.us.txt", "trip.us.txt", "tsla.us.txt","wfc.us.txt"];
stevec = 0;
for podjetje = 1:length(nabor)
    podatki = importdata(nabor(podjetje));
    razdalja = length(podatki.data);
    obseg = razdalja-2*dolzina;
    stevec = stevec + obseg;
end
stevec;
    
Nizek =  zeros(stevec,1); 
Visok = zeros(stevec,1);
Variance = zeros(stevec,1);
Deviation = zeros(stevec,1);
stevilo = 0;
for podjetje = 1:length(nabor)
    [nizek, visok, variance, deviation] = skozi_vec(nabor(podjetje), dolzina, stevilo_stanj);
    Nizek =  ; 
    Visok = zeros(1,1);
    Variance = zeros(1,1);
    Deviaton = zeros(1,1);
end