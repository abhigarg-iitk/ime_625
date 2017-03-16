function [group_num group_cnt] = Scc(transition)
    transitionR = transition';
    n = size(transition,1);
    stk = zeros(1,n+1);
    stk(1) = 1;
    visited = zeros(1,n);
    group_cnt=0;
    group_num = zeros(1,n);
    function [] = fill_forward(x)
        visited(x) = 1;
        for i = 1 :n
            if transition(x,i)~=0 && visited(i) == 0
                fill_forward(i)
            end
        end
        stk(1) = stk(1) + 1;
        stk(stk(1)) = x;
    end

    function [] = fill_backward(x)
        visited(x) = 0;
        group_num(x) = group_cnt;
        for i = 1 : n
            if transitionR(x,i)~=0 && visited(i) == 1
                fill_backward(i)
            end
        end
    end
    
    for i = 1:n
        if visited(i) == 0
            fill_forward(i)
        end
    end
    stk
    
    for i = stk(1) : -1 : 2
        if visited(stk(i)) == 1
            group_cnt = group_cnt + 1;
            fill_backward(stk(i))
        end
    end
    group_num = [group_num ; 1:n];
    [m k] = sort(group_num(1,:));
    group_num = group_num(:,k);
    
end