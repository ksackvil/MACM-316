%
%  lsq_red.m -- hl -- (Feb. 2019)
%
clear;

% load the data files into an arrays
red = csvread('red.csv'); 
white_training = csvread('white.csv');
whitelist2 = csvread('whitelist2.csv');

% names of the columns in red array
titles = ["fixed acidity";"volatile acidity";"citric acid";"residual sugar";  ...
          "chlorides";"free sulfur dioxide";"total sulfur dioxide";"density"; ...
          "pH";"sulphates";"quality"];


% ==================== PART 2 START ==================== %
% least-squares matrix A
cols = [1:10];
A = [ones(size(red(:,1))) red(:,cols)];

% known quality ratings
y = red(:,11); 
     
% solve for lsq coefficents using "\"
c = A \ y; 

% compute RMS error 
RMS = rms(A*c-y);

% ========== 1. DIRECT NORMAL EQUATIONS ========== %
disp("Part 1.")

% insert the normal equations solve here: 
AT = transpose(A);
% c_test1 = (transpose(A)*A) \ (transpose(A)*y);
c_test1 = inv(AT*A)*AT*y;

diff_1 = abs(c-c_test1)
RMS_1 = rms(A*c_test1-y)

% ========== 2. QR FUNCTION CALL ========== %
disp("Part 2.")

% insert the QR solve here: 
[Q2, R2] = qr(A,0);
% c_test2 = R2 \ (transpose(Q2)*y);
c_test2 = inv(R2)*transpose(Q2)*y;

diff_2 = abs(c-c_test2)
RMS_2 = rms(A*c_test2-y)

% ========== 2. QR PERMUTED FUNCTION CALL ========== %
disp("Part 3.")

% insert the permuted QR solve here:
% uncomment this line to generate permutation matrix P
[Q3, R3, E] = qr(A,0);
I = eye(11,11); P = I(:,E);
% c_test3 = (R3*transpose(P)) \ (transpose(Q3)*y);
c_test3 = P*inv(R3)*transpose(Q3)*y;

diff_3 = abs(c-c_test3)
RMS_3 = rms(A*c_test3-y)
% 
% ==================== PART 2 END ==================== %

% the below plotting tool MAY help you with the quality prediction
% challenge. The plot shows the relationship between the jj^th
% attribute and the quality rating. 
% You can visualize various relationships by changing jj

% If you use this tool, do not feel obligated to include the plots 
% in your report. 

% jj = 8;
% figure(jj);  clf
% 
% plot(red(:,jj),red(:,end),'.')
% title([titles{jj}, ' vs. quality rating'],'fontsize',15)
% xlabel([titles(jj)],'fontsize',15)
% ylabel('quality','fontsize',15)
% grid on










