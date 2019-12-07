function [ globalTime,delayQueue,queue,peoples,totalMaxQueue,maxQueue,totalDelayQueue] = loading( globalTime,delayQueue,queue,peoples,totalMaxQueue,maxQueue,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime,totalDelayQueue,maxdelayQueue)
if isempty(queue)||queue(1)==0
    globalTime = globalTime + 300; %time always in second unit
    delayQueue = delayQueue + 300; %delay time 
%if queue3 is Not empty
else
    queueValue = queue(1);
    %find maximum value (a)
    
    [totalMaxQueue,maxQueue ] = maximum(totalMaxQueue,maxQueue,queueValue);
   
    %find rest of bus capacity
    cango = bus_size-bus_capacity;
    if queueValue<cango
        queue(1)=0;
    else
        queue(1)  = queueValue-cango;
    end
    %people get in the bus
    for i=1:cango    
        index = randi(length(probabilites));
        chooseLocation = probabilites(index);
        peoples = [peoples chooseLocation];
        if bus_capacity < 20 
            bus_capacity = bus_capacity+1; 
            loadingRandomTime = randi([15,25]);
            loadingTime = loadingTime+loadingRandomTime;
        end
    end
end
%find maximum number of delay (b)
[globalTime,totalDelayQueue] = maximumdelay(globalTime,totalDelayQueue,unloadingTime,loadingTime,delayQueue,maxdelayQueue );

fprintf('\nGlobalTime: %d',globalTime);
fprintf('\nLoadingTime: %d',loadingTime);
fprintf('\nTotal Delay in Queue: %d',totalDelayQueue);

end

