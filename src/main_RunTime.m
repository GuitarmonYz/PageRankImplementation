% CSE6643 PAGE RANK PROJECT
% Arthur: Xiyu Ouyang, Yan Zhao, Jiawei Zhu
% College of Computing
% Department of Computational Science and Engineering
% Georgia Institute of Technology
% 2019/4/16

%   main_RunTime    Run Time for each Method
%   main_RunTime plots the run time for eigen decomposition of a 
%   randomly generated sparse matrix in terms of power method, QR
%   iterations with shift, QR without Hessenberg, and arnoldi
%   for a number (iter) of times
iter = 1;

%Create time arrays to store run time of each method
tPower = zeros(1, iter);
tQRWH = zeros(1, iter);
tQRS = zeros(1, iter);
tArnoldi = zeros(1, iter);

ttPower = zeros(1, 3);
ttQRWH = zeros(1, 3);
ttQRS = zeros(1, 3);
ttArnoldi = zeros(1, 3);

%initialize input parameters
p = 0.4;
k = 30;
num_iter = 30;

%compute run time for each method for iter times
iters = [10, 100, 500, 700, 1000];
% runtime on dense matrix
% for j = 1:5
%     for i = 1:iter
%         A = rand(iters(j));
%         tic;
%         power_method(A, k);
%         tPower(i) = toc;
%         disp("power finished");
%         tic;
%         QR_iteration_with_shift(A, num_iter);
%         tQRS(i) = toc;
%         disp('QRS finished');
%         tic;
%         QR_without_hessenberg(A, num_iter);
%         tQRWH(i) = toc;
%         disp('QRWH finished');
%         tic;
%         arnoldi_with_qr(A, 100, num_iter);
%         tArnoldi(i) = toc;
%         disp('arnoldi finished');
%     end
%     ttPower(j) = mean(tPower);
%     ttQRWH(j) = mean(tQRWH);
%     ttQRS(j) = mean(tQRS);
%     ttArnoldi(j) = mean(tArnoldi);
% end
% hold on
% plot(iters, ttPower);
% plot(iters, ttQRWH);
% plot(iters, ttQRS);
% plot(iters, ttArnoldi);
% legend("Power Method","QR without Hessenberg", "QR with Shift", "Arnoldi");
% xlabel("matrix size");
% ylabel("Run Time (sec)");
% hold off

% for j = 1:5
%     for i = 1:iter
%         A = createSparse(iters(j), 0.4);
%         tic;
%         power_method(A, k);
%         tPower(i) = toc;
%         disp("power finished");
%         tic;
%         arnoldi_with_qr(A, 100, num_iter);
%         tArnoldi(i) = toc;
%         disp('arnoldi finished');
%     end
%     ttPower(j) = mean(tPower);
%     ttArnoldi(j) = mean(tArnoldi);
% end
% figure;
% hold on
% plot(iters, ttPower);
% plot(iters, ttArnoldi);
% title('runtime for power and arnoldi on sparse matrix');
% legend("Power Method", "Arnoldi with QRS");
% xlabel("matrix size");
% ylabel("Run Time (sec)");

