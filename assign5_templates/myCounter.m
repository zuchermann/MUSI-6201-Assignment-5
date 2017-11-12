function [ counts ] = myCounter( things_to_count )
%takes in 1 X train_labels vector and counts accurences of each class and
%saves in num_of_classes X 1 vector in index correcponding to class

%function assumes all class labels are positive natural numbers excluding 0

max_class = max(things_to_count);
size_input = size(things_to_count);
num_labels = size_input(2);
counts = zeros(max_class, 1);
input_index = 1;
while input_index <= num_labels
    current_class = things_to_count(1, input_index);
    counts(current_class) = counts(current_class) + 1;
    input_index = input_index + 1;
end

end

