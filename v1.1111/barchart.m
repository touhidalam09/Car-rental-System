function [ output_args ] = barchart( loop,storageQueue )
    bar(loop,storageQueue);
    xlabel('Loop');
    ylabel('One Iteration capacity in Terminal');
end

