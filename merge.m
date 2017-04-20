function [transition_m] = merge(transition,group_num, group_cnt, communicating)
i=1;    
marker = 0
transition_m = ones(group_num(1,size(transition,1)),group_num(1,size(transition,1)));
a=1;
n = size(transition,1);
node_to_grp = ones(size(transition,1));
for x = 1:n
    node_to_grp(group_num(2,x)) = group_num(1,x);
end
m = group_num(1,n);
while( a <= size(transition,2))
    arr = [group_num(2,a)]
    while a+1<=size(transition,2) && group_num(1,a)==group_num(1,a+1) && sum(find(group_num(1,a)==communicating))~=0
        a=a+1;
        arr = [arr group_num(2,a)];
    end
    a=a+1;
    w = sum(transition(arr,:),1);
    q = zeros(1,m);
    for x = 1:n
        q(node_to_grp(x))=w(x) + q(node_to_grp(x));
    end
    transition_m(group_num(1,a-1),:)= q;
    w = sum(transition(:,arr),2);
    q = zeros(1,m);
    for x = 1:n
        q(node_to_grp(x))=w(x) + q(node_to_grp(x));
    end
    transition_m(:,group_num(1,a-1))= q';
    if transition_m(group_num(1,a-1),group_num(1,a-1)) > 1
        transition_m(group_num(1,a-1),group_num(1,a-1)) = 1;
    end
    if size(arr,2) > 1
        %%here function by anuj will come as
        %%anuj(transition([i:marker],[i:marker]))
        str = 'anuj'
    end
end
end