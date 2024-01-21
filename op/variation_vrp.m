function variation = variation_vrp(selected)
% 执行变异操作的函数，变异操作随机交换两个位置
m = size(selected,1);
variation = zeros(size(selected,1),size(selected,2));
for ii = 1:m
    temp = selected(ii,:);
    index_1 = ceil(length(temp)*rand);
    index_2 = ceil(length(temp)*rand);
    tempa = temp(index_2);
    temp(index_2) = temp(index_1);
    temp(index_1) = tempa;
    [member,~] = ismember(temp,selected,'rows');
    while (member || ~vaild_vrp(temp))
        index_1 = ceil(length(temp)*rand);
        index_2 = ceil(length(temp)*rand);
        tempa = temp(index_2);
        temp(index_2) = temp(index_1);
        temp(index_1) = tempa;
        [member,~] = ismember(temp,selected,'rows');
    end
    variation(ii,:) = temp;
end