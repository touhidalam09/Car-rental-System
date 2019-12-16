clc;
rng(0);

global bus_size;
bus_size=20;
bus_capacity = 0;
spendsTime3 = 0;
spendsTime1 = 0;
spendsTime2 = 0;
chooseLocation = 0;
globalTime = 0;
numberofJobsDone = 0;
totalmaxonBus = 0;
maxonBus = 0;

temp = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
probabilites = [1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2];
peoples = [];
queue1=[];
queue2=[];
queue3=[];
storageQueue1=[];
storageQueue2=[];
storageQueue3=[];
storageQueuedelay = [];
loop =[];

avrMaxQueue1 = 0;
avrMaxQueue2 = 0;
avrMaxQueue3 = 0;
avrMaxDelayQueue1 = 0;
avrMaxDelayQueue2 = 0;
avrMaxDelayQueue3 = 0;

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

busStopQ1 = 0;
busStopQ2 = 0;
busStopQ3 = 0;
maxStopQ1 = 0;
maxStopQ2 = 0;
maxStopQ3 = 0;
minStopQ1 = 1;
minStopQ2 = 1;
minStopQ3 = 1;

maxloopDone = 0;
minloopDone = 1;
pvQvalue3 = 0;
pvQvalue2 = 0;
pvQvalue1 = 0;

global bus_speed;
bus_speed = 30;
%15 hours to seconds 54 000
while globalTime <= 7200
    
    numberofJobsDone=numberofJobsDone +1.00;
    if maxloopDone <= numberofJobsDone
        maxloopDone = numberofJobsDone;
    end
    if minloopDone >= numberofJobsDone
        minloopDone = numberofJobsDone;
    end
    
    
    fprintf('\n\n:-::::::-:::-:::- iteration %d :::-:::-::::::\n',numberofJobsDone);
    loop = [loop numberofJobsDone];
    fprintf('\n:::::--:::::-- Queue3 --:::::--::::: \n');

    
     %%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 3     %%%%%%%%%%%%%%%%%%%%
    busStopQ3 = busStopQ3 + 1;
    if maxStopQ3 < busStopQ3
        maxStopQ3 = busStopQ3;
    end
    if minStopQ3 > busStopQ3
        minStopQ3 = busStopQ3;
    end
    
    unloadingTime=0;
    loadingTime=0;
    [unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity,3);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 3     %%%%%%%%%%%%%%%%%%%%
    
    queue3(1)=randi(50)+pvQvalue3;
    storageQueue3=[storageQueue3 queue3]; %for bar chart
    
    distance = 4.5;
    exponential = 14;
    [globalTime,delayQueue,queue,peoples,totalMaxQueue3,maxQueue3,totalDelayQueue3,maxdelayQueue3,totalmaxonBus,maxonBus,avrMaxQueue3,avrMaxDelayQueue3] = loading(globalTime,delayQueue3,queue3,peoples,totalMaxQueue3,maxQueue3,totalDelayQueue3,maxdelayQueue3,totalmaxonBus,maxonBus,avrMaxQueue3,avrMaxDelayQueue3,probabilites,bus_capacity,loadingTime,unloadingTime,distance,3,exponential,numberofJobsDone);
    storageQueueMaxDelay = 0;
    storageQueueMaxDelay = maxdelayinoneloop( maxdelayQueue3,storageQueueMaxDelay);
    
    
    fprintf('\n\n :::::--:::::-- Queue1 --:::::--::::: \n');
    pvQvalue3 = queue(1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 1     %%%%%%%%%%%%%%%%%%%%
    busStopQ1 = busStopQ1 + 1;
    if maxStopQ1 < busStopQ1
        maxStopQ1 = busStopQ1;
    end
    if minStopQ1 > busStopQ1
        minStopQ1 = busStopQ1;
    end
    unloadingTime=0;
    loadingTime=0;
    [unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity,1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 1     %%%%%%%%%%%%%%%%%%%%
    queue1(1)=randi(50)+pvQvalue1;
    storageQueue1=[storageQueue1 queue1]; %for bar chart
    distance = 1;
    exponential = 10;
    [globalTime,delayQueue,queue,peoples,totalMaxQueue1,maxQueue1,totalDelayQueue1,maxdelayQueue1,totalmaxonBus,maxonBus,avrMaxQueue1,avrMaxDelayQueue1] = loading(globalTime,delayQueue1,queue1,peoples,totalMaxQueue1,maxQueue1,totalDelayQueue1,maxdelayQueue1,totalmaxonBus,maxonBus,avrMaxQueue1,avrMaxDelayQueue1,probabilites,bus_capacity,loadingTime,unloadingTime,distance,1,exponential,numberofJobsDone);
    storageQueueMaxDelay = maxdelayinoneloop( maxdelayQueue1,storageQueueMaxDelay);
    
    
    
    
    fprintf('\n\n :::::--:::::-- Queue2 --:::::--::::: \n');
    pvQvalue1 = queue(1);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 2     %%%%%%%%%%%%%%%%%%%%
    busStopQ2 = busStopQ2 + 1;
    if maxStopQ2 < busStopQ2
        maxStopQ2 = busStopQ2;
    end
    if minStopQ2 > busStopQ2
        minStopQ2 = busStopQ2;
    end
    unloadingTime=0;
    loadingTime=0;
    [unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity,2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 2     %%%%%%%%%%%%%%%%%%%%
    queue2(1)=randi(50)+pvQvalue2;
    storageQueue2=[storageQueue2 queue2];
    distance= 4.5;
    exponential = 24;
    [globalTime,delayQueue,queue,peoples,totalMaxQueue2,maxQueue2,totalDelayQueue2,maxdelayQueue2,totalmaxonBus,maxonBus,avrMaxQueue2,avrMaxDelayQueue2] = loading(globalTime,delayQueue2,queue2,peoples,totalMaxQueue2,maxQueue2,totalDelayQueue2,maxdelayQueue2,totalmaxonBus,maxonBus,avrMaxQueue2,avrMaxDelayQueue2,probabilites,bus_capacity,loadingTime,unloadingTime,distance,2,exponential,numberofJobsDone);
    storageQueueMaxDelay = maxdelayinoneloop( maxdelayQueue2,storageQueueMaxDelay);
 
    storageQueuedelay = [storageQueuedelay storageQueueMaxDelay];
    
    pvQvalue2 = queue(1);
    
   fprintf('\n\n'); 
   
   
end

%bar chart
figure(1);
barchart(loop,storageQueue1);
title('People in queue(1)');

figure(2);
barchart(loop,storageQueue2);
title('People in queue(2)');

figure(3);
barchart(loop,storageQueue3);
title('People in queue(3)');

figure(4);
bar(loop,storageQueuedelay);
title('Maximum Delay in One Iteration');
xlabel('Each Iterations');
ylabel('Maximum Delay');


%display in one circule complete
disp(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
fprintf('\nQ.a');
fprintf('\nMaximum number in Queue(1): %d',maxQueue1);
fprintf('\nMaximum number in Queue(2): %d',maxQueue2);
fprintf('\nMaximum number in Queue(3): %d',maxQueue3);

fprintf('\nAvg Maximum number in Queue(1): %.3f',avrMaxQueue1);
fprintf('\nAverage number in Queue(1): %.3f',totalMaxQueue1/numberofJobsDone);
fprintf('\nAvg Maximum number in Queue(2): %.3f',avrMaxQueue2);
fprintf('\nAverage number in Queue(2): %.3f',totalMaxQueue2/numberofJobsDone);
fprintf('\nAvg Maximum number in Queue(3): %.3f',avrMaxQueue3);
fprintf('\nAverage number in Queue(3): %.3f',totalMaxQueue3/numberofJobsDone);

fprintf('\nQ.b');

fprintf('\nMaximum delay in Queue(1): %f',maxdelayQueue1);
fprintf('\nMaximum delay in Queue(2): %f',maxdelayQueue2);
fprintf('\nMaximum delay in Queue(3): %f',maxdelayQueue3);

fprintf('\nAvg Maximum delay in Queue(1): %.3f',avrMaxDelayQueue1);
fprintf('\nAverage number in Queue(1): %.3f',totalDelayQueue1/numberofJobsDone);
fprintf('\nAvg Maximum delay in Queue(2): %.3f',avrMaxDelayQueue2);
fprintf('\nAverage number in Queue(2): %.3f',totalMaxQueue2/numberofJobsDone);
fprintf('\nAvg Maximum delay in Queue(3): %.3f',avrMaxDelayQueue3);
fprintf('\nAverage number in Queue(3): %.3f',totalDelayQueue3/numberofJobsDone);

fprintf('\nQ.c');
fprintf('\nMaximum Number on the Bus: %d',maxonBus);
fprintf('\nAvg Maximum Number on the Bus: %.3f',(totalmaxonBus/numberofJobsDone));

fprintf('\nQ.d');
fprintf('\nMaximum time the bus is stopped at Queue(1): %d',maxStopQ1);
fprintf('\nMaximum time the bus is stopped at Queue(2): %d',maxStopQ2);
fprintf('\nMaximum time the bus is stopped at Queue(3): %d',maxStopQ3);

fprintf('\nMinimum time the bus is stopped at Queue(1): %d',minStopQ1);
fprintf('\nMinimum time the bus is stopped at Queue(2): %d',minStopQ2);
fprintf('\nMinimum time the bus is stopped at Queue(3): %d',minStopQ3);

fprintf('\nAvg Maximum time the bus is stopped at Queue(1): %.3f',(busStopQ1/numberofJobsDone));
fprintf('\nAvg Maximum time the bus is stopped at Queue(2): %.3f',(busStopQ2/numberofJobsDone));
fprintf('\nAvg Maximum time the bus is stopped at Queue(3): %.3f',(busStopQ3/numberofJobsDone));

fprintf('\nQ.e');
fprintf('\nMaximum time for the bus to make a loop: %d',maxloopDone);
fprintf('\nMinimum fime for the bus to make a loop: %d',minloopDone);
fprintf('\nAverage time for the bus to make a loop: %.3f',(numberofJobsDone/numberofJobsDone));

fprintf('\nGlobal Time in one jobs: %d\n',globalTime);
