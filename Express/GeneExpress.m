%基因表达
function [res]=GeneExpress(gene,gene_len,data)
    %填充数据
    for i=1:gene_len
        ParamCount=GetParamCount(gene{i});
        if(0==ParamCount) %如果是数据 则填充到数组中
            temp=gene{i};
            temp(1)=[];
            index=str2num(temp);
            Digital(i)=data(index);
        end
    end
    
    %基因计算
    button=GetValidLen(gene);
    valid_len=button;
    caldata=0;
    for j=1:valid_len
       i=valid_len-j+1;
       ParamCount=GetParamCount(gene{i});
       if(ParamCount>0)
            caldata(1:ParamCount) = Digital((button-ParamCount+1):button);
            Digital(i)=GetCalculateValue(gene{i},caldata);
            button=button-ParamCount;
       end
    end
    res=Digital(1);
end

