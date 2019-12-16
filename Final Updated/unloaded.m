function [ unloadingTime,peoples,bus_capacity ] = unloaded( unloadingTime,peoples,bus_capacity,location )
global bus_size;
count =0;
if ~isempty(peoples)
    for i=1:bus_size
        unload = peoples(i);
        if unload==location
            count = count +1;
            peoples(i) = 0;
            unloadingRandomTime = randi([16,24]);
            unloadingTime = unloadingTime+unloadingRandomTime;
        end
    end   
end
fprintf('\nunloadingTime: %d',unloadingTime);
end



