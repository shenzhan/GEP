%��������
%pop��Ⱥ
%pop_num��Ⱥ��С
%chrom_lenȾɫ�峤��
%Rate �����������

function [pop] = OnePointRecombination(pop,pop_num,chrom_len,Rate)
  
   for i=1:pop_num
      if(rand<Rate) %��ÿ��������и��ʲ���
           %i��ʾ��ǰȾɫ���
          selectint=randint(1,1,[1,pop_num]);%����һ��Ⱦɫ����
         
          position=randint(1,1,[1,chrom_len]);%
          
          %����
          tempGene=pop(i,1:position);
          pop(i,1:position)=pop(selectint,1:position);
          pop(selectint,1:position)=tempGene;
           
      end
   end
end

