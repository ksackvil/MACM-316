%
%  lsq_red.m -- hl -- (Feb. 2019)
%

% load the red data into an array
red = csvread('red.csv'); 

% names of the columns in red array
titles = ["fixed acidity";"volatile acidity";"citric acid";"residual sugar";  ...
          "chlorides";"free sulfur dioxide";"total sulfur dioxide";"density"; ...
          "pH";"sulphates";"quality"];

% least-squares matrix A
cols = [1:10];
A = [ones(size(red(:,1))) red(:,cols)];

% known quality ratings
y = red(:,11); 
     
% solve for lsq coefficents using "\"
c = A \ y; 

% compute RMS error 
RMS = rms(A*c-y);

% ==================== EDIT START ==================== %

% ========== 1. DIRECT NORMAL EQUATIONS ========== %
% insert the normal equations solve here: 
c_test1 = (transpose(A)*A) \ (transpose(A)*y);

diff_1 = abs(c-c_test1);
RMS_1 = rms(A*c_test1-y);

% ========== 2. QR FUNCTION CALL ========== %
% insert the QR solve here: 
[Q2, R2] = qr(A,0);
c_test2 = R2 \ (transpose(Q2)*y);

diff_2 = abs(c-c_test2);
RMS_2 = rms(A*c_test2-y);

% ========== 2. QR PERMUTED FUNCTION CALL ========== %
% insert the permuted QR solve here:
% uncomment this line to generate permutation matrix P
[Q3, R3, E] = qr(A,0);
I = eye(11,11); P = I(:,E);
c_test3 = (R3*transpose(P)) \ (transpose(Q3)*y);

diff_3 = abs(c-c_test3);
RMS_3 = rms(A*c_test3-y);

% ==================== EDIT END ==================== %

% the below plotting tool MAY help you with the quality prediction
% challenge. The plot shows the relationship between the jj^th
% attribute and the quality rating. 
% You can visualize various relationships by changing jj

% If you use this tool, do not feel obligated to include the plots 
% in your report. 

jj = 5;
figure(jj);  clf

plot(red(:,jj),red(:,end),'.')
title([titles{jj}, ' vs. quality rating'],'fontsize',15)
xlabel([titles(jj)],'fontsize',15)
ylabel('quality','fontsize',15)
grid on












