function [ class ] = myPickClass(nearest_classes, train_counts)
% finds most occuring class(es) in nearest_classes. If tie, then 
% finds which classes occur more often in training examples. Hopefully,
% there isn't a tie in the train_counts, if so reverts to just picking 
% smallest class number among tied. This tie breaking mechanism assumes
% that (and only works if) the training set represents the distribution of
% real world data.

nearest_count = myCounter( nearest_classes' );
max_count = max(nearest_count);
size_count = size(nearest_count);
num_classes = size_count(1);
maxes = zeros(0, 1);
nearest_index = 1;
while nearest_index <= num_classes
    current_count = nearest_count(nearest_index);
    if(current_count == max_count)
        maxes = vertcat(maxes, nearest_index);
    end
    nearest_index = nearest_index + 1;
end
num_maxes = length(maxes);
if(num_maxes == 1)
    class = maxes(1);
else
    max_index = 1;
    most_common_train_class = -1;
    most_common_train_count = -1;
    while max_index <= num_maxes
        current_class = maxes(max_index);
        current_count = train_counts(current_class);
        if(current_count > most_common_train_count)
            most_common_train_class = current_class;
            most_common_train_count = current_count;
        end
        max_index = max_index + 1;
    end
    class = most_common_train_class;
end

end

