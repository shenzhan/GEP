function [ new_Population ] = ISTransition(population,pop_Num,head_Lenght,gene_Num)
%%IS Transition Ϊ�崮ת��
%%����ԭ��:
%%1.���ѡȡ����λ��
%%2.���ѡȡ���ȣ����м���Ϊs��
%%3.���ѡȡ������λ��(����Ϊ�ǵ�һ�����ͷ������)
%%4.����s,����3�е�λ�ã�˳�ӽ�ȡͷ������

for q = 1:pop_Num

    if(q == 1)
      
       new_Population  = ISSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num);

    else
        new_ind = ISSingleTransition(population(q,:),pop_Num,head_Lenght,gene_Num);
        
        new_Population = [new_Population; new_ind];
    end;

end;


end

%%%%%%%%%%�������Ϊchoose_Position = 4%%%%%%%%
function [new_individual] = ISSingleTransition(individual,pop_Num,head_Lenght,gene_Num)

%%Ⱦɫ����룬�ֿ��ɶ����Ļ��򣬲����һ������

tail_Lenght = head_Lenght * (2-1) + 1;

gene_Lenght = head_Lenght + tail_Lenght;

temp = reshape(individual,gene_Lenght,gene_Num);

temp = temp';

%%������ɲ���λ�ã����򳤶ȣ�����λ�á�
%%������������������飬�Ժ�ѡ����Ӧ�����ֱֵ�Ӵ������л�ȡ
choose_Lenght = randint(1,gene_Num,[1,4]);

choose_Position = randint(1,gene_Num,[1,gene_Lenght]);

insert_Position = randint(1,gene_Num,[2,head_Lenght]);

for i = 1:gene_Num
    
    %%ѡ�񱻸ı�Ļ���
    old_gene = temp(i,:)
          
    %%��֤����λ��+ѡȡ�ĳ���Ҫ<���򳤶�
    
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