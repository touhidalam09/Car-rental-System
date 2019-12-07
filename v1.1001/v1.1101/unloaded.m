function [ unloadingTime,peoples,bus_capacity ] = unloaded( unloadingTime,peoples,bus_capacity, bus_size,location )
if ~isempty(peoples)
    for i=1:bus_size
        unload = peoples(i);
        if unload==location
            peoples(i) = 0;
            unloadingRandomTime = randi([16,24]);
            unloadingTime = unloadingTime+unloadingRandomTime;
            bus_capacity = bus_capacity-1;
        end
    end   
end

fprintf('\nunloadingTime: %d',unloadingTime);
end



