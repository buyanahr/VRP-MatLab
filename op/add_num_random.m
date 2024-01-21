function new_var = add_num_random(old_var,num,n)
% 本函数用来在向量中随机的添加n个确定的数num,n应该小于length(old_var).
new_var = [];
index = randperm(length(old_var),n);%用来产生n个随机的位置，我们将在这些位置处插入num
index = sort(index);
index = [1,index,length(old_var)+1];%改造index向量，方便后续的操作
for ii = 2:length(index)
    new_var = [new_var,old_var(index(ii-1):index(ii)-1),num];
end
new_var(end) = [];