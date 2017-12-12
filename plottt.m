%Extracting the necessary values

[S, Id] = get_scores_from_file;
[gen, imp] = get_genimp(S,Id);

%The vector 'x' contains the different threshold values
%The vector 'y' contains the corresponding FMR values
%The vector 'z' contains the corresponding FNMR values

x=-300:0;
y=zeros(1,length(x));
z=zeros(1,length(x));

for i=1:length(x)
    y(i)=FMR(x(i), imp);
end

for i=1:length(x)
    z(i)=FNMR(x(i), gen);
end

%Plotting FMR and FNMR


figure(4); plot(x,y);
title('False match rate and False non match rate')
xlabel('t')
ylabel('Error rate')
axis([x(1) x(length(x)) 0 1])
hold on
plot(x,z);

%Plotting DEC

figure(5); plot(y,z);
title('Decision Error Trade-Off');
xlabel('FMR(t)')
ylabel('FNMR(t)')
axis([0 1 0 1])


%Plotting ROC

figure(6); plot(y,1.-z);
title('ROC');
xlabel('FMR(t)')
ylabel('TMR(t)')
axis([0 1 0 1])



