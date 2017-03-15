transition = dlmread('matrix',' ');
if Validation(transition) == 0
    return
end
printmat(transition, 'Your Transtion Matrix', num2str(1:size(transition,1)), num2str(1:size(transition,1)))
fp = fopen('test','r');
format = '%s';
a = fscanf(fp, format);
a=a';
StepTransition(transition, a(1));

