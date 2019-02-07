%% Computing Assignment: Root Finding 2D contour
% SMethod function file, Kai Sackville-Hii (feb 4, 2019)

function xS = SMethod(ff, a, b, tol)
%BMethod Implementation of the bisection method.
%Pre:
%   f = function to be approximated.
%   a, b = Initial guess.
%   tol = The tolorence condition.
%Post:
%   p = The approximated value.

%  0)  set two initial guesses
x0 = a  ;  f0 = ff(x0);
x1 = b;
Nevals = 1;
itmax = 100;

% figure(100);  clf;  hold on;  grid on
check = x1-x0;
% plot(Nevals,log10(abs(check)),'rx')

Nevals_arr = [];

%  root-finding loop
while (abs(check)>tol)
	if Nevals > itmax
		disp('no convergence')
		return
	end

	%  1)  function evaluation at x1
	f1 = ff(x1);
    Nevals_arr(Nevals) = Nevals + 1;
	Nevals = Nevals + 1;
	
% 	fprintf('\t %d \t %16.15f \t %+6.5e \t %+16.15f \t %+6.5e \t %+6.5e \n', ...
% 		[Nevals, x0, f0, x1, f1, check])
	
	%  2)  secant update
	xS = x1 - (f1 * (x1-x0)/(f1-f0));
	
	%  3)  prepare next iteration
	x0 = x1;  f0 = f1;
	x1 = xS;
	
	check = x1-x0;
% 	plot(Nevals,log10(abs(check)),'kx')
end

% disp(max(Nevals_arr));
end

