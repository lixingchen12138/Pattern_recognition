ClusterSamples = double(ClusterSamples);
[m n] = size(ClusterSamples);
u = zeros(10,n);
for i=1:10
    u(i,:)=ClusterSamples(i,:);
end
k=10;
while 1
    pre_u = u;
    quan = zeros(m,k);
    for i=1:m
        c=[];
        for j=1:k
            c=[c norm(ClusterSamples(i,:) - u(j,:))];
        end
        [value index] = min(c);
        quan(i,index) = 1;
    end
    for i=1:k
        for j=1:n
            u(i,j)=sum(quan(:,i).*ClusterSamples(:,j))/sum(quan(:,i));
        end
    end
    if norm(u - pre_u)<0.1
        break;
    end
end
re =[];
for i=1:m
    tmp=[];
    for j=1:k
        tmp=[tmp norm(ClusterSamples(i,:)-u(j,:))];
    end
    [value index] = min(tmp);
    re = [re;ClusterSamples(i,:) index];
end