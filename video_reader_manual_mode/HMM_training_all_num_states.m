function [Trans, Emis, Log_Liks] = HMM_training_all_num_states (all_seq, n_obs, trans_type, emis_type)
Trans = cell(n_obs-1, 1);
Emis = cell(n_obs-1, 1);
Log_Liks = zeros(n_obs-1, 1);
N = 2:n_obs;
for i = N 
    if trans_type == 1
        tran = generate_uniform_trans_probs([i,i]);
    else
        tran = generate_random_trans_probs([i,i]);
    end
    
    if emis_type == 1
        emis = generate_uniform_trans_probs([i,n_obs]);
    else
        emis = generate_random_trans_probs([i,n_obs]);
    end
    
    [transition, emission, log_likelihood] = hmmtrain(all_seq, tran, emis, 'Maxiterations', 10000, 'Verbose', true);
    Log_Liks(i-1) = log_likelihood(end);
    Trans{i-1} = transition;
    Emis{i-1} = emission;
end