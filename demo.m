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
        fprintf('��ǰ���Ժ���: %d \n',rep);
        fprintf('�� %d �ζ����ظ����� \n',i);
        fprintf('��ǰ���Ž�: %E \n',out.best_val);
    end
end
    