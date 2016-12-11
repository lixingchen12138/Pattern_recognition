TestLabels = double(TestLabels);
count = 0;
for i=1:10000
    if c(i,1) == TestLabels(i,1)
        count = count + 1
    end
end
    