function [avg_accuracy, fold_accuracies, conf_mat] = myCrossValidation(data, labels, K, num_folds)

%% Implements your n-fold cross validation scheme
% 
% Input:
%   data:               num_features x num_data_points matrix, containing the data features
%   labels:             1 x num_data_points matrix, containing the data labels
%   K:                  int, parameter for the kNN classifier
%   num_folds:          int, parameter for the number of folds for cross validation
% Output:
%   avg_accuracy:       float, average accuracy for the all the folds 
%   fold_accuracies:    1 x num_folds vector, accuracies for the all the n-folds
%   conf_mat:           num_classes x num_classes matrix, cumulative confusion matrix across all n-folds
% Hint: 
%   Here you should first divide your data into n-folds. The ideal of doing that would be to
%   first randomly shuffle datapoints within each class and then divide the data but for this 
%   assignment, it is OK if you don't shuffle the data. You would need to call myKnn() n times
%   and compute the accuracy and confusion mat for each fold. Writing a small function which 
%   takes the predicted labels and actual labels as arguments and returns the accuracy and 
%   confusion mat might be useful. 

    
%% Add your code here


end