function [] = StepTransition(transition, a)
    if str2num(a) < 2
        return
    else
        str = sprintf('%d step transition matrix',str2num(a))
        transition^str2num(a)
    end
end