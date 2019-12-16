function [ storageQueueMaxDelay ] = maxdelayinoneloop( maxdelayQueue,storageQueueMaxDelay )
    if maxdelayQueue > storageQueueMaxDelay
       storageQueueMaxDelay = maxdelayQueue;
    end
    
end

