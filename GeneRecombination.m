%基因重组
function [ pop ] = GeneRecombination(pop,pop_num,gene_num,gene_len,Rate )
  for i=1:pop_num
      if(rand<Rate)
           select=randint(1,1,[1,pop_num]);
           gene_no=randint(1,1,[1,gene_num]);
           
           t1=(gene_no-1)*gene_len+1;
           t2=t1+gene_len-1;
           
           tempGene=pop(i,t1:t2);
           pop(i,t1:t2)=pop(select,t1:t2);
           pop(select,t1:t2)=tempGene;
      end
  end
end

