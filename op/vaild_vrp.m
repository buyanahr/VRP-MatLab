function vaild = vaild_vrp(solution)
% 判断个体是否合法的函数
capacity = [100,120,110,130,80];
need = [9,17,4,1,27,28,19,5,3,20,7,8,18,25,24,29,16,2,23,14,2,12,1,11,7,3,4,5,16,14];
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
allneed = zeros(1,length(capacity));
for ii = 2:length(index)
    temp = solution(index(ii-1)+1:index(ii)-1);
    if ~isempty(temp)
        for jj = 1:length(temp)
            allneed(ii-1) = allneed(ii-1)+need(temp(jj));
        end
    end
end
if (allneed<=capacity)
    vaild = 1;
else
    vaild = 0;
end