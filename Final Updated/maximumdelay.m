function [globalTime,totaldelay,maxdelay,avrMaxDelayQueue] = maximumdelay(globalTime,totaldelay,maxdelay,avrMaxDelayQueue,delay,u,l,distance,exponential,numberofJobsDone )
    global bus_speed;
    delayBetween = 0;
    st = u+l;
    fprintf('\nTotal SpendingTime: %d',st);
    if st < 300
        w =300-st;
        delay = w+delay;
        globalTime = globalTime+w;
    else
        globalTime = globalTime + st;
    end
    %find maximum number of delay (b)
    arrivalTimes = distance/bus_speed; % per hours
    arrivalTimes = arrivalTimes*3600; %unit in second, distance betwwen location 3 to location 1 to location 2 to location 3
    interArrivalTimes = exprnd(exponential); %per hours
    interArrivalTimes = (1/interArrivalTimes)*3600; %unit in seconds
    
    if arrivalTimes < interArrivalTimes
       delayBetween =  interArrivalTimes-arrivalTimes;
       delay = delay + delayBetween;
    end
    
    
    totaldelay =totaldelay+delay;
    avgMaxDelay = totaldelay/numberofJobsDone;
    
    if avrMaxDelayQueue < avgMaxDelay || avrMaxDelayQueue==avgMaxDelay
        avrMaxDelayQueue = avgMaxDelay;
    end
    
    if maxdelay < delay || maxdelay==delay
        maxdelay=delay;
        
    end
    
    
    fprintf('\nMinimum Arrival time: %f seconds',arrivalTimes);
    fprintf('\nInter-Arrival time: %f seconds',interArrivalTimes);
    fprintf('\nDelay Between to location time: %f seconds',delayBetween);
    fprintf('\nMax delay here : %f seconds',maxdelay);
    fprintf('\nAverage Max delay here : %f seconds',avrMaxDelayQueue);
    fprintf('\nTotal max delay here: %f seconds',totaldelay);
end

