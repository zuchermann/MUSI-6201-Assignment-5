function [current_training_set, current_training_labels,...
    current_testing_set, current_testing_labels]...
    = myPartitionData(data, labels, num_folds, fold_index)
%partitions dataset according to folds

size_data = size(data);
num_features = size_data(1);
num_points = size_data(2);

current_training_set = zeros(num_features,0);
current_training_labels = zeros(1, 0);

partition_size = floor(num_points/num_folds);

test_starting_index = ((fold_index - 1) * partition_size) + 1;
if(fold_index == num_folds) % last fold
    test_ending_index = num_points;
else % not last fold
    test_ending_index = test_starting_index + partition_size - 1;
    current_training_set = horzcat(current_training_set,...
        data(:,test_ending_index+1:num_points));
    current_training_labels = horzcat(current_training_labels,...
        labels(1,test_ending_index+1:num_points));
end

if(fold_index ~= 1) % not first fold
    current_training_set = horzcat(data(:,1:test_starting_index-1),...
        current_training_set);
    current_training_labels = horzcat(labels(1,1:test_starting_index-1),...
        current_training_labels);
end

current_testing_set = data(:,test_starting_index:test_ending_index);
current_testing_labels = labels(1, test_starting_index:test_ending_index);
end

