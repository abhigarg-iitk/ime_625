function [w] = ExpectedNumVisits(q, dir)
    str = sprintf('Expected Number of visits to states before absorption')
    w = inv(eye(size(q,1))-q);
    printmat(w, 'Matrix for number of visita', num2str(dir([1:size(q,1)])), num2str(dir([1:size(q,1)])))
    str = sprintf('Expected Time for absorption')
    time = sum(w,2);
    printmat(time, 'Matrix for expected time', num2str(dir([1:size(q,1)])),'absorption')
end
    