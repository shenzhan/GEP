%��������
%data �������� m*n��ά����
%M ѡ��Χ
function [ pop_fitness ] = Evaluate(pop,pop_num,chrom_len,gene_num,data,m,n,M )
    
   for i=1:pop_num
         fitness=0;
         for j=1:m
             Cij=ChromExpress(pop(i,:),chrom_len,gene_num,data(j,:));
             fitness=fitness+ ( M-abs(Cij-data(j,n)))
         end
        if(1==i)
            pop_fitness=fitness;
        else 
            pop_fitness=[pop_fitness fitness];
        end
    end
end

