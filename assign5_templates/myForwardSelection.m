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

end