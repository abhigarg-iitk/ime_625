function [u] = HittingProb(w, r, dir)
    str = sprintf('Absorption/Hitting Probablity')
    u = w*r;
    printmat(u, 'Hitting Probablity', num2str(dir([1:size(w,1)])), num2str(dir([size(w,1)+1:end])))
end