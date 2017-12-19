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

%Initialization of the vector containing the impostor scores

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

mingen = min(gen)
maxgen = max(gen)
minimp = min(imp)
maximp = max(imp)
minval=min(mingen,minimp)
maxval=max(maxgen,maximp)
range = maxval - minval
%range is 2001 -> 2001/87=23 23 is the boundaries 87binssize
xbins = [];

q = minval;
m=1;
while 1
    if q>maxval;
        xbins(m)= q;
        break;
    end
    xbins(m)= q;
    q = q+29;
    m=m+1;
end
    
%minval=min(min(gen),min(imp));
%maxval=max(max(gen),max(imp));
%xbins=[-1700 -1500 -500 -10 0 20 50 100 350 450];
%figure(3);
%hist(imp, 100);
%h = findobj(gca,'Type','patch');
%set(h,'FaceColor','r')
%hold on;
%hist(gen, 100);
%legend('impostor','genuine');


figure(3);
hist(imp, xbins);
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r')
hold on;
hist(gen, xbins);
legend('impostor','genuine');




                
   
 