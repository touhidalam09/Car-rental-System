function [ output_args ] = barchart( loop,storageQueue )
    bar(loop,storageQueue);
    xlabel('Each Iterations');
    ylabel('Total peoples in Terminal/Bus Station');
end

