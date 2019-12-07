function [globalTime,totaldelay] = maximumdelay(globalTime,delay,u,l,totaldelay,maxdelay )
    
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
    totaldelay =totaldelay+delay;
    if maxdelay < delay || maxdelay==delay
        maxdelay=delay;
        fprintf('\nMaximum deley in Queue: %d',maxdelay);
    end
    
end

