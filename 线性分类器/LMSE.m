x1 = [1 1];x2 = [2 2];x3 = [2 0];
x4 = [0 0];x5 = [1 0];x6 = [0 1];
y1 = [x1,1];y2 = [x2,1];y3 = [x3,1];
y4 = [-x4,-1];y5 = [-x5,-1];y6 = [-x6,-1];
y = [y1;y2;y3;y4;y5;y6]
b = [1;1;1;1;1;1;]

z = inv(y'*y)*y'
w = z*b