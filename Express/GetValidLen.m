%����������Ч����
function [valid_len]=GetValidLen(gene)
    FunPos=1;  %����λ��
    i=1;         %��ǰ�ַ�λ��
    valid_len=1;  %��Ч����
    ParamCount=GetParamCount( gene{1} );  %�����һ���ַ�
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

