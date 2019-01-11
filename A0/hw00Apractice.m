%MACM 316 - MatLab Warmup Problem A 
%Taylor Series 
%
%Please Refer to the the 'Matlab Warmup' assignment sheet found on Canvas.
%
%Purpose: The purpose of this problem is to compute a truncated
%       | Taylor Series of the function r(t)=t^3*exp(at). We
%       | will do this by reviewing/learning about inline
%       | functions, for loops, and vector syntax in MatLab.  
%       | We will also see a brief introduction to computing
%       | errors.

% ~~~~~~~~~~ SUBMIT PART ~~~~~~~~~~ %

format long e

% new var
a = 2;
t = [-2:.05:2]; 
r = @(t) t.^3.*exp(a*t);
s=0;

for k = 0:15
    s = s + 1/factorial(k) * ((a * t).^(k));
end 

s = (t.^3) .* s;
Err=s-r(t);

% where to = -1.05 ...
Err0 = Err(20);

%Type your new plot title here
plot_title = 'Plot of r(t)=t^3*exp(at) and Taylor Approximation s(t)';

% ~~~~~~~~~~ END ~~~~~~~~~~ %

%Plotting of results
figure(1)
clf
hold on 
plot(t,r(t),'b')
plot(t,s,'r--')
grid on 
xlabel('t','fontsize',15)
ylabel('y','fontsize',15)
title(plot_title,'fontsize',15)
legend({'r(t)','s(t)'},'fontsize',15)

figure(2)
clf
hold on 
plot(t,Err,'k')
grid on 
xlabel('t','fontsize',15)
ylabel('Err(t)','fontsize',15)
title('Error plot','fontsize',15)