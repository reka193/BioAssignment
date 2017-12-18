function [gen, imp] = get_genimp(S,Id)

%Saving the size of the matrix

[np, nt] = size(S);

%Initialization of the vector containing the genuine scores

gen=[];

%Addig the values from the upper triangular matrix where the ID-s are the
%same but leaving out the comparison of the sample with itself

k=1;
for i = 1:np
    j=i;
    while j<=nt
        if i ~= j && Id(i)==Id(j)
            while j<=nt && Id(i)==Id(j)
                gen(k)=S(i,j);
                k=k+1;
                j=j+1;
            end
            j=nt+1;
        else 
            j=j+1;
        end
    end
end

%Initialization of the vector containing the imposter scores

imp=[];

%Addig the values from the upper triangular matrix where the ID-s are not
%same and leaving out the comparison of the sample with itself

l=1;
for i = 1:np
    j=i;
    while j<=np
        if i ~= j && Id(i)~=Id(j)
            imp(l)=S(i,j);
            l=l+1;
            j=j+1;
        else 
            j=j+1;
        end
    end
end

%The minimum and maximum value of gen and imp

minval=min(min(gen),min(imp));
maxval=max(max(gen),max(imp));

%Defining the bins, third parameter: the number of bins

xbins=linspace(minval-1,maxval+1,100);

figure(3);
hist(imp, xbins);
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r')

hold on;
hist(gen, xbins);
legend('imposter','genuine');






                
   
 