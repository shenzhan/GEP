%计算基因的有效长度
function [valid_len]=GetValidLen(gene)
    FunPos=1;  %函数位置
    i=1;         %当前字符位置
    valid_len=1;  %有效长度
    ParamCount=GetParamCount( gene{1} );  %处理第一个字符
    if(ParamCount>0)
      valid_len=valid_len+ParamCount;
        FunPos=1;
        i=i+1;
    end
    
    while  i<=valid_len
        ParamCount=GetParamCount( gene{i});
        if(ParamCount>0)
           valid_len=valid_len+ParamCount;
            FunPos=i;
        end
        i=i+1;
    end

end

