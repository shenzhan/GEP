%Ⱦɫ����
%����Ⱦɫ�� ������   �����Ⱦɫ���ֵ
%data һά����
function [res] = ChromExpress(chrom,chrom_len,gene_num,data)
    gene_len=chrom_len/gene_num;
    res=0;
    for i=1:gene_num
        gene_start=(i-1)*gene_len+1;
        gene=chrom(gene_start:(gene_len+gene_start-1));
        res=res+GeneExpress(gene,gene_len,data);   %���Ӻ���ֱ��ʹ�� +
    end  
end
