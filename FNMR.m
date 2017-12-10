function FNMR = FNMR(t, gen)

%Counting the scores that are above of the certain threshold 't'

count=0;

for i=1:length(gen)
    if gen(i)>t
        count = count+1;
    end
end

%Calculation of the TMR and FNMR.

TMR=count/length(gen);
FNMR=1-TMR;

