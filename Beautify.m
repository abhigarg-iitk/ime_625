function [p q r dir] = Beautify(transition)
    n = size(transition,1);
    dir = 1:n;
    j=n;
    p= transition;
    i=1;
    absorbing = 0;
    while i <= j
        if p(i,i) == 1
            str = sprintf('%d is absorbing',dir(i))
            if i~=j
                p = p([1:i-1 j i+1:j-1 i j+1:n],:);
            else
                p = p([1:i-1 i i+1:n],:);
            end
            if i~=j
                p = p(:, [1:i-1 j i+1:j-1 i j+1:n]);
            else
                p = p(:, [1:i-1 i i+1:n],:);
            end
            s = dir(j);
            dir(j)=dir(i);
            dir(i)= s;
            j = j - 1;
            i = i - 1;
        end
        i =  i + 1;
    end
    str = sprintf('total number of absorbing states')
    absorbing = n-j
    q = p([1:j],[1:j])
    r = p([1:j],[j+1:end])
end