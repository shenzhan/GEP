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
