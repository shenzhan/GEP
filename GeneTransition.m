function [ new_Population ] = GeneTransition(population,pop_Num,head_Lenght,gene_Num)

for q = 1:pop_Num

    if(q == 1)
      
       new_Population  = GeneSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num);

    else
         new_ind = GeneSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num);
         
        
        new_Population = [new_Population; new_ind];
    end;

end;


end


function [new_individual] = GeneSingleTransition(individual,pop_Num,head_Lenght,gene_Num)

tail_Lenght = head_Lenght * (2-1) + 1;

gene_Lenght = head_Lenght + tail_Lenght;

change_gene1 = randint(1,gene_Num,[1,gene_Num]);

change1 = change_gene1(1);

change2 = change_gene1(2);

new_individual = individual;

if(change1>change2)

    temp = change1;
    
    change1 = change2;
    
    change2 = temp;
    
end;
    
    begin_Position1 = (change1-1)*15+1;
    
    end_Position1 = begin_Position1 + 14;
    
    temp1 = new_individual(begin_Position1:end_Position1);
    
    
    begin_Position2 = (change2-1)*15+1;
    
    end_Position2 = begin_Position2 + 14;
    
    temp2 = new_individual(begin_Position2:end_Position2);
    

    for i = 1:gene_Lenght
        
        new_individual(begin_Position1+i-1) = temp2(i);
                
        new_individual(begin_Position2+i-1) = temp1(i);
       
        
    end;




end