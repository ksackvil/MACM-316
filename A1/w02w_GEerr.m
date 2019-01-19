%
%  w02w_GEerr.m -- GE truncation error (djm -- 08 sep 2019)
%

clear;

testVect = [];
e_res_arr = [];
finalTime = 0;

% populate testVect with some values of N
for index=3:10
    testVect(index+1) = 2^index;
end

for itr = 1:length(testVect)
    tic
    disp("Test case for N = "+testVect(itr));
    
    %  N = matrix size;  Nex = # of experiments
    N = 1*testVect(itr);
    Nex = 1*100;

    %  solution of all ones
    x0 = ones(N,1);

    %  data vector of errors
    res_err = zeros(Nex,1);
    sol_err = zeros(Nex,1);

    e_res = 0;
    
    for kk = 1:Nex
        %  make random matrix & b-vector
        A = eye(N,N) + randn(N,N)/sqrt(N);
        b = A*x0;

        %  GE via backslash
        x1 = A \ b;

        %  rms residual error 
        res_err(kk) = rms(A*x1-b);

        % rms solution error
        sol_err(kk) = rms(x1-x0);
        
    end
    
    e_res_arr(itr) = mean(log10(res_err));
     
    finalTime = finalTime + toc;
    disp(toc + " seconds elapsed");
    disp(" ");
end

disp("Total Experiment Time: " + finalTime)

% ploted lines

x = log10(testVect);
y = e_res_arr;

figure
hold on;
title('Typical GE Error For Matrix Size N')
xlabel('Eres(N)') 
ylabel('log10(N)') 
plot(x, y, 'b-o');
hold off;
