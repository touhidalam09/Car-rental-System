function [ totalMaxQueue,maxQueue ] = maximum(totalMaxQueue, maxQueue,queueValue)

    totalMaxQueue = totalMaxQueue+queueValue;
    if queueValue > maxQueue || maxQueue == queueValue
        maxQueue=queueValue;
        fprintf('\nMaximum Number in Queue: %d',maxQueue);
    end
    fprintf('\nTotal Maximum nuumber in Queue: %d',totalMaxQueue);
end

