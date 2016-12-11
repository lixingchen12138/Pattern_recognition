date = [0 0;1 0;0 1;1 1;2 1;1 2;2 2;3 2;6 6;7 6;8 6;7 7;8 7;9 7;7 8;8 8;9 8;8 9;9 9];
u = [0 0;1 0];
[m n] = size(date);
k=2;
while 1
    pre_u = u;
    quan = zeros(m,k);
    for i=1:m
        c=[];
        for j=1:k
            c=[c norm(date(i,:) - u(j,:))];
        end
        [value index] = min(c);
        quan(i,index) = 1;
    end
    for i=1:k
        for j=1:n
            u(i,j)=sum(quan(:,i).*date(:,j))/sum(quan(:,i));
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
        tmp=[tmp norm(date(i,:)-u(j,:))];
    end
    [value index] = min(tmp);
    re = [re;date(i,:) index];
end
figure;
hold on;
for i=1:m 
    if re(i,3)==1   
         plot(re(i,1),re(i,2),'bo'); 
         axis([0 9 0 9])
    elseif re(i,3)==2
         plot(re(i,1),re(i,2),'ro');
         axis([0 9 0 9])
    else 
         plot(re(i,1),re(i,2),'go'); 
         axis([0 9 0 9])
    end
end
for i=1:k
    plot(u(i,1),u(i,2),'kx');
end
grid on;

        
        