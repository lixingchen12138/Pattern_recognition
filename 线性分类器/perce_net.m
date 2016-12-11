x = zeros(30000,18)
y = ones(30000,1)
x1 = zeros(10000,18)
c = zeros(10000,1)
for i=1:30000
    x(i,:) = [TrainSamples(i,:) 1];
end
TrainLabels = double(TrainLabels);
y = y + TrainLabels;
p0 = 0.00000000015
t1 = [1;-1;-1;-1;-1;-1;-1;-1;-1;-1];
t2 = [-1;1;-1;-1;-1;-1;-1;-1;-1;-1];
t3 = [-1;-1;1;-1;-1;-1;-1;-1;-1;-1];
t4 = [-1;-1;-1;1;-1;-1;-1;-1;-1;-1];
t5 = [-1;-1;-1;-1;1;-1;-1;-1;-1;-1];
t6 = [-1;-1;-1;-1;-1;1;-1;-1;-1;-1];
t7 = [-1;-1;-1;-1;-1;-1;1;-1;-1;-1];
t8 = [-1;-1;-1;-1;-1;-1;-1;1;-1;-1];
t9 = [-1;-1;-1;-1;-1;-1;-1;-1;1;-1];
t10 =[-1;-1;-1;-1;-1;-1;-1;-1;-1;1];
t = [t1 t2 t3 t4 t5 t6 t7 t8 t9 t10];
k = 0;
w = zeros(10,18);
while 1
    number = 0;
    k = k + 1;
    sum = zeros(10,18);
    for i=1:30000
        sum = sum + (t(:,y(i,1)) - w*x(i,:)')*x(i,:);
    end
    w = w + p0*sum
    for i=1:10
        for j=1:18
            if sum(i,j)*p0 < 0.00001
                number = number + 1;
            end
        end
    end
    if number == 180
        break;
    end
            
end
for i=1:10000
    x1(i,:) = [TestSamples(i,:) 1];
end

result = x1*w'
for i=1:10000
    [max_a,index] = max(result(i,:));
    c(i,1) = index - 1
end

