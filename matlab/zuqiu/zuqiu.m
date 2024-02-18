clc,clear;
% 导入数据
% data = xlsread('zq_1.xlsx');
% data = xlsread('zq_2.xlsx');
data = xlsread('zq_3.xlsx');
X= data(:,1)';  % 投入指标数据，每一列代表每个决策单元的投入数据
Y= data(:,2:4)';  % 产出指标数据，每一列代表每个决策单元的产出数据
n=size(X,2);      %决策单元数
m=size(X,1);      %投入指标数
q=size(Y,1);      %产出指标数
% 投入导向数据
w = [];
for i = 1:n
   f = [zeros(1,n) 1];              % 定义目标函数
   A = [X -X(:,i); -Y zeros(q,1)];  % 指定不等式约束
   b = [zeros(1,m) -Y(:,i)']';
   Aeq = [ones(1,n) 0];             % 定义等式约束
   beq = 1;
   LB =[zeros(n+1,1)];              % 指定下界
   UB = [ ];
   w(:,i) = linprog(f,A,b,Aeq,beq,LB,UB);   % 模型求解 
end
theta_BCC_input = w(n+1,:)';                % 结果输出
% xlswrite('zq_1-out.xls',theta_BCC_input);
xlswrite('zq_2-out.xls',theta_BCC_input);
xlswrite('zq_3-out.xls',theta_BCC_input);
