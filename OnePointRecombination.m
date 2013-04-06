%单点重组
%pop种群
%pop_num种群大小
%chrom_len染色体长度
%Rate 单点重组概率

function [pop] = OnePointRecombination(pop,pop_num,chrom_len,Rate)
  
   for i=1:pop_num
      if(rand<Rate) %对每个个体进行概率测试
           %i表示当前染色体号
          selectint=randint(1,1,[1,pop_num]);%另外一个染色体编号
         
          position=randint(1,1,[1,chrom_len]);%
          
          %重组
          tempGene=pop(i,1:position);
          pop(i,1:position)=pop(selectint,1:position);
          pop(selectint,1:position)=tempGene;
           
      end
   end
end

