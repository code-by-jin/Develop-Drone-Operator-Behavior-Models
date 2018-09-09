function [Trans, Emis, Log_Liks] = HMM_training (all_seq)
Trans = cell(7, 1);
Emis = cell(7, 1);
Log_Liks = zeros(7, 1);
N = 2:8;
for i = N 
    tran = generate_uniform_trans_probs([i,i]);
    emis = generate_random_trans_probs([i,8]);
    [transition, emission, log_likelihood] = hmmtrain(all_seq, tran, emis, 'Maxiterations', 10000, 'Verbose', true);
    Log_Liks(i-1) = log_likelihood(end);
    Trans{i-1} = transition;
    Emis{i-1} = emission;
end