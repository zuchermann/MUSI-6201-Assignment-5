function [c_labels, centroids] = myKMeansClustering(data, K)

%% Implements a k-means clustering algorithm
% 
% Input:
%   data:           num_features x num_data_points matrix, containing the data features
%   K:              int, parameter for the kNN classifier
% Output:
%   c_labels:       1 x num_data_points vector, containing the cluster label for each of your datapoints
%   centroids:      num_features x K matrix, where each column is one of your cluster centroids

%% Add your code here
size_data = size(data);
num_features = size_data(1);
num_points = size_data(2);

% Initialize centroids evenly across the range of all data points
max_vector = max(data, [], 2);
min_vector = min(data, [], 2);
diff_vector = max_vector - min_vector;
diff_del_vector = diff_vector / num_features;

spread = [0:1:K-1];
centroids = diff_del_vector * spread;
centroids = centroids + (diff_del_vector/2);

prevLabels= -1;
c_labels = zeros(num_points, 1);

clusters = zeros(num_features, num_points, K);
num_points_in_cluster = zeros(K, 1);

ctr = 1;

% Iterate until clusters converge
while ~isequal(prevLabels, c_labels)
    % disp(string('Number of iterations: ') + string(ctr));
    ctr = ctr + 1;
    prevLabels = c_labels;
    
    % Assign points to clusters based on distance to centroids
    point_index = 1;
    while point_index <= num_points
        point = data(:, point_index);
        cluster_index = 1;
        min_dist = Inf;
        assigned_cluster = -1;
        while cluster_index <= K
            dist = myDist(centroids(:, cluster_index), point);
            if dist < min_dist
               min_dist = dist;
               assigned_cluster = cluster_index;
               c_labels(point_index) = assigned_cluster;
            end
            cluster_index = cluster_index + 1;
        end
        point_index = point_index + 1;
    end
    
    % Make cluster matrices
    label_index = 1;
    while label_index <= num_points
        point = data(:, label_index);
        cluster = c_labels(label_index);
        num_points_in_cluster(cluster) = num_points_in_cluster(cluster) + 1;
        clusters(:, num_points_in_cluster(cluster), cluster) = point;
        label_index = label_index + 1;
    end
    
    % Recompute centroids
    centroid_index = 1;
    while centroid_index <= K
        newCentroid = myCentroid(clusters(:, :, centroid_index), num_points_in_cluster(centroid_index));
        centroids(:, centroid_index) = newCentroid;
        centroid_index = centroid_index + 1;
    end
    
    % Reset points in cluster and clusters
    num_points_in_cluster = zeros(K, 1);
    clusters = zeros(num_features, num_points, K);
end

end