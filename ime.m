transition = dlmread('matrix',' ');
transition
if Validation(transition) == 0
    return
end
printmat(transition, 'Your Transtion Matrix', num2str(1:size(transition,1)), num2str(1:size(transition,1)))
fp = fopen('test','r');
format = '%s';
a = fscanf(fp, format);
a=a';
StepTransition(transition, a(1));
%%Works needs to be done here .From here onwards I have assumed absorbing
[group_num group_cnt communicating] = Scc(transition)
%%MC.
[p q r dir] = Beautify(transition);
w = ExpectedNumVisits(q,dir);
u = HittingProb(w,r,dir);