function [ dist ] = myDist( vec_1, vec_2 )
%calculate euclidean distance between two vectors
dist = sqrt(sum((vec_1 - vec_2).^2));

end

