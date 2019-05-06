function[pearson] = uvoz()

nabor = ["amzn.us.txt", "cvx.us.txt", "gm.us.txt", "goog.us.txt", "msft.us.txt", "nvs.us.txt", "sbux.us.txt", "trip.us.txt", "tsla.us.txt","wfc.us.txt"];
pearson = zeros(length(nabor),1);
for i = 1:length(nabor)
    podatki = importdata(nabor(i));
    koeficient = corr(podatki.data);
    pearson(i) = koeficient(5,5);
end
