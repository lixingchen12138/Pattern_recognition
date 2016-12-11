x = zeros(30000,18)
y = ones(30000,1)
for i=1:30000
    x(i,:) = [TrainSamples(i,:) 1];
end
TrainLabels = double(TrainLabels);
y = y + TrainLabels;
w = zeros(10,18);
p = 1
k = 1
while k==1
    k = 0
    for i=1:30000
        d = w(y(i,:),:) * x(i,:)';
        for j=1:10
            if j == y(i,:)
                continue
            elseif (w(j,:) * x(i,:)')<d
                continue
            else 
                w(y(i,:),:) = w(y(i,:),:) + p*x(i,:);
                w(j,:) = w(j,:) - p*x(i,:);
                k = 1;
            end
        end
    end
end
            
    
    