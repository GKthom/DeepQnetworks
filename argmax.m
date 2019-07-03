%finds the argmax of a vector
function [max_arg]=argmax(vector)
max_arg=find(vector==max(vector));
if length(max_arg)>1
    max_arg=max_arg(randi(length(max_arg)));
end