function [ population,f,t ] = initPopulation(pop_num,head_Lenght,gene_Num, T_Num)

%%�����յ㼯T�ĸ������ɷ���xn,�յ㼯��Ӧ��Ʒ������

for i = 1:T_Num
     t{i} = strcat('x',int2str(i));
 end;

%%���ż�f����ʼ��
 
 f = {'+','-','*','/'};
 
 f_Lenght = 4;
 
 t_Lenght = T_Num;

 %%���ݻ���ͷ��ȷ������β������ʽΪ t = h(n-1) + 1;nΪ���ķ��ŵ����Ӹ���������+��Ϊ��Ŀ�����������n = 2
 
 tail_Lenght = head_Lenght * (2-1) + 1
 
 tf = [f,t]; 
 
 tf_Lenght = f_Lenght + t_Lenght;

 %%������Ⱥ��������Ⱦɫ���еĻ����������ʼ����Ⱥ��ͷ�������Ϊ���ϼ�+������
 %%β�����Ϊ���ż�
 
 for i = 1:pop_num
     
     for z = 1:gene_Num
         
        rand_Head = randint(1,head_Lenght,[1,tf_Lenght]);
 
        rand_Tail = randint(1,tail_Lenght,[1,t_Lenght]);

     
     for j = 1:head_Lenght
         
         temp_Head(j) = tf(rand_Head(j));
         
     end;
     
     for k = 1:tail_Lenght
        
         temp_Tail(k) = t(rand_Tail(k));
         
     end;
     
     if (z == 1)
         
         temp_genes = [temp_Head,temp_Tail];
     else
         
         temp_genes = [temp_genes,temp_Head,temp_Tail];
         
     end;
     
     end;
     
    if i == 1
        
        population = temp_genes;
    else
        
         population = [population; temp_genes];
        
    end;
     
    
     
 
     
     
 end;


end

