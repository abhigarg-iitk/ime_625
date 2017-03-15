transition = dlmread('matrix',' ');
if Validation(transition) == 0
    return
end
printmat(transition, 'Your Transtion Matrix', num2str(1:size(transition,1)), num2str(1:size(transition,1)))
