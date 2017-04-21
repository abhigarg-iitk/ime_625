function [statdistr] = StationaryDistr(transition)
    %transition = [0.5 0.5; 0.4 0.6];
    transition = transition.';
    for i=1:size(transition,1)
        transition(i,i) = transition(i,i) - 1;
    end
    transition = [transition; ones(1,size(transition,1))];
    A = zeros(size(transition,1)-1,1);
    A = [A; 1];
    str = 'stationary distribution is:'
    linsolve(transition,A)
end