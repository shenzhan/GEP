function [ new_Population ] = ISTransition(population,pop_Num,head_Lenght,gene_Num)
%%IS Transition 为插串转座
%%基本原理:
%%1.随机选取插入位置
%%2.随机选取长度（序列假设为s）
%%3.随机选取被插入位置(必须为非第一编码的头部区域)
%%4.复制s,插入3中的位置，顺延截取头部基因

for q = 1:pop_Num

    if(q == 1)
      
       new_Population  = ISSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num);

    else
        new_ind = ISSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num);
        
        new_Population = [new_Population; new_ind];
    end;

end;


end

%%%%%%%%%%随机长度为choose_Position = 4%%%%%%%%
function [new_individual] = ISSingleTransition(individual,pop_Num,head_Lenght,gene_Num)

%%染色体解码，分开成独立的基因，并变成一个矩阵

tail_Lenght = head_Lenght * (2-1) + 1;

gene_Lenght = head_Lenght + tail_Lenght;

temp = reshape(individual,gene_Lenght,gene_Num);

temp = temp';

%%随机生成插入位置，基因长度，被插位置。
%%这里首先生成随机数组，以后选择相应的随机值直接从数组中获取
choose_Lenght = randint(1,gene_Num,[1,4]);

choose_Position = randint(1,gene_Num,[1,gene_Lenght]);

insert_Position = randint(1,gene_Num,[2,head_Lenght]);

for i = 1:gene_Num
    
    %%选择被改变的基因。
    old_gene = temp(i,:)
          
    %%保证插入位置+选取的长度要<基因长度
    
    if(choose_Position(i) + choose_Lenght(i) > gene_Lenght)
        
        choose_Position(i) = gene_Lenght - choose_Lenght(i);        
        
    end;
  
    st = choose_Position(i);
        
    en = choose_Position(i) + choose_Lenght(i);   
                         
    new_gene1 = old_gene(1:insert_Position(i));
    
    insert_Sequence = old_gene(st:en);
    
    new_gene2 = old_gene(insert_Position(i)+1:head_Lenght);
    
    cut_gene = [new_gene1,insert_Sequence,new_gene2];
        
    new_gene = [cut_gene(1:head_Lenght),old_gene((head_Lenght+1):gene_Lenght)];  
    
    if(i == 1)               
        
        new_individual = new_gene;
        
    else
        new_individual = [new_individual,new_gene];
    
    end;
    
    
    
  
        
    
end;



end