%染色体表达
%输入染色体 和数据   计算出染色体的值
%data 一维数组
function [res] = ChromExpress(chrom,chrom_len,gene_num,data)
    gene_len=chrom_len/gene_num;
    res=0;
    for i=1:gene_num
        gene_start=(i-1)*gene_len+1;
        gene=chrom(gene_start:(gene_len+gene_start-1));
        res=res+GeneExpress(gene,gene_len,data);   %连接函数直接使用 +
    end  
end
