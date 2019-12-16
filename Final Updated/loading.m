function [ globalTime,delayQueue,queue,peoples,totalMaxQueue,maxQueue,totalDelayQueue,maxdelay,totalmaxonBus,maxonBus,avrMaxQueue,avrMaxDelayQueue] = loading( globalTime,delayQueue,queue,peoples,totalMaxQueue,maxQueue,totalDelayQueue,maxdelayQueue,totalmaxonBus,maxonBus,avrMaxQueue,avrMaxDelayQueue,probabilites,bus_capacity,loadingTime,unloadingTime,distance,location,exponential,numberofJobsDone)
global bus_size;
if isempty(queue)||queue(1)==0
    globalTime = globalTime + 300; %time always in second unit
    delayQueue = delayQueue + 300; %delay time 
%if queue3 is Not empty
else
    queueValue = queue(1);
    %find maximum value (a)
    [totalMaxQueue,maxQueue,avrMaxQueue ] = maximum(totalMaxQueue,maxQueue,queueValue,numberofJobsDone,avrMaxQueue);
   
    %rest of bus capacity
    cango = bus_size-bus_capacity;
    if queueValue<cango
        queue(1)=0;
    else
        queue(1)  = queueValue-cango;
    end
   
    %people get in the bus
    for i=1:bus_size    
        if location ~= 3
           load = peoples(i);
           
           if load == 0
               peoples(i)=3;
           end
         
        else
            index = randi(length(probabilites));
            chooseLocation = probabilites(index);
            peoples(i) = chooseLocation;
        end
        if bus_capacity < 20 
            bus_capacity = bus_capacity+1; 
            loadingRandomTime = randi([15,25]);
            loadingTime = loadingTime+loadingRandomTime;
        end
    end
end

%find maximum number of delay (b)
[globalTime,totalDelayQueue,maxdelay,avrMaxDelayQueue] = maximumdelay(globalTime,totalDelayQueue,maxdelayQueue,avrMaxDelayQueue,delayQueue,unloadingTime,loadingTime,distance,exponential,numberofJobsDone);

%find maximum number on the bus (c)
totalmaxonBus = totalmaxonBus+bus_capacity;
if bus_capacity > maxonBus
    maxonBus = bus_capacity;
end
fprintf('\nGlobalTime: %d',globalTime);
fprintf('\nLoadingTime: %d',loadingTime);
fprintf('\nMaximum Number on the Bus: %d',maxonBus);


end

