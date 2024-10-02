function [X,V] = NDS(Parameters,X,V)
pop     = Parameters.pop;
x       = X.x;
value_x = X.value_x;
cons_x  = X.cons_x;
int_x   = X.int_x;
v       = V.v;
value_v = V.value_v;
cons_v  = V.cons_v;
int_v   = V.int_v;


S = [x;v];
val_S = [value_x,value_v];
cons_S = [cons_x,cons_v];
int_S = [int_x,int_v];
    
idx_fea = (cons_S == 0);
len_fea = sum(idx_fea);
    
if len_fea>=2
    S_fea = S(idx_fea,:);
    val_S_fea = val_S(idx_fea);
    int_S_fea = int_S(idx_fea);
    
    rank_S = zeros(1,2*pop);
    rank_S_fea = non_domination_sort_mod(S_fea,2,val_S_fea',int_S_fea');
    rank_S(idx_fea) = rank_S_fea;
    
    X.rank_x = rank_S(1:pop);
    V.rank_v = rank_S(pop+1:2*pop);
end
end
