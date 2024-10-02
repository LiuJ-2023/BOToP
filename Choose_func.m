function out = Choose_func(func_num)
if func_num == 1
    len_x = 2;
    up_x = [1 1];
    dn_x = [-3 -3];
    
    len_I = 1;
    idx_I = [2];
elseif func_num == 2
    len_x = 3;
    up_x = [10 10 10];
    dn_x = [-10 -10 -10];
    
    len_I = 2;
    idx_I = [2 3];
elseif func_num == 3
    len_x = 2;
    up_x = [10 10];
    dn_x = [-2 -2];
    
    len_I = 1;
    idx_I = [2];
elseif func_num == 4
    len_x = 2;
    up_x = [100 100];
    dn_x = [-1 -1];
    
    len_I = 1;
    idx_I = [2];
elseif func_num == 5
    len_x = 2;
    up_x = [2.1 2.1];
    dn_x = [-1 -1];
    
    len_I = 1;
    idx_I = [2];
elseif func_num == 6
    len_x = 2;
    up_x = [100 100];
    dn_x = [-1 -1];
    
    len_I = 1;
    idx_I = [2];
elseif func_num == 7
    len_x = 5;
    up_x = [2.3 2.3 3.2 3.2 3.2];
    dn_x = [-2.3 -2.3 -3.2 -3.2 -3.2];
    
    len_I = 2;
    idx_I = [2 4];
elseif func_num == 8
    len_x = 8;
    up_x = [10000 10000 10000 1000 1000 1000 1000 1000];
    dn_x = [100 1000 1000 10 10 10 10 10];
    
    len_I = 3;
%     idx_I = [1 2 7];
    idx_I = [2 5 7];
elseif func_num == 9
    len_x = 8;
    up_x = [10000 10000 10000 1000 1000 1000 1000 1000];
    dn_x = [100 1000 1000 10 10 10 10 10];
    
    len_I = 3;
%     idx_I = [1 2 7];
    idx_I = [2 5 7];
elseif func_num == 10
    len_x = 8;
    up_x = [10000 10000 10000 1000 1000 1000 1000 1000];
    dn_x = [100 1000 1000 10 10 10 10 10];
    
    len_I = 3;
    idx_I = [2 5 7];
elseif func_num == 11
    len_x = 15;
    up_x = [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10];
    dn_x = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    
%     len_I = 5;
%     idx_I = [3 5 10 12 15];
    
    len_I = 3;
    idx_I = [3 5 12];
elseif func_num == 12
    len_x = 15;
    up_x = [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10];
    dn_x = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    
    len_I = 5;
    idx_I = [3 5 10 12 15];
elseif func_num == 13
    len_x = 6;
    up_x = [400 1000 420 420 1000 0.5236];
    dn_x = [0 0 340 340 -1000 0];
    
    len_I = 2;
    idx_I = [1 3];
    
%     len_I = 3;
%     idx_I = [3 5 12];
elseif func_num == 14
    len_x = 6;
    up_x = [400 1000 420 420 1000 0.5236];
    dn_x = [0 0 340 340 -1000 0];
    
    len_I = 2;
    idx_I = [1 3];
    
elseif func_num == 15
    len_x = 6;
    up_x = [400 1000 420 420 1000 0.5236];
    dn_x = [0 0 340 340 -1000 0];
    
    len_I = 2;
    idx_I = [1 3];
    
elseif func_num == 16
    len_x = 9;
    up_x = [10 10 10 10 10 10 10 10 20];
    dn_x = [-10 -10 -10 -10 -10 -10 -10 -10 0];
    
    len_I = 4;
    idx_I = [1 3 5 7];
elseif func_num == 17
    len_x = 7;
    up_x = [1000 40 40 300 6.7 6.4 6.25];
    dn_x = [0 0 0 100 6.3 5.9 4.5];
    
    len_I = 2;
    idx_I = [1 4];
elseif func_num == 18
    len_x = 5;
    up_x = [906.3855 288.88 134.75 287.0966 84.1988];
    dn_x = [704.4148 68.6 0 193 25];
    
    len_I = 3;
    idx_I = [1 2 3];
elseif func_num == 19
    len_x = 5;
    up_x = [906.3855 288.88 134.75 287.0966 84.1988];
    dn_x = [704.4148 68.6 0 193 25];
    
    len_I = 3;
    idx_I = [1 2 3];
elseif func_num == 20
    len_x = 5;
    up_x = [906.3855 288.88 134.75 287.0966 84.1988];
    dn_x = [704.4148 68.6 0 193 25];
    
    len_I = 3;
    idx_I = [1 2 3];
elseif func_num == 23
    len_x = 24;
    up_x = [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10];
    dn_x = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    
    len_I = 10;
    idx_I = [1 3 5 7 9 11 13 15 17 19];
%     len_I = 5;
%     idx_I = [2 3 4 5 10];
elseif func_num == 21
    len_x = 10;
    up_x = [10 10 10 10 10 10 10 10 10 10];
    dn_x = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10];
    
    len_I = 3;
    idx_I = [2 3 9];
%     len_I = 5;
%     idx_I = [2 3 4 5 10];
elseif func_num == 22
    len_x = 10;
    up_x = [10 10 10 10 10 10 10 10 10 10];
    dn_x = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10];
    
    len_I = 5;
    idx_I = [2 3 5 8 9];
elseif func_num == 30
    len_x = 10;
    up_x = [6 6 6 6 6 6 6 6 6 6];
    dn_x = [1 1 1 1 1 1 1 1 1 1];
    
    len_I = 10;
    idx_I = [1 2 3 4 5 6 7 8 9 10];
elseif func_num == 101
    len_x = 30;
    up_x = [10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10];
    dn_x = [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10];
    
    len_I = 10;
    idx_I = [1 2 3 4 5 6 7 8 9 10];
elseif func_num == 102
    len_x = 30;
    up_x = [5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5];
    dn_x = [-5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5 -5];
    
    len_I = 10;
    idx_I = [1 2 3 4 5 6 7 8 9 10];
elseif func_num == 100
    len_x = 2;
    up_x = [3 5];
    dn_x = [-3 -5];
    
    len_I = 1;
    idx_I = [2];
end
out.len_x = len_x;
out.up_x  = up_x;
out.dn_x  = dn_x;
out.len_I = len_I;
out.idx_I = idx_I;
end