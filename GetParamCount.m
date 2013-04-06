%获取每个运算符的参数个数
function  [ParamCount] =GetParamCount(operator)
    have2operator='+-*/';
    if(~isempty( findstr(operator,have2operator) ))
       ParamCount=2;
    else
        ParamCount=0;
    end
    
end
