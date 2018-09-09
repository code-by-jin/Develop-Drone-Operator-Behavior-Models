function plotBIC (logL, num_all_seq, titlename)
numPara = zeros(14, 1);
N = 2:length(logL)+1;
for i = N
    numPara(i-1) = i*i + i*15;
end
numObs = num_all_seq*ones(14, 1);
[~, bic] = aicbic(logL, numPara, numObs);
plot (N, bic);
