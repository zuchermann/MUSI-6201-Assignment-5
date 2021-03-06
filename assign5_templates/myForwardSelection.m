function [sel_feature_set, accuracy_seq, conf_mat] = myForwardSelection(data, labels, K, num_folds, req_plot) 

%% Implements your forward selection procedure
% 
% Input:
%   data:               num_features x num_data_points matrix, containing the data features
%   labels:             1 x num_data_points matrix, containing the data labels
%   K:                  int, parameter for the kNN classifier
%   num_folds:          int, parameter for the number of folds for cross validation
%   req_plot:           bool, plots the best accuracy v/s iteration number if TRUE, no plots if FALSE
% Output:
%   sel_feature_set:    1 x num_features vector, containing the indices of the selected features 
%   accuracy_seq:       1 x num_features vector, containing the accuracies at each feature selection step
%   conf_mat:           num_classes x num_classes matrix, confusion matrix for the final selected feature set           
% Hint:
%   Here, at iteration of the feature selection process, you need to  run a cross-validation with 
%   num_folds. Use the average accuracy to determine which feature to select. Ideally you should stop
%   the iteration process when the accuracy drops below a certain threshold compared to previous 
%   iteration. But to keep things simple, we ask you to perform iterations till you all exhaust all
%   available features here.           

%% Add your code here

size_data = size(data);
num_features = size_data(1);
selected_features = zeros(0,1);
remaining_features = linspace(1, num_features, num_features)';
best_acc = -1;
conf_mat = zeros(num_features, num_features);
current_feature_set = zeros(1, num_features);
sel_feature_set = zeros(1, num_features);
accuracy_seq = zeros(1, num_features);
itteration = 1;

while itteration <= num_features
    num_candidate_features = length(remaining_features);
    candidate_feature_index = 1;
    best_candidate_accuracy = -1;
    best_cand_conf_mat = zeros(num_features,num_features);
    best_candidate_feature = -1;
    best_candidate_index = -1;
    while(candidate_feature_index <= num_candidate_features)
        candidate_feature = remaining_features(candidate_feature_index);
        temp_feature_vec = vertcat(selected_features, candidate_feature);
        temp_data = data(temp_feature_vec,:);
        [current_cand_avg_acc, ~, current_cand_mat]...
            = myCrossValidation(temp_data, labels, K, num_folds);
        if(current_cand_avg_acc > best_candidate_accuracy)
            best_candidate_accuracy = current_cand_avg_acc;
            best_cand_conf_mat = current_cand_mat;
            best_candidate_feature = candidate_feature;
            best_candidate_index = candidate_feature_index;
        end
        candidate_feature_index = candidate_feature_index + 1;
    end
    accuracy_seq(1, itteration) = best_candidate_accuracy;
    current_feature_set(1, best_candidate_feature) = 1;
    if(best_candidate_accuracy > best_acc)
        best_acc = best_candidate_accuracy;
        conf_mat = best_cand_conf_mat;
        sel_feature_set = current_feature_set;
    end
    remaining_features(best_candidate_index) = [];
    selected_features = vertcat(selected_features, best_candidate_feature);
    itteration = itteration + 1;
end

if(req_plot)
    figure;
    plot(accuracy_seq);
    title('accuracy vs selection itteration');
    xlabel('selection itteration');
    ylabel('accuracy');

end