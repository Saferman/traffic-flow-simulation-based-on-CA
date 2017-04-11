function plaza = new_cars(plaza, entry,ak,bm,Vmax,autoVmax)
%bm 3 dimension MAT  EAT  ETC
if entry > 0 
    % Find the empty lanes of the entrance where a new car can be add.
    unoccupied = find(plaza(1,:) == 0 );
    n = length(unoccupied); % number of available lanes
    x = randperm(n);  
    for i = 1:min(entry,n)
        if rand<ak
            if rand<=bm(3)
                plaza(1, unoccupied(x(i)) )=autoVmax;
            else
                plaza(1, unoccupied(x(i)) ) = 1.2;
            end
        else
            if rand<=bm(3)
                plaza(1, unoccupied(x(i)) )=Vmax;
            else
                plaza(1, unoccupied(x(i)) ) = 1.1;
            end
        end
    end
end