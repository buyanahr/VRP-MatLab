function select = select_vrp(all_solution_fitness)
% 执行选择操作的函数，选出适应度最高的前50%的种群中的个体
all_solution_fitness = all_solution_fitness.';
all_solution_fitness = sortrows(all_solution_fitness,-1);
select = all_solution_fitness(1:ceil(size(all_solution_fitness,1)/2),2:end);