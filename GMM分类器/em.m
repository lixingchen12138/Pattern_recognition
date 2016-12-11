function [Alpha, Mu, Sigma] = em( Data, Alpha, Mu, Sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m n]= size(Data);
M = size(Mu,2)
Epsilon = 0.0001;
while 1
   Mu_old = Mu;
   Alpha_old = Alpha;
   Sigma_old = Sigma;
for i=1:M
Pxi(:,i) = Gauss(Data, Mu(i,:), Sigma(:,:,i));
end
Pix_tmp = repmat(Alpha,m,1).*Pxi;
Pix = Pix_tmp./(repmat(sum(Pix_tmp,M),1,M));
Beta = sum(Pix);

for i=1:M
    Alpha(i) = Beta(i)/m;
    Mu(i,:) = Pix(:,i)'*Data / Beta(i);
    Data_tmp = Data - repmat(Mu(i,:),m,1);
    Sigma(:,:,i) = (repmat(Pix(:,i)',n, 1) .* Data_tmp'*Data_tmp) / Beta(i);
end
  v = [sum(abs(Mu - Mu_old)), abs(Alpha - Alpha_old)];
  s = abs(Sigma-Sigma_old);
  v2 = 0;
  for i=1:M
    v2 = v2 + det(s(:,:,i));
  end
 
  if ((sum(v) + v2) < Epsilon)
    break;
  end
end

end

