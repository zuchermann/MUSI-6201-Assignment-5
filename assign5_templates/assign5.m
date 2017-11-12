% this file tests each individual feature with 3 ford CV and a k of 3, and
% also evaluates forward selection with n/K = 3

data_temp = load('data/data.mat');
data = data_temp.data;
labels_temp = load('data/labels.mat');
labels = labels_temp.labels;
K = 3;
num_folds = 3;
size_data = size(data);
num_features = size_data(1);
num_points = size_data(2);
rng(2) % so randomization is deterministic
random_indexes = randperm(num_points);

% I know you said no need to randomize, but I think you do with this 
% data set, since it is ordered and balanced. This means that with 3 folds
% training sets will not contain any examples of the one class being
% tested. comment out the two lines below to see what I mean -> with
% randomization off, the accuracy is almost zero. Randomization is done
% deterministically (notice rng default command above).
labels = labels(:,random_indexes);
data = data(:,random_indexes);


features = ["1 Root Mean Square Mean, " ...
    "2 Zero Crossing Rate Mean, " ...
    "3 Specral Centroid Mean, " ...
    "4 Spectral Flux Mean, " ...
    "5 Spectral Crest Mean, " ...
    "6 Root Mean Square Std, " ...
    "7 Zero Crossing Rate Std, " ...
    "8 Specral Centroid Std, " ...
    "9 Spectral Flux Std, " ...
    "10 Spectral Crest Std, "];


disp("___________________________")
disp("PART B: SINGLE FEATURE EVALUATION")
data_index = 1;
while data_index <= num_features
    single_feature = data(data_index, :);
    [avg_accuracy, fold_accuracies, conf_mat]...
        = myCrossValidation(single_feature, labels, K, num_folds);
    disp(strcat(features(data_index), num2str(avg_accuracy)))
    data_index = data_index + 1;
end

disp(" ")
disp(" ")
disp("___________________________")
disp("PART C: FORWARD SELECTION")
[sel_feature_set, accuracy_seq, conf_mat] = ...
    myForwardSelection(data, labels, K, num_folds, true);
disp("Selected best feature set:");
feat_index = 1;
size_feat = size(sel_feature_set);
num_feats = size_feat(2);
selected_feats = zeros(0, 1);
while feat_index <= num_feats
    if(sel_feature_set(1, feat_index) == 1)
        selected_feats = vertcat(selected_feats, feat_index);
        disp(features(feat_index));
    end
    feat_index = feat_index + 1;
end

disp(" ")
disp(" ")
disp("___________________________")
disp("PART D: VARYING K")
data = data(selected_feats, :);
num_folds = 10;
% k = 1
[avg_accuracy1, fold_accuracies1, conf_mat1]...
        = myCrossValidation(data, labels, 1, num_folds);
% k = 3
[avg_accuracy3, fold_accuracies3, conf_mat3]...
        = myCrossValidation(data, labels, 3, num_folds);
% k = 7
[avg_accuracy7, fold_accuracies7, conf_mat7]...
        = myCrossValidation(data, labels, 7, num_folds);
    
disp("   ---------------   ")
disp("k = 1")
disp("accuracy = " + num2str(avg_accuracy1))
disp(conf_mat1)

disp("   ---------------   ")
disp("k = 3")
disp("accuracy = " + num2str(avg_accuracy3))
disp(conf_mat3)

disp("   ---------------   ")
disp("k = 7")
disp("accuracy = " + num2str(avg_accuracy7))
disp(conf_mat7)
