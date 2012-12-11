function[beta]=Expsearch(a,b)
%The goal of this function is to search the exponent beta for which
%a*b^beta best approximates.
for i=1:1000
    k=i/100;
    f=a.*(b.^k);
    M(i)=mean(f);
    for j=1:size(f)
        S(i)=S(i)+(M(i)-f(j))^2;
    end
end
[beta,alpha]=min(S);
plot((a.*(b.^(alpha/100))))
beta=alpha/100;
    
    


end