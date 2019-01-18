%
%  w02w_GEerr.m -- GE truncation error (djm -- 08 sep 2019)
%

testVect = [];
for i=0:7
    testVect(i+1) = 2^i;
end
e_res_arr = zeros(1,6);


for itr = 1:length(testVect)
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
        
        e_res = e_res + log10(res_err(kk));
    end

    e_res = (1/Nex) * e_res;
    e_res_arr(itr) = e_res;
    disp(e_res);
    

%     %  histogram for residual error
%     figure(1);  clf
%     subplot(2,1,1)
%     hist(log10(res_err),20)
% 
%     %  mean & variance
%     min_re = min(log10(res_err));
% 
%     string = ['mean = ' num2str(mean(log10(res_err)))];
%     text(min_re,0.10*Nex,string,'fontsize',12)
%     string = ['var  = ' num2str(var(log10(res_err)))];
%     text(min_re,0.08*Nex,string,'fontsize',12)
% 
%     %  axis labels
%     xlabel('log_{10} rms error','fontsize',12)
%     ylabel(['number from ' num2str(Nex) ' experiments'])
%     title('residual error: A x_1- b','fontsize',14)
% 
%     %  plot for solution error
%     subplot(2,1,2)
%     hist(log10(sol_err),20)
%     xlabel('log_{10} rms error','fontsize',12)
%     ylabel(['number from ' num2str(Nex) ' experiments'])
%     title('solution error: x_1-x_0','fontsize',14)
 
end

plot(log10(testVect), e_res_arr);
% waitforbuttonpress;
% plot(testVect, e_res_arr);
