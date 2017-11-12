function [ current_conf_mat ] = myConfMat(current_prediction, current_testing_labels)

all_labels = horzcat(current_prediction, current_testing_labels);
size_test = size(current_testing_labels);
num_data_points = size_test(2);
num_all_classes = max(all_labels);
current_conf_mat = zeros(num_all_classes, num_all_classes);
point_index = 1;
while point_index <= num_data_points
    pred = current_prediction(point_index);
    expected = current_testing_labels(point_index);
    current_conf_mat(expected, pred) = current_conf_mat(expected, pred) + 1;
    point_index = point_index + 1;
end

end

