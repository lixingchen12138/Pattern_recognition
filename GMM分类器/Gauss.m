function prob = Gauss( Data, Mu, Sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m n] = size(Data);
Data = Data - repmat(Mu,m,1);
prob = sum((Data*inv(Sigma)).*Data,2);
prob = exp(-0.5*prob)/((2*pi)^(n/2)*(abs(det(Sigma))^(1/2)));

end

