function [ current_acc ] = myAcc(current_prediction, current_testing_labels);

num_correct = sum(current_prediction == current_testing_labels);
size_testing = size(current_testing_labels);
total_labels = size_testing(2);
current_acc = num_correct/total_labels;

end

