clc;
rng(1);

bus_size=20;
bus_capacity = 0;
spendsTime3 = 0;
spendsTime1 = 0;
spendsTime2 = 0;
chooseLocation = 0;
globalTime = 0;

temp = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
probabilites = [1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2];
peoples = [];
queue1=[];
queue2=[];
queue3=[];

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


fprintf('\n :::::--:::::-- Queue3 --:::::--::::: \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 3     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
[unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity, bus_size,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 3     %%%%%%%%%%%%%%%%%%%%
queue3(1)=randi(50);
[globalTime,delayQueue,queue,peoples,totalMaxQueue3,maxQueue3,totalDelayQueue3] = loading(globalTime,delayQueue3,queue3,peoples,totalMaxQueue3,maxQueue3,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime,totalDelayQueue3,maxdelayQueue3);


fprintf('\n :::::--:::::-- Queue1 --:::::--::::: \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 1     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
[unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity, bus_size,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 1     %%%%%%%%%%%%%%%%%%%%
queue1(1)=randi(50);
[globalTime,delayQueue,queue,peoples,totalMaxQueue1,maxQueue1,totalDelayQueue1] = loading(globalTime,delayQueue1,queue1,peoples,totalMaxQueue1,maxQueue1,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime,totalDelayQueue1,maxdelayQueue1);


fprintf('\n :::::--:::::-- Queue2 --:::::--::::: \n');



%%%%%%%%%%%%%%%%%%%%%%%%%%    unloading location 2     %%%%%%%%%%%%%%%%%%%%
unloadingTime=0;
loadingTime=0;
[unloadingTime,peoples,bus_capacity] = unloaded(unloadingTime,peoples,bus_capacity, bus_size,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%    loading location 2     %%%%%%%%%%%%%%%%%%%%
queue2(1)=randi(50);
[globalTime,delayQueue,queue,peoples,totalMaxQueue2,maxQueue2,totalDelayQueue2] = loading(globalTime,delayQueue2,queue2,peoples,totalMaxQueue2,maxQueue2,probabilites,bus_size,bus_capacity,loadingTime,unloadingTime,totalDelayQueue2,maxdelayQueue2);



fprintf('\n\n');
disp(':-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-::-:');
fprintf('\n\n');