%��ȡÿ��������Ĳ�������
function  [ParamCount] =GetParamCount(operator)
    have2operator='+-*/';
    if(~isempty( findstr(operator,have2operator) ))
       ParamCount=2;
    else
        ParamCount=0;
    end
    
end
