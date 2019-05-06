function[vektor_deviacija, vektor_min, vektor_max_] = pearson()
%analiza korelacije med podatki in deviacijo, najmanjsim,....
%xcorr(y) meri avtokorelacijo
vektor_deviacija = zeros(10,1);
vektor_min = zeros(10,1);
vektor_max = zeros(10,1);

vektor_deviacija(1) = corr(amzn.data(1:4953,5),deviation1);
vektor_deviacija(2) = corr(cvx.data(1:11873,5),deviation1);
vektor_deviacija(3) = corr(gm.data(1:1559,5),deviation1);
vektor_deviacija(4) = corr(goog.data(1:716,5),deviation1);
vektor_deviacija(5) = corr(msft.data(1:7783,5),deviation1);
vektor_deviacija(6) = corr(nvs.data(1:3001,5),deviation1);
vektor_deviacija(7) = corr(sbux.data(1:6193,5),deviation1);
vektor_deviacija(8) = corr(trip.data(1:1282,5),deviation1);
vektor_deviacija(9) = corr(tsla.data(1:1658,5),deviation1);
vektor_deviacija(10) = corr(wfc.data(1:8123,5),deviation1);

vektor_min(1) = corr(amzn.data(1:4953,5),deviation1);
vektor_min(2) = corr(cvx.data(1:11873,5),deviation1);
vektor_min(3) = corr(gm.data(1:1559,5),deviation1);
vektor_min(4) = corr(goog.data(1:716,5),deviation1);
vektor_min(5) = corr(msft.data(1:7783,5),deviation1);
vektor_min(6) = corr(nvs.data(1:3001,5),deviation1);
vektor_min(7) = corr(sbux.data(1:6193,5),deviation1);
vektor_min(8) = corr(trip.data(1:1282,5),deviation1);
vektor_min(9) = corr(tsla.data(1:1658,5),deviation1);
vektor_min(10) = corr(wfc.data(1:8123,5),deviation1);

vektor_max(1) = corr(amzn.data(1:4953,5),deviation1);
vektor_max(2) = corr(cvx.data(1:11873,5),deviation1);
vektor_max(3) = corr(gm.data(1:1559,5),deviation1);
vektor_max(4) = corr(goog.data(1:716,5),deviation1);
vektor_max(5) = corr(msft.data(1:7783,5),deviation1);
vektor_max(6) = corr(nvs.data(1:3001,5),deviation1);
vektor_max(7) = corr(sbux.data(1:6193,5),deviation1);
vektor_max(8) = corr(trip.data(1:1282,5),deviation1);
vektor_max(9) = corr(tsla.data(1:1658,5),deviation1);
vektor_max(10) = corr(wfc.data(1:8123,5),deviation1);