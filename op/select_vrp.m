function select = select_vrp(all_solution_fitness)
% ִ��ѡ������ĺ�����ѡ����Ӧ����ߵ�ǰ50%����Ⱥ�еĸ���
all_solution_fitness = all_solution_fitness.';
all_solution_fitness = sortrows(all_solution_fitness,-1);
select = all_solution_fitness(1:ceil(size(all_solution_fitness,1)/2),2:end);