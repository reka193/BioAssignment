%Extracting the necessary values

[S, Id] = get_scores_from_file;
[gen, imp] = get_genimp(S,Id);

%The vector 'x' contains the different threshold values
%The vector 'y' contains the corresponding FMR values
%The vector 'z' contains the corresponding FNMR values

x=-300:50;
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
hold on

%Calculating and plotting EER

% p=[0 1];
% b_line=polyfit(p,p,1);
% y_line2=polyval(b_line,y);

p=[1 0];
y_line2=polyval(p,y);

x_int=interp1((y_line2-z), y, 0);
y_int=polyval(p,x_int);
plot(p,p)
hold on
plot(x_int, y_int, '+r')



%Plotting ROC

figure(6); plot(y,1.-z);
title('ROC');
xlabel('FMR(t)')
ylabel('TMR(t)')
axis([0 1 0 1])



