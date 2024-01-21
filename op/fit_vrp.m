function fitness = fit_vrp(solution,distance)
fitness = 0;
index = (solution == 0);
index = find(index);
if index(end)~=length(solution)
    
    index = [0,index,length(solution)+1];
else 
    index(end) = [];
    solution(end) = [];
    index = [0,index,length(solution)+1];
end
temp = [];
for ii = 2:length(index)
    temp = solution(index(ii-1)+1:index(ii)-1);
    if ~isempty(temp)
        temp = [temp(1),temp,temp(end)];
        for jj = 1:length(temp)-1
            fitness = fitness+distance(temp(jj),temp(jj+1));
        end
    end
end
fitness = 1/fitness;