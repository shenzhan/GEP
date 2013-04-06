%������
%����Ⱦɫ�� ������   �����Ⱦɫ���ֵ
%data һά����
function [res] = Express(chrom,chrom_len,gene_num,data)
    gene_len=chrom_len/gene_num;
    res=0;
    for i=1;gene_num
        res=res+GeneExpress(chrom(i),gene_len,data);   %���Ӻ���ֱ��ʹ�� +
    end  
end

%������
function [res]=GeneExpress(gene,gene_len,data)
    %�������
    for i=1:gene_len
        ParamCount=GetParamCount(gene(i));
        if(0==ParamCount) %��������� ����䵽������
            temp=gene(i);
            temp(1)=[];
            index=str2num(temp);
            Digital(i)=data(index);
        end
    end
    
    %�������
    button=GetValidLen(gene);
    valid_len=button;
    for i=valid_len:1
       ParamCount=GetParamCount(gene(i));
       if(ParamCount>0)
            caldata[1:ParamCount]=Digital[button-ParamCount+1,button];
            Digital(i)=GetCalculateValue(gene(i),caldata);
       end
    end
end

%��������Ľ��
function [value]=GetCalculateValue(operator,data)
     switch(operator)
         case '+'
             value=data(1)+data(2);
         case '-'
             value=data(1)-data(2);
         case '*'
             value=data(1)*data(2);
         case '/'
             value=data(1)/data(2); %%%%%%%%%%%%%%%%%%%%%%%%%%
     end
end

%����������Ч����
function [valid_len]=GetValidLen(gene)
    FunPos=1;  %����λ��
    i=1;         %��ǰ�ַ�λ��
    valid_len=1;  %��Ч����
    ParamCount=GetParamCount( gene(1) );  %�����һ���ַ�
    if(ParamCount>0)
      valid_len=valid_len+ParamCount;
        FunPos=1;
        i=i+1;
    end
    
    while  i<=valid_len
        ParamCount=GetParamCount( gene(i));
        if(ParamCount>0)
           valid_len=valid_len+ParamCount;
            FunPos=i;
        end
        i=i+1;
    end

end

%��ȡÿ��������Ĳ�������
function  [ParamCount] =GetParamCount(operator)
    have2operator='+-*/';
    if(~isempty( findstr(operator,have2operator) ))
       ParamCount=2;
    else
        ParamCount=0;
    end
    
end

