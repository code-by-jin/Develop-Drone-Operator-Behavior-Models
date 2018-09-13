function plotBIC( path, num_ob_states )
% Function to plot multiple BIC(Bayesian Information Criterion) curves and
% decide hidden states numbers for HMM model.
%
% inputs:
% - path = path to find data
% - num_ob_states = number of observable states
%
% written by: Jin Zhou, Duke University

    % read data from the path
    data = read_data(path);
    
    num_data = sum(cellfun('prodofsize', data)); % number of the data
    num_para = zeros(num_ob_states-1, 1); % number of the parameters
    for i = 2:num_ob_states
        num_para(i-1) = i*i + i*num_ob_states;
    end
    
    figure;
    helpPlotBIC (data, num_ob_states, num_data, num_para, 'uniform', 'random');hold on;
    helpPlotBIC (data, num_ob_states, num_data, num_para, 'uniform', 'random');hold on;
    helpPlotBIC (data, num_ob_states, num_data, num_para, 'random', 'random');hold on;
    helpPlotBIC (data, num_ob_states, num_data, num_para, 'random', 'random');hold on;
    
    xticks(2:1:15);
    grid on;
    legend({'UT+RE','UT+RE', 'RT+RE', 'RT+RE'}, 'Location','northwest');
    lgd.NumColumns = 2;
    xlabel('Number of Hidden States');
    ylabel('BIC');
    
    function helpPlotBIC (data, num_ob_states, num_data, num_para, trans_type, emis_type)
    % Function to plot one BIC curve for give initialization of transition
    % and emission probabilities.
    
        % initialize trainsition and emission probabilties and
        % loglikelihood for all possible number of hidden states
        Trans = cell(num_ob_states-1, 1); 
        Emis = cell(num_ob_states-1, 1); 
        Log_Liks = zeros(num_ob_states-1, 1);
        
        for j = 2:num_ob_states      
            tran = initialize_probs( trans_type, [j,j] );
            emis = initialize_probs( emis_type, [j,num_ob_states] );
            disp(emis);
            [transition, emission, log_likelihood] = hmmtrain( data, ...
                tran, emis, 'Maxiterations', 10000, 'Verbose', true );
            Log_Liks(j-1) = log_likelihood(end);
            Trans{j-1} = transition;
            Emis{j-1} = emission;
        end
        
        [~, bic] = aicbic(Log_Liks, num_para, num_data*ones(num_ob_states-1, 1));
        plot(2:num_ob_states, bic, 'LineWidth', 2);
    end
end

