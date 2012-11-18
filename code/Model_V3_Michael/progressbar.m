function[]=progressbar(k,n)


    clc
    fprintf('0','%')
    fprintf('[')
    for j=1:floor(n/2)
        fprintf('-')
    end
    
    fprintf('>%d',(100*n/k))
    for j=1:(floor(k/2)-floor(n/2))
        
        fprintf(' ')
    end
    if (n/k)<10
        fprintf(' ')
    end
    fprintf(']100')
   
    

