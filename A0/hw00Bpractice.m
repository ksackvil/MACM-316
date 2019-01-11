%MACM 316 - MatLab Warmup Problem B
%Linear Algebra
%
%Please Refer to the the 'Matlab Warmup' assignment sheet found on Canvas.
%
%Purpose: The purpose of this problem is to compute a quadratic
%       | least squares fit to some noisy data. We will do this by 
%       | reivewing/learning the basic linear algebra operations in 
%       | Matlab. This includes matrix operations/syntax,
%       | manipulating vectors, and solving linear systems.

%  PRACTICE INITIALIZATION

%  clear the workspace of old values
clear

%  load the practice data & list variables
load hw00Bpractice.mat
% whos

% ~~~~~~~~~~ SUBMIT PART ~~~~~~~~~~ %

whos
A = [t.^2 t ones(size(t))]; 

%  redo these lines
M = transpose(A) * A;
v = transpose(A) * y;

%  linear solve
c = M\v;

z = c(1)*t.^2 + c(2)*t + c(3);

% calculating square error
s = 0;

for j = 1:N
    zTemp = c(1)*t(j).^2 + c(2)*t(j) + c(3);
    s = s + (y(j) - zTemp)^2;
end 

Err = (1/N) * s;

% ~~~~~~~~~~ END ~~~~~~~~~~ %

disp('grading variables list:  z, Err')

%  pre-written Plotting section
figure(1)
clf
hold on
plot(t,y,'bo')
plot(t,z,'r')
grid on
xlabel('t','fontsize',15)
ylabel('y','fontsize',15)
title('Least Squares Fit to Random Data','fontsize',15)
legend({'Data', 'Fit'},'fontsize',15)