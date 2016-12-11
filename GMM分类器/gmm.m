Data1 = Train1;
Data2 = Train2;
Data = Test1;
Mu1 = [5.1 5;7 7];
Mu2 = [5 5.1;15 15];
Sigma_1 = [1 1.1;1 1];
Sigma_2 = [2 2;2.1 2];
Sigma_3 = [3 3;3 3.1];
Sigma_4 = [4 4;4 4.1];
Sigma1(:,:,1) = Sigma_1;
Sigma1(:,:,2) = Sigma_2;
Sigma2(:,:,1) = Sigma_3;
Sigma2(:,:,2) = Sigma_4;
Alpha1 = [1/4 3/4];
Alpha2 = [1/4 3/4];
[Alpha1, Mu1, Sigma1] = em( Data1, Alpha1, Mu1, Sigma1 )
[Alpha2, Mu2, Sigma2] = em( Data2, Alpha2, Mu2, Sigma2 )
M = size(Mu1,2);
[m n] = size(Data);
for i=1:M
Pxi1(:,i) = Gauss(Data, Mu1(i,:), Sigma1(:,:,i));
end
result1 = sum(Pxi1,2);
for i=1:M
Pxi2(:,i) = Gauss(Data, Mu2(i,:), Sigma2(:,:,i));
end
result2 = sum(Pxi2,2);
count = 0;
for i=1:m
    if result1(i,1) >= result2(i,1)
        count = count +1;
    end
end