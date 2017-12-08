function no_FMR = FMR(t, imp)

%Counting the scores that are above of the certain threshold 't'

count=0;

for i=1:length(imp)
    if imp(i)>t
        count = count+1;
    end
end

%Calculation of the FMR.

no_FMR=count/length(imp);

