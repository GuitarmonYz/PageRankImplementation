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
iter = 5;

%Create time arrays to store run time of each method
tPower = zeros(1, iter);
tQRWH = zeros(1, iter);
tQRS = zeros(1, iter);
tArnoldi = zeros(1, iter);

ttPower = zeros(1, 4);
ttQRWH = zeros(1, 4);
ttQRS = zeros(1, 4);
ttArnoldi = zeros(1, 4);

%initialize input parameters
n = 100;
p = 0.4;
k = 30;
num_iter = 30;

%compute run time for each method for iter times

% runtime on dense matrix
for j = 1:4
    for i = 1:iter
        A = rand(10^(j));
        tic;
        power_method(A, k);
        tPower(i) = toc;
        disp("power finished");
        tic;
        QR_iteration_with_shift(A, num_iter);
        tQRS(i) = toc;
        disp('QRS finished');
        tic;
        QR_without_hessenberg(A, num_iter);
        tQRWH(i) = toc;
        disp('QRWH finished');
        tic
        arnoldi_with_qr(A, 100, num_iter);
        tArnoldi(i) = toc;
        disp('arnoldi finished');
    end
    ttPower(j) = mean(tPower);
    ttQRWH(j) = mean(tQRWH);
    ttQRS(j) = mean(tQRS);
    ttArnoldi(j) = mean(tArnoldi);
end
hold on
iters = [1e2,1e3,1e4,1e5];
plot(iters, ttPower);
plot(iters, ttQRWH);
plot(iters, ttQRS);
plot(iters, ttArnoldi);
legend("Power Method", "Arnoldi", "QR with Shift", "QR without Hessenberg");
xlabel("Number of Iterations");
ylabel("Run Time (sec)");
% for i = 1:5
%     [input] = createSparse(n, p);
%     
%     tic;
%     powerMethod(input, k);
%     tPower(i) = toc;
%     
%     tic;
%     QR_iteration_with_shift(input, num_iter);
%     tQRS(i) = toc;
%     
%     tic;
%     QR_without_hessenberg(input, num_iter);
%     tQRWH(i) = toc;
%     
%     tic
%     arnoldi(input);
%     tArnoldi(i) = toc;
% end
% 
% %plot run time
% figure(1);
% iters = linspace(1, iter, iter);
% plot(iters, tPower);
% xlabel("Number of Iterations");
% ylabel("Run Time (sec)");
% title("Run Time Comparison")
% hold on
% plot(iters, tArnoldi)
% plot(iters, tQRS);
% plot(iters, tQRWH);
% legend("Power Method", "Arnoldi", "QR with Shift", "QR without Hessenberg")
% hold off