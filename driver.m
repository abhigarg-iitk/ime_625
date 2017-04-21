transition = dlmread('matrix',' ');
transition
%Periodicity(transition);
%StationaryDistr(transition);
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
transition_m = merge(transition,group_num, group_cnt, communicating)
%%MC.

[p q r dir] = Beautify(transition_m);
w = ExpectedNumVisits(q,dir);
u = HittingProb(w,r,dir);