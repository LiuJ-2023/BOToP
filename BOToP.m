%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A Biobjective Perspective for Mixed-Integer Programming
% Author: J. Liu, Yong. W, B. Xin, and L. Wang
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = BOToP(Parameters)
func_num = Parameters.func_num;
Swarm_Set = Choose_func(func_num);
[X] = Initialization(Parameters,Swarm_Set);

X   = First_Phase(Parameters,Swarm_Set,X);
out = Second_Phase(Parameters,Swarm_Set,X);
end

function X = First_Phase(Parameters,Swarm_Set,X)
for gen = 1:Parameters.Phase1
    [V] = DE(Parameters,Swarm_Set,X);
    [X,V] = NDS(Parameters,X,V);
    [X] = Selection(Parameters,X,V);
    [X.best_val(gen),best_idx] = min(X.value_x);
    X.x_best = X.x(best_idx,:);
end
end

function out = Second_Phase(Parameters,Swarm_Set,X)
%% Parameters
len_x = Swarm_Set.len_x;
up_x  = Swarm_Set.up_x;
dn_x  = Swarm_Set.dn_x;
idx_I = Swarm_Set.idx_I;
len_I = Swarm_Set.len_I;

pop      = Parameters.pop;
func_num = Parameters.func_num;
% gen_num  = Parameters.gen_num;
pop      = Parameters.pop;
alpha    = Parameters.alpha;

x       = X.x;

F = [0.6,0.8,1.0];
CR = [0.1,0.2,1.0];

for i = 1:pop
   %% Truncation
    xE(i,:)     = x(i,:);
    xE(i,idx_I) = alpha*round(x(i,idx_I)/alpha); 
    [value_x(i),cons_x_vec(i,:)] = test_func(xE(i,:),func_num);

%     x(i,idx_I) = alpha*round(x(i,idx_I)/alpha); 
%     [value_x(i),cons_x_vec(i,:)] = test_func(x(i,:),func_num);
    cons_x(i) = sum(cons_x_vec(i,:));
    int_x(i)  = max(abs(x(i,idx_I)-round(x(i,idx_I))));
end
[best_val,best_idx] = min(value_x);
x_best = x(best_idx,:);


for gen = 1:Parameters.Phase2
    for i = 1:pop
     r_F = F(ceil(3*rand));
     r_CR = CR(ceil(3*rand));
    %% Mutation
    if rand<0.5
        rand_sel = randperm(pop,3);
        u(i,:) = x(i,:) + rand*(x(rand_sel(1),:) - x(i,:)) + r_F*(x(rand_sel(2),:) - x(rand_sel(3),:));
     
        v(i,:) = u(i,:);
    else
        rand_sel = randperm(pop,3);
        u(i,:) = x(rand_sel(1),:) + rand*(x_best - x(rand_sel(1),:)) + r_F*(x(rand_sel(2),:) - x(rand_sel(3),:));
     
    %% Crossover
        rand_cr = rand([1,len_x]);
        v(i,:) = (rand_cr>=r_CR).*x(i,:) + (rand_cr<r_CR).*u(i,:);
        
        jrand = ceil(len_x*rand);
        v(i,jrand) = u(i,jrand);
    end               

     v(i,:) = (v(i,:)>=up_x).*max(dn_x,2*up_x-v(i,:)) + (v(i,:)<up_x).*v(i,:);
     v(i,:) = (v(i,:)<=dn_x).*min(up_x,2*dn_x-v(i,:)) + (v(i,:)>dn_x).*v(i,:);
     
     %% Truncation
     rand_trun = rand(1,len_I);
     v(i,idx_I) = alpha*round(v(i,idx_I)/alpha);
               
    %% Selection
     [value_v,cons_v_vec] = test_func(v(i,:),func_num);
     cons_v = sum(cons_v_vec);
     
         if (cons_v>0)&&(cons_x(i)>0)
             if cons_v<=cons_x(i)
                 x(i,:) = v(i,:);
                 value_x(i) = value_v;
                 cons_x(i) = cons_v;
             end
         elseif (cons_v<=0)&&(cons_x(i)>0)
                 x(i,:) = v(i,:);
                 value_x(i) = value_v;
                 cons_x(i) = cons_v;
         elseif (cons_v<=0)&&(cons_x(i)<=0)
             if (value_v<=value_x(i))
                 x(i,:) = v(i,:);
                 value_x(i) = value_v;
                 cons_x(i) = cons_v;
             end
         end
    end
    [~,idx_x_best] = min(value_x);
    x_best = x(idx_x_best,:);
% plot(x(:,1),x(:,2),'rx')
end
idx_pop_fea = (cons_x==0);
if sum(idx_pop_fea) == 0
    best_val = NaN;
    x_best = NaN*zeros(1,Swarm_Set.len_x);
    cons_best = min(cons_x);
else
    [best_val,best_idx] = min(value_x(idx_pop_fea));
    x_best = x(best_idx,:);
    cons_best = cons_x(best_idx);
end

out.best_val = best_val;
out.best_x   = x_best;
out.x        = x;
out.cons_best   = cons_best;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V] = DE(Parameters,Swarm_Set,X)
len_x = Swarm_Set.len_x;
up_x  = Swarm_Set.up_x;
dn_x  = Swarm_Set.dn_x;
idx_I = Swarm_Set.idx_I;
pop   = Parameters.pop;
func_num = Parameters.func_num;
alpha    = Parameters.alpha;

x       = X.x;
x_best  = X.x_best;

F = [0.6,0.8,1.0];
CR = [0.1,0.2,1.0];

 for i = 1:pop
     r_F = F(ceil(3*rand));
     r_CR = CR(ceil(3*rand));
    % Mutation
    if rand<0.5
        rand_sel = randperm(pop,3);
        u(i,:) = x(i,:) + rand*(x(rand_sel(1),:) - x(i,:)) + r_F*(x(rand_sel(2),:) - x(rand_sel(3),:));
        v(i,:) = u(i,:);
    else
        rand_sel = randperm(pop,3);
        u(i,:) = x(rand_sel(1),:) + rand*(x_best - x(rand_sel(1),:)) + r_F*(x(rand_sel(2),:) - x(rand_sel(3),:));
     
    % Crossover
        rand_cr = rand([1,len_x]);
        v(i,:) = (rand_cr>=r_CR).*x(i,:) + (rand_cr<r_CR).*u(i,:);
        
        jrand = ceil(len_x*rand);
        v(i,jrand) = u(i,jrand);
    end
        
     v(i,:) = (v(i,:)>=up_x).*max(dn_x,2*up_x-v(i,:)) + (v(i,:)<up_x).*v(i,:);
     v(i,:) = (v(i,:)<=dn_x).*min(up_x,2*dn_x-v(i,:)) + (v(i,:)>dn_x).*v(i,:);
     
    %% Evaluate
%      vE(i,:) = v(i,:);
%      vE(i,idx_I) = alpha*round(v(i,idx_I)/alpha);  
%      [value_v(i),cons_v_vec(i,:)] = test_func(vE(i,:),func_num);
     
     [value_v(i),cons_v_vec(i,:)] = test_func(v(i,:),func_num);
     cons_v(i) = sum(cons_v_vec(i,:));
%      int_v(i)  = sum(abs(v(i,idx_I)- round(v(i,idx_I))));
     int_v(i)  = max(abs(v(i,idx_I)- alpha*round(v(i,idx_I)/alpha)));
 end

V.v = v;
V.value_v = value_v;
V.cons_v = cons_v;
V.int_v = int_v;
end

function [X] = Selection(Parameters,X,V)
pop     = Parameters.pop;
x       = X.x;
value_x = X.value_x;
cons_x  = X.cons_x;
int_x   = X.int_x;

v       = V.v;
value_v = V.value_v;
cons_v  = V.cons_v;
int_v   = V.int_v;

for i = 1:pop
     if (cons_v(i)>0)&&(cons_x(i)>0)
         if cons_v(i)<=cons_x(i)
             x(i,:) = v(i,:);
             value_x(i) = value_v(i);
             cons_x(i) = cons_v(i);
             int_x(i) = int_v(i);
         end
     elseif (cons_v(i)<=0)&&(cons_x(i)>0)
             x(i,:) = v(i,:);
             value_x(i) = value_v(i);
             cons_x(i) = cons_v(i);
             int_x(i) = int_v(i);
     elseif (cons_v(i)<=0)&&(cons_x(i)<=0)
         rank_flag = max([V.rank_v,X.rank_x]);
         if (V.rank_v(i) < X.rank_x(i))
             x(i,:) = v(i,:);
             value_x(i) = value_v(i);
             cons_x(i) = cons_v(i);
             int_x(i) = int_v(i);
         elseif (V.rank_v(i) == X.rank_x(i))
             if (V.rank_v(i) == 1)&&(X.rank_x(i) == 1)
                 if int_v(i)<=int_x(i)
                     x(i,:) = v(i,:);
                     value_x(i) = value_v(i);
                     cons_x(i) = cons_v(i);
                     int_x(i) = int_v(i);
                 end   
             else 
                 if value_v(i)<=value_x(i)
                     x(i,:) = v(i,:);
                     value_x(i) = value_v(i);
                     cons_x(i) = cons_v(i);
                     int_x(i) = int_v(i);
                 end
             end
         end      
     end        
end
X.x = x;
X.value_x = value_x;
X.cons_x = cons_x;
X.int_x = int_x;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

