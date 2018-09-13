function [Log_Liks, Trans, Emis, Freqs ] = selectModel( path, num_ob_states, num_hidden_states )
% Function to select model. The model with the minimum Log_Liks is chosen
% as the candidate for HMM model.
%
% inputs:
% - path = path to find data
% - num_ob_states = number of observable states
% - num_hidden_states = number of hidden states
%
% written by: Jin Zhou, Duke University
    
    data = read_data(path);
    
    Trans = cell(30, 1);
    Emis = cell(30, 1);
    Log_Liks = zeros(30, 1);
    Freqs = cell(30, 1);
    
    for i=1:30
        if i < 16
            tran = initialize_probs( 'uniform', [num_hidden_states,num_hidden_states] );
        else
            tran = initialize_probs( 'random', [num_hidden_states,num_hidden_states] );
        end
        emis = initialize_probs( 'random', [num_hidden_states,num_ob_states] );
        [transition, emission, log_likelihood] = hmmtrain(data, tran, emis, 'Maxiterations', 10000, 'Verbose', true);
        Log_Liks(i) = log_likelihood(end);
        Trans{i} = transition;
        Emis{i} = emission;
        Freqs{i} = get_freq(data, num_hidden_states, transition, emission);
    end
    
    function freq = get_freq(all_seq, num_hidden, tran, emis)
        freq = zeros(num_hidden, 1);
        for j = 1:length(all_seq)
            estimatedStates = hmmviterbi(all_seq{j},tran,emis);
            for k = 1:length(estimatedStates)
                freq(estimatedStates(k)) = freq(estimatedStates(k)) + 1;
            end
        end
    end

end