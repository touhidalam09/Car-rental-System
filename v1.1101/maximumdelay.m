function [globalTime,totaldelay,maxdelay] = maximumdelay(globalTime,totaldelay,maxdelay,delay,u,l )
    
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
        
    end
    
end

