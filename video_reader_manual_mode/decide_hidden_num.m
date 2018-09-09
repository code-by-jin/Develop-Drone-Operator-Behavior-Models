clear;clc;
dir_to_search = './supervisory_data'; 

n_obs = 15;

all_seq = read_data(dir_to_search);

% for i = 1:length(all_seq)
%     temp_list = cell2mat(all_seq(i));
%     temp_list(temp_list==8) = 1;
%     temp_list(temp_list==9) = 2;
%     temp_list(temp_list==10) = 3;
%     temp_list(temp_list==11) = 4;
%     temp_list(temp_list==12) = 5;
%     temp_list(temp_list==13) = 6;
%     temp_list(temp_list==14) = 7;
%     temp_list(temp_list==15) = 8;
%     all_seq{i} = temp_list;
% end

num_all_seq = sum(cellfun('prodofsize', all_seq));

numPara = zeros(14, 1);
N = 2:15;
for i = N
    numPara(i-1) = i*i + i*15;
end
numObs = num_all_seq*ones(14, 1);

[~, ~, Log_Liks_1] = HMM_training_all_num_states (all_seq, n_obs, 1, 0);
[~, bic_1] = aicbic(Log_Liks_1, numPara, numObs);%u_t + r_e
figure;
plot(N, bic_1, 'LineWidth', 2);hold on;

[~, ~, Log_Liks_2] = HMM_training_all_num_states (all_seq, n_obs, 1, 0);
[~, bic_2] = aicbic(Log_Liks_2, numPara, numObs);%u_t + r_e
plot(N, bic_2, 'LineWidth', 2);hold on;

[~, ~, Log_Liks_3] = HMM_training_all_num_states (all_seq, n_obs, 0, 0);
[~, bic_3] = aicbic(Log_Liks_3, numPara, numObs);%u_t + r_e
plot(N, bic_3, '-.', 'LineWidth', 2);hold on;

[~, ~, Log_Liks_4] = HMM_training_all_num_states (all_seq, n_obs, 0, 0);
[~, bic_4] = aicbic(Log_Liks_4, numPara, numObs);%u_t + r_e
plot(N, bic_4, '-.', 'LineWidth', 2);hold on;
xticks(2:1:15);

grid on;
legend({'UT+RE','UT+RE', 'RT+RE', 'RT+RE'}, 'Location','northwest');
lgd.NumColumns = 2;
xlabel('Number of Hidden States');
ylabel('BIC');