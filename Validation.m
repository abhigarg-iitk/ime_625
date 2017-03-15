function [valid] = Validation(transition)
    valid = 1;
    if size(transition,1) ~= size(transition,2)
        str = sprintf('You dont have a square matrix \n terminating')
        valid = 0;
        return
    end
    
    for i = 1:size(transition,1)
        if sum(transition(i,:)) ~= 1
            str = sprintf('sum of row %d is not 1',i)
            valid = 0;
            return 
        end
    end
end