function new_var = add_num_random(old_var,num,n)
% ��������������������������n��ȷ������num,nӦ��С��length(old_var).
new_var = [];
index = randperm(length(old_var),n);%��������n�������λ�ã����ǽ�����Щλ�ô�����num
index = sort(index);
index = [1,index,length(old_var)+1];%����index��������������Ĳ���
for ii = 2:length(index)
    new_var = [new_var,old_var(index(ii-1):index(ii)-1),num];
end
new_var(end) = [];