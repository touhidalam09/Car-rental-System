function [ totalMaxQueue,maxQueue,avrMaxQueue ] = maximum(totalMaxQueue, maxQueue,queueValue,numberofJobsDone,avrMaxQueue)

    totalMaxQueue = totalMaxQueue+queueValue;
    avgMaxQueue = totalMaxQueue/numberofJobsDone;
    
    if avrMaxQueue < avgMaxQueue || avrMaxQueue == avgMaxQueue 
        avrMaxQueue = avgMaxQueue;
    end
    
    if queueValue > maxQueue || maxQueue == queueValue
        maxQueue=queueValue;   
    end
    
    fprintf('\nMaximum Number in Queue: %d',maxQueue);
    fprintf('\nAverage Maximum number in Queue: %f',avrMaxQueue);
    fprintf('\nTotal Maximum nuumber in Queue: %d',totalMaxQueue);
    
end

