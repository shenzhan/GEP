function [ population,f,t ] = initPopulation(pop_num,head_Lenght,gene_Num, T_Num)

%%根据终点集T的个数生成符号xn,终点集对应样品的特征

for i = 1:T_Num
     t{i} = strcat('x',int2str(i));
 end;

%%符号集f，初始化
 
 f = {'+','-','*','/'};
 
 f_Lenght = 4;
 
 t_Lenght = T_Num;

 %%根据基因头部确定基因尾部，公式为 t = h(n-1) + 1;n为最大的符号的连接个数。例如+号为二目运算符，所以n = 2
 
 tail_Lenght = head_Lenght * (2-1) + 1
 
 tf = [f,t]; 
 
 tf_Lenght = f_Lenght + t_Lenght;

 %%根据种群数量，和染色体中的基因个数，初始化种群。头部的填充为符合集+函数集
 %%尾部填充为符号集
 
 for i = 1:pop_num
     
     for z = 1:gene_Num
         
        rand_Head = randint(1,head_Lenght,[1,tf_Lenght]);
 
        rand_Tail = randint(1,tail_Lenght,[1,t_Lenght]);

     
     for j = 1:head_Lenght
         
         temp_Head(j) = tf(rand_Head(j));
         
     end;
     
     for k = 1:tail_Lenght
        
         temp_Tail(k) = t(rand_Tail(k));
         
     end;
     
     if (z == 1)
         
         temp_genes = [temp_Head,temp_Tail];
     else
         
         temp_genes = [temp_genes,temp_Head,temp_Tail];
         
     end;
     
     end;
     
    if i == 1
        
        population = temp_genes;
    else
        
         population = [population; temp_genes];
        
    end;
     
    
     
 
     
     
 end;


end

