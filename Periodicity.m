function [periodicity] = Periodicity(transition)
    %transition_m = [
     %0     0     1/2   1/4   1/4   0     0;
     %0     0     1/3   0     2/3   0     0; 
     %0     0     0     0     0     1/3   2/3;
     %0     0     0     0     0     1/2   1/2;
     %0     0     0     0     0     3/4   1/4;
     %1/2   1/2   0     0     0     0     0;
     %1/4   3/4   0     0     0     0     0];
    str = sprintf('Periodicity Debug Statements')
    G = digraph(transition);
    plot(G);
    V = bfsearch(G, 1);
    T = bfsearch(G,1,'edgetonew');
    Dist = zeros(size(transition,1),1);
    Dist(1) = 0;
    for i=1:size(T,1)
        Dist(T(i,2)) = Dist(T(i,1)) + 1
    end
    Diff = setdiff(G.Edges.EndNodes, T, 'rows');
    Val = zeros(size(Diff,1),1);
        for i=1:size(Diff,1)
        Val(i) = abs(Dist(Diff(i,1)) - Dist(Diff(i,2))) + 1;
    end
    periodicity = Val(1);
    for j=2:size(Val,1)
        periodicity = gcd(periodicity, Val(j));
    end
    periodicity
end