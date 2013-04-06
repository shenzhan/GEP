function [ new_Population ] = Mutation(population,pop_Num,head_Lenght,gene_Num,p_mutation,f_set,f_Lenght,t_set,t_Lenght)

%%%变异操作
%%1.对染色体中的每一个基因进行变异检测，若概率<变异概率则进行变异
%%2.变异规则：头部随机变异为符号集和函数集，尾部变异为符号集

for q = 1:pop_Num

    if(q == 1)
      
       new_Population  = singleMutation(population(q,:),pop_Num,head_Lenght,gene_Num,p_mutation,f_set,f_Lenght,t_set,t_Lenght);
    else
         new_ind = singleMutation(population(q,:),pop_Num,head_Lenght,gene_Num,p_mutation,f_set,f_Lenght,t_set,t_Lenght);
        
        new_Population = [new_Population; new_ind];
    end;

end;


end


function [new_individual] = singleMutation(individual,pop_Num,head_Lenght,gene_Num,p_mutation,f_set,f_Lenght,t_set,t_Lenght)
tail_Lenght = head_Lenght * (2-1) + 1;

gene_Lenght = head_Lenght + tail_Lenght;

tf = [f_set,t_set];

tf_Lenght = t_Lenght + f_Lenght;

temp = reshape(individual,gene_Lenght,gene_Num);

temp = temp';


for z = 1:gene_Num

    old_gene = temp(z,:);
    
    new_gene = old_gene;
    
    %%先随机生成所有需要的变异符号
    %%若选择变异，则直接从数组中获取

change_Head = randint(1,head_Lenght,[1,tf_Lenght]);

change_Tail = randint(1,tail_Lenght,[1,t_Lenght]);


for i = 1:gene_Lenght
    
    %%生成概率
    
    pm = rand();  
    
    if(pm<p_mutation)
    
    if(i<= head_Lenght)
        
        new_gene(i) = tf(change_Head(i));
        
        
    else
        
        new_gene(i) = t_set(change_Tail(i-head_Lenght));
                
    end;
    
    end;
        
    
end;

if(z == 1)
        
        new_individual = new_gene;
        
    else
        
         new_individual =[ new_individual ,new_gene];
    end;

end;

end