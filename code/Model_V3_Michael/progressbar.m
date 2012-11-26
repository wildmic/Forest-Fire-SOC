function[]=progressbar(k,n)


    clc
    fprintf('0','%')
    fprintf('[')
    p=floor(k/50);
    if p==0
        p=1;
    end
    for j=1:floor(n/p)
        fprintf('-')
    end
    
    fprintf('>%4.2f',(100*n/k))
    for j=1:(floor(k/p)-floor(n/p))
        
        fprintf(' ')
    end
    if (n/k)<0.1
        fprintf(' ')
    end
    fprintf(']100')
   
    

