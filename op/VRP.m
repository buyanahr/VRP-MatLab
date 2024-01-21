clc;close all;clear;
% 基于遗传算法解决基础VRP问题
Num_dot = 30;Num_truck = 5;cover = 80;Num_group = 60;Num_gen = 2000;% 设置固定的参数
capacity = [100,120,110,130,80];
need = [9,17,4,1,27,28,19,5,3,20,7,8,18,25,24,29,16,2,23,14,2,12,1,11,7,3,4,5,16,14];
dot = cover*rand(2,Num_dot)-cover/2;%生成随机的数据点，数据点限制在cover范围内
distance = zeros(Num_dot); %计算每个点之间的间距，我们的目标是最小化总路程
for ii = 1:Num_dot
    for jj = 1:Num_dot
        if jj~=ii
            distance(ii,jj) = sqrt(sum((dot(:,jj)-dot(:,ii)).^2));
        else
            distance(ii,jj) = sqrt(sum(dot(:,ii).^2));
        end
    end
end
figure
plot(dot(1,:),dot(2,:),'O');
hold on;
plot(0,0,'rx')
label_dot = {'D1,9','D2,17','D3,4','D4,1','D5,27','D6,28','D7,19','D8,5','D9,3'...
    'D10,20','D11,7','D12,8','D13,18','D14,25','D15,24','D16,19','D17,16','D18,2',...
    'D19,13','D20,24','D21,2','D22,12','D23,1','D24,11','D25,7','D26,3','D27,4'...,
    'D28,5','D29,16','D30,14'};
text(dot(1,:),dot(2,:),label_dot);
grid on;
title('二维展示')
%% 初始化
group = zeros(Num_group,Num_dot+Num_truck-1);
fitness = zeros(1,Num_group);
group_selected = zeros(ceil(Num_group/2),Num_truck+Num_dot-1);
for ii = 1:Num_group
    temp_person = randperm(Num_dot);
    person = add_num_random(temp_person,0,Num_truck-1);
    while ~vaild_vrp(person)
        person = add_num_random(temp_person,0,Num_truck-1);
    end
    group(ii,:) = person;
    fitness(ii) = fit_vrp(group(ii,:),distance);
end

%% 开始迭代
record_fit = zeros(1,Num_gen);
for gen_ii = 1:Num_gen
    disp(['正在进行第',num2str(gen_ii),'次进化']);
    group_fitness = [fitness;group.'];
    group_selected = select_vrp(group_fitness);
    % 变异
    group_variation = variation_vrp(group_selected);
    new_group = [group_selected;group_variation];
    group = new_group;
    for group_jj = 1:Num_group
        fitness(group_jj) = fit_vrp(group(group_jj,:),distance);
    end
    record_fit(gen_ii) = max(fitness);
end
figure
plot(record_fit);
xlabel('进化次数')
ylabel('群体最高的适应度')
title('适应度随种群更新的变化')
best_person = group(1,:);
plot_solution(best_person,dot);