function [ new_Population ] = RISTransition(population,pop_Num,head_Lenght,gene_Num,f_set)

for q = 1:pop_Num

    if(q == 1)
      
       new_Population  = RISSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num,f_set);

    else
         new_ind = RISSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num,f_set);
         
        
        new_Population = [new_Population; new_ind];
    end;

end;


end


function [new_individual] = RISSingleTransition(individual,pop_Num,head_Lenght,gene_Num,f_set)


tail_Lenght = head_Lenght * (2-1) + 1;

gene_Lenght = head_Lenght + tail_Lenght;

temp = reshape(individual,gene_Lenght,gene_Num);

temp = temp';

startScran_Position = randint(1,gene_Num,[1,head_Lenght]);

choose_Lenght = randint(1,gene_Num,[1,4]);



for i = 1:gene_Num
    
    old_gene = temp(i,:);
    
    isChange = 0;
    
    for j = startScran_Position(i):head_Lenght
        
    st = find(ismember(f_set,old_gene(j)));
    
    if(~isempty(st))
        
     isChange = 1;
     
     choose_Lenght(i)
     
    en = j + choose_Lenght(i);
       
    insert_Sequence = old_gene(j:en);
    
    cut_gene = [insert_Sequence,old_gene(1:head_Lenght)];
        
    new_gene = [cut_gene(1:head_Lenght),old_gene((head_Lenght+1):gene_Lenght)];
    
    if(i == 1)
        
        new_individual = new_gene;
        
    else
        new_individual = [new_individual,new_gene];
    
    end;
    
    break;
        
    end;
        
    
    end;
    
    if(isChange ~= 1)
        
        if(i==1)
            
            new_individual = old_gene;
            
        else
            
            new_individual = [new_individual,old_gene];
        
        end;
               
    end;
    
    
    
    
end;


end