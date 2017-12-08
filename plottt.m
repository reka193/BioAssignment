%Extracting the necessary values

[S, Id] = get_scores_from_file;
[gen, imp] = get_genimp(S,Id);

%The vector 'x' contains the different threshold values
%The vector 'y' contains the corresponding FMR values

x=-100:0;
y=[];
for i=1:101
    y(i)=FMR(x(i), imp);
end
figure(4); plot(x,y);