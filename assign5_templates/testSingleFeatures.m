% this file tests each individual feature with 3 ford CV and a k of 3.
% Prints out the average accuracy of each feature.

data_temp = load('data/data.mat');
data = data_temp.data;
labels_temp = load('data/labels.mat');
labels = labels_temp.labels;
K = 3;
num_folds = 3;
size_data = size(data);
num_features = size_data(1);
num_points = size_data(2);
random_indexes = randperm(num_points);

% I know you said no need to randomize, but I think you do with this 
% data set, since it is ordered and balanced. This means that with 3 folds
% training sets will not contain any examples of one class. comment out
% the two lines below to see what I mean -> with randomization off, the
% accuracy is almost zero.
labels = labels(:,random_indexes);
data = data(:,random_indexes);


data_index = 1;
while data_index <= num_features
    single_feature = data(data_index, :);
    [avg_accuracy, fold_accuracies, conf_mat]...
        = myCrossValidation(single_feature, labels, K, num_folds);
    disp(avg_accuracy)
    data_index = data_index + 1;
end