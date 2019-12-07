function [ globalTime,delayQueue,queue,peoples,totalMaxQueue,maxQueue,totalDelayQueue,maxdelay] = loading( globalTime,delayQueue,queue,peoples,totalMaxQueue,maxQueue,totalDelayQueue,maxdelayQueue,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime)
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
[globalTime,totalDelayQueue,maxdelay] = maximumdelay(globalTime,totalDelayQueue,maxdelayQueue,delayQueue,unloadingTime,loadingTime );

fprintf('\nGlobalTime: %d',globalTime);
fprintf('\nLoadingTime: %d',loadingTime);
fprintf('\nMaximum deley in Queue: %d',maxdelay);
fprintf('\nTotal Delay in Queue: %d',totalDelayQueue);

end

