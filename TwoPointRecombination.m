%��������
%pop��Ⱥ
%pop_num��Ⱥ��С
%chrom_lenȾɫ�峤��
%Rate �������
function [pop] = TwoPointRecombination( pop,pop_num,chrom_len,Rate )

    for i=1:pop_num
        if(rand<Rate)
           select=randint(1,1,[1,pop_num]);
           
           t1=randint(1,1,[1,chrom_len]);
           t2=randint(1,1,[1,chrom_len]);
           
           if(t1>t2)
               t3=t2;
               t2=t1;
               t1=t3;
           end
           
           tempGene=pop(i,t1:t2);
           pop(i,t1:t2)=pop(select,t1:t2);
           pop(select,t1:t2)=tempGene;
        end   
    end
    
end

