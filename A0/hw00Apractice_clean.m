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


t = [-2:.1:2]; 
r = @(t) t.^2.*exp(t);
s=0;

for k = 0:3
    s = s + 1/factorial(k)*(t).^(k+2);
end 

Err=s-r(t);

%Type your new plot title here
plot_title = 'Plot of r(t) = t^2exp(t) and Taylor Approximation s(t)';

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