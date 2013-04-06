%基因表达
%输入染色体 和数据   计算出染色体的值
%data 一维数组
function [res] = Express(chrom,chrom_len,gene_num,data)
    gene_len=chrom_len/gene_num;
    res=0;
    for i=1;gene_num
        res=res+GeneExpress(chrom(i),gene_len,data);   %连接函数直接使用 +
    end  
end

%基因表达
function [res]=GeneExpress(gene,gene_len,data)
    %填充数据
    for i=1:gene_len
        ParamCount=GetParamCount(gene(i));
        if(0==ParamCount) %如果是数据 则填充到数组中
            temp=gene(i);
            temp(1)=[];
            index=str2num(temp);
            Digital(i)=data(index);
        end
    end
    
    %基因计算
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

%计算运算的结果
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

%计算基因的有效长度
function [valid_len]=GetValidLen(gene)
    FunPos=1;  %函数位置
    i=1;         %当前字符位置
    valid_len=1;  %有效长度
    ParamCount=GetParamCount( gene(1) );  %处理第一个字符
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

%获取每个运算符的参数个数
function  [ParamCount] =GetParamCount(operator)
    have2operator='+-*/';
    if(~isempty( findstr(operator,have2operator) ))
       ParamCount=2;
    else
        ParamCount=0;
    end
    
end

