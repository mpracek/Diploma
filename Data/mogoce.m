function[] = moogoce(dolzina, stevilo_stanj)

nabor = ["amzn.us.txt", "cvx.us.txt", "gm.us.txt", "goog.us.txt", "msft.us.txt", "nvs.us.txt", "sbux.us.txt", "trip.us.txt", "tsla.us.txt","wfc.us.txt"];
for i = 1:length(nabor)
    [nizek{i}, visok{i}, variance{i}, deviation{i}] = skozi_vec(nabor(i), dolzina, stevilo_stanj)
end
