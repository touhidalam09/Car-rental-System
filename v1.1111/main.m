clc;
rng(1);

bus_size=20;
bus_capacity = 0;
spendsTime3 = 0;
spendsTime1 = 0;
spendsTime2 = 0;
chooseLocation = 0;
globalTime = 0;
numberofJobsDone = 0;

temp = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
probabilites = [1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2];
peoples = [];
queue1=[];
queue2=[];
queue3=[];
storageQueue1=[];
storageQueue2=[];
storageQueue3=[];
loop =[];

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

while globalTime <= 3600
    
numberofJobsDone=numberofJobsDone +1;
loop = [loop numberofJobsDone];
fprintf('\n :::::--:::::-- Queue3 --:::::--::::: \n');
%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 3     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
[unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity, bus_size,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 3     %%%%%%%%%%%%%%%%%%%%
queue3(1)=randi(50);
storageQueue3=[storageQueue3 queue3];
[globalTime,delayQueue,queue,peoples,totalMaxQueue3,maxQueue3,totalDelayQueue3,maxdelay3] = loading(globalTime,delayQueue3,queue3,peoples,totalMaxQueue3,maxQueue3,totalDelayQueue3,maxdelayQueue3,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime);


fprintf('\n :::::--:::::-- Queue1 --:::::--::::: \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 1     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
[unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity, bus_size,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 1     %%%%%%%%%%%%%%%%%%%%
queue1(1)=randi(50);
storageQueue1=[storageQueue1 queue1];
[globalTime,delayQueue,queue,peoples,totalMaxQueue1,maxQueue1,totalDelayQueue1,maxdelay1] = loading(globalTime,delayQueue1,queue1,peoples,totalMaxQueue1,maxQueue1,totalDelayQueue1,maxdelayQueue1,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime);


fprintf('\n :::::--:::::-- Queue2 --:::::--::::: \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 2     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
[unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity, bus_size,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 2     %%%%%%%%%%%%%%%%%%%%
queue2(1)=randi(50);
storageQueue2=[storageQueue2 queue2];
[globalTime,delayQueue,queue,peoples,totalMaxQueue2,maxQueue2,totalDelayQueue2,maxdelay2] = loading(globalTime,delayQueue2,queue2,peoples,totalMaxQueue2,maxQueue2,totalDelayQueue2,maxdelayQueue2,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime);


fprintf('\n\n');
fprintf('\n\n');
disp(':-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:::-:');
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

%display in one circule complete
disp(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
fprintf('\nQ.a');
fprintf('\nMaximum number in Queue(1): %d',maxQueue1);
fprintf('\nMaximum number in Queue(2): %d',maxQueue2);
fprintf('\nMaximum number in Queue(3): %d',maxQueue3);

fprintf('\nAvg Maximum number in Queue(1): %d',floor(totalMaxQueue1/numberofJobsDone));
fprintf('\nAvg Maximum number in Queue(2): %d',floor(totalMaxQueue2/numberofJobsDone));
fprintf('\nAvg Maximum number in Queue(3): %d',floor(totalMaxQueue3/numberofJobsDone));

fprintf('\nQ.b');

fprintf('\nMaximum delay in Queue(1): %d',maxdelay1);
fprintf('\nMaximum delay in Queue(2): %d',maxdelay2);
fprintf('\nMaximum delay in Queue(3): %d',maxdelay3);

fprintf('\nAvg Maximum delay in Queue(1): %d',floor(totalDelayQueue2/numberofJobsDone));
fprintf('\nAvg Maximum delay in Queue(2): %d',floor(totalDelayQueue2/numberofJobsDone));
fprintf('\nAvg Maximum delay in Queue(3): %d',floor(totalDelayQueue2/numberofJobsDone));

fprintf('\nQ.b');


fprintf('\nGlobal Time in one jobs: %d\n',globalTime);
