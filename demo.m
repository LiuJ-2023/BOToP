Parameters.Phase1  = 3000;
Parameters.Phase2  = 3000;
Parameters.pop      = 30;
Parameters.alpha    = 1;

for rep = 1:12
    Parameters.func_num = rep;
    if rep == 8
        Parameters.alpha    = 20;
    elseif rep == 9
        Parameters.alpha    = 50;
    elseif rep == 10
        Parameters.alpha    = 100;
    else
        Parameters.alpha    = 1;
    end

    for i = 1:25
        out = BOToP(Parameters);
        val(i,rep) = out.best_val;
        best{rep}(i,:) = out.best_x;
        
        clc
        fprintf('当前测试函数: %d \n',rep);
        fprintf('第 %d 次独立重复试验 \n',i);
        fprintf('当前最优解: %E \n',out.best_val);
    end
end
    