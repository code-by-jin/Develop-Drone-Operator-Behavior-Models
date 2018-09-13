function probs = initialize_probs(type, dim)
% Function to initialize probabilities.
%
% inputs:
% - type = type to initialize, including "random" and "unifrom"
% - dim = dimension of the initialized probabilities.
%
% output:
% - probs = array of probabilities in the dimension of dim
% 
% written by: Jin Zhou, Duke University

    switch type
    case 'uniform' 
        probs = 1/dim(2) * ones(dim(1), dim(2));
    case 'random'
        probs = zeros(dim(1), dim(2));
        for i = 1:dim(1)
            probs_temp = rand(1, dim(2));
            probs(i, :) = probs_temp / sum(probs_temp);
        end
    otherwise
        warning('Unexpected generated type')
    end
end



