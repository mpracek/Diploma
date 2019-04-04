function[] = HMM(file)
%V tej datoteki imamo program, s katerim bomo pogledali skriti markovski
%model
%A = readmatrix(file);
A = file;
zaporedje = A(:,5:end);
dolzina = length(zaporedje)/2;
%dolzina je polovica znanih stanj, ker bomo drugo polovico primerjali z
%dejanskimi vrednostmi.
Prehod = 1/dolzina .* ones(dolzina);
Emit = 1/dolzina .* ones(dolzina);
[prehod,emit] = hmmtrain(zaporedje(1:dolzina),Prehod,Emit);
najboljsi_rezultat = hmmviterbi(zaporedje(1:dolzina),prehod, emit)