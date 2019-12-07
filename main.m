clc;
rng(1);

bus_size=20;
bus_capacity = 0;
spendsTime3 = 0;
spendsTime1 = 0;
spendsTime2 = 0;
probabilites = [1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2];
peoples = [];

chooseLocation = 0;
unloadingTime=0;
loadingTime=0;
globalTime = 0;

maxQueue3=0;
totalMaxQueue3=0;
delayQueue3=0;
maxdelayQueue3=0;
totalDelayQueue3=0;

maxQueue1=0;
totalMaxQueue1=0;
totalDelayQueue1=0;
delayQueue1=0;
maxdelayQueue1=0;

maxQueue2=0;
totalMaxQueue2=0;
totalDelayQueue2=0;
delayQueue2=0;
maxdelayQueue2=0;

temp = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
queue1=[];
queue2=[];
queue3=[];





%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 3     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;

if ~isempty(peoples)
    for i=1:bus_size
        unload = peoples(i);
        if unload==3
            peoples(i) = 0;
            unloadingRandomTime = randi([16,24]);
            unloadingTime = unloadingTime+unloadingRandomTime;
            bus_capacity = bus_capacity-1;
        end
    end   
end


%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 3     %%%%%%%%%%%%%%%%%%%%
queue3(1)=randi(50);
if isempty(queue3)||queue3(1)==0
    globalTime = globalTime + 300; %time always in second unit
    delayQueue3 = delayQueue3 + 300; %delay time 
%if queue3 is Not empty
else
    queueValue = queue3(1);
    %find maximum value (a)
    totalMaxQueue3 = totalMaxQueue3+queueValue;
    if queueValue > maxQueue3
        maxQueue3=queueValue;
        %fprintf('Max: %d',maxQueue3);
    end
    %find rest of bus capacity
    cango = bus_size-bus_capacity;
    if queueValue<cango
        queue3(1)=0;
    else
        queue3(1)  = queueValue-cango;
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
spendsTime3 = unloadingTime+loadingTime;
if spendsTime3 < 300
    waitingTime =300-spendsTime3;
    delayQueue3 = waitingTime+delayQueue3;
    globalTime = globalTime+waitingTime;
else
    globalTime = globalTime + spendsTime3;
end
%find maximum number of delay (b)
totalDelayQueue3 =totalDelayQueue3 +delayQueue3;
if maxdelayQueue3<delayQueue3
   maxdelayQueue3=delayQueue3;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 1     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
for i=1:bus_size
    unload = peoples(i);
    if unload==1
        peoples(i) = 0;
        unloadingRandomTime = randi([16,24]);
        unloadingTime = unloadingTime+unloadingRandomTime;
        bus_capacity = bus_capacity-1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 1     %%%%%%%%%%%%%%%%%%%%

queue1(1)=randi(50);
if isempty(queue1)||queue1(1)==0
    globalTime = globalTime + 300; %time always in second unit
    delayQueue1 = delayQueue1 + 300; %delay time 
%if queue3 is Not empty
else
    queueValue = queue1(1);
    %find maximum value (a)
    totalMaxQueue1 = totalMaxQueue1+queueValue;
    if queueValue > maxQueue1
        maxQueue1=queueValue;
        %fprintf('Max: %d',maxQueue1);
    end
    %find rest of bus capacity
    cango = bus_size-bus_capacity;
    if queueValue<cango
        queue1(1)=0;
    else
        queue1(1)  = queueValue-cango;
    end
    %people get in the bus
    for i=1:bus_size  
        chooseLocation = 3;
        load = peoples(i);
        if load==0
            peoples(i) = chooseLocation;
        end
        if bus_capacity < 20
            bus_capacity = bus_capacity+1; 
            loadingRandomTime = randi([15,25]);
            loadingTime = loadingTime+loadingRandomTime;
        end
    end
end

spendsTime1 = unloadingTime+loadingTime;
if spendsTime1 < 300
    waitingTime =300-spendsTime1;
    delayQueue1 = waitingTime+delayQueue1;
    globalTime =globalTime+waitingTime;
else
    globalTime = globalTime + spendsTime1;
end
%find maximum number of delay (b)
totalDelayQueue1 =totalDelayQueue1 +delayQueue1;
if maxdelayQueue1<delayQueue1
   maxdelayQueue1=delayQueue1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 2     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
for i=1:bus_size
    unload = peoples(i);
    if unload==2
        peoples(i) = 0;
        unloadingRandomTime = randi([16,24]);
        unloadingTime = unloadingTime+unloadingRandomTime;
        bus_capacity = bus_capacity-1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 2     %%%%%%%%%%%%%%%%%%%%

queue2(1)=randi(50);
if isempty(queue2)||queue2(1)==0
    globalTime = globalTime + 300; %time always in second unit
    delayQueue2 = delayQueue2 + 300; %delay time 
%if queue3 is Not empty
else
    queueValue = queue2(1);
    %find maximum value (a)
    totalMaxQueue2 = totalMaxQueue2+queueValue;
    if queueValue > maxQueue2
        maxQueue2=queueValue;
        %fprintf('Max: %d',maxQueue2);
    end
    %find rest of bus capacity
    cango = bus_size-bus_capacity;
    if queueValue<cango
        queue2(1)=0;
    else
        queue2(1)  = queueValue-cango;
    end
    
    %people get in the bus
    for i=1:bus_size  
        chooseLocation = 3;
        load = peoples(i);
        if load==0
            peoples(i) = chooseLocation;
        end
        if bus_capacity < 20
            bus_capacity = bus_capacity+1; 
            loadingRandomTime = randi([15,25]);
            loadingTime = loadingTime+loadingRandomTime;
        end
    end
end

spendsTime1 = unloadingTime+loadingTime;
if spendsTime1 < 300
    waitingTime =300-spendsTime1;
    delayQueue1 = waitingTime+delayQueue1;
    globalTime =globalTime+waitingTime;
else
    globalTime = globalTime + spendsTime1;
end
%find maximum number of delay (b)
totalDelayQueue1 =totalDelayQueue1 +delayQueue1;
if maxdelayQueue1<delayQueue1
   maxdelayQueue1=delayQueue1;
end

