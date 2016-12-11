result = zeros(10,10);
for i=1:m
    if re(i,785)==1
        number = SampleLabels(i,1);
        result(1,number+1) = result(1,number+1)+1;
    end
    if re(i,785)==2
        number = SampleLabels(i,1);
        result(2,number+1) = result(2,number+1)+1;
    end
    if re(i,785)==3
        number = SampleLabels(i,1);
        result(3,number+1) = result(3,number+1)+1;
    end
    if re(i,785)==4
        number = SampleLabels(i,1);
        result(4,number+1) = result(4,number+1)+1;
           end
            if re(i,785)==5
        number = SampleLabels(i,1);
        result(5,number+1) = result(5,number+1)+1;
            end
            if re(i,785)==6
        number = SampleLabels(i,1);
        result(6,number+1) = result(6,number+1)+1;
            end
            if re(i,785)==7
        number = SampleLabels(i,1);
        result(7,number+1) = result(7,number+1)+1;
            end
            if re(i,785)==8
        number = SampleLabels(i,1);
        result(8,number+1) = result(8,number+1)+1;
            end
            if re(i,785)==9
        number = SampleLabels(i,1);
        result(9,number+1) = result(9,number+1)+1;
            end
    if re(i,785)==10
        number = SampleLabels(i,1);
        result(10,number+1) = result(10,number+1)+1;
    end
end