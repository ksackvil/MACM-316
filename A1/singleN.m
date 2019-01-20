%
%  w02w_GEerr.m -- GE truncation error (djm -- 08 sep 2019)
%

clear; 

NexVect = 200: 200: 10000;
ticTocArr = [];
eResArr = [];

for index=1:length(NexVect) 
    disp("Exp with Nex = " + NexVect(index));
    
    tic
    %  N = matrix size;  Nex = # of experiments
    N = 1*128;
    Nex = 1*NexVect(index);

    %  solution of all ones
    x0 = ones(N,1);

    %  data vector of errors
    res_err = zeros(Nex,1);
    sol_err = zeros(Nex,1);

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

    disp("");
    ticTocArr(index) = toc;
    eResArr(index) = mean(log10(res_err));
    
end

figure;
hold on;
xlabel("Number of Experiments")
ylabel("Time Of Experiment")
plot(NexVect, ticTocArr, 'r-o');
hold off;

figure;
hold on;
title('Typical GE Error For Nexp')
xlabel("Number of Experiments")
ylabel("Typical Error")
plot(NexVect, eResArr, 'b-o');
hold off;

