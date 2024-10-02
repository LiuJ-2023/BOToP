function [X] = Initialization(Parameters,Swarm_Set)
len_x = Swarm_Set.len_x;
up_x  = Swarm_Set.up_x;
dn_x  = Swarm_Set.dn_x;
idx_I = Swarm_Set.idx_I;
pop   = Parameters.pop;
func_num = Parameters.func_num;
alpha    = Parameters.alpha;

x = repmat(up_x-dn_x,pop,1).*rand(pop,len_x) + repmat(dn_x,pop,1);

for i = 1:pop
   [value_x(i),cons_x_vec(i,:)] = test_func(x(i,:),func_num);
   cons_x(i) = sum(cons_x_vec(i,:));
   int_x(i)  = max(abs(x(i,idx_I)-alpha*round(x(i,idx_I)/alpha)));
end
[best_val,best_idx] = min(value_x);
x_best = x(best_idx,:);

X.x = x;
X.value_x = value_x;
X.cons_x = cons_x;
X.int_x = int_x;
X.x_best = x_best;
X.best_val = best_val;
end