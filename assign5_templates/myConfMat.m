function [ current_conf_mat ] = myConfMat(current_prediction, current_testing_labels, num_classes)
% given a set of predictions and known labels, computes the confusion
% matrix.

size_test = size(current_testing_labels);
num_data_points = size_test(2);
current_conf_mat = zeros(num_classes, num_classes);
point_index = 1;
while point_index <= num_data_points
    pred = current_prediction(point_index);
    expected = current_testing_labels(point_index);
    current_conf_mat(expected, pred) = current_conf_mat(expected, pred) + 1;
    point_index = point_index + 1;
end

end

