clc,clear;
% ��������
% data = xlsread('zq_1.xlsx');
% data = xlsread('zq_2.xlsx');
data = xlsread('zq_3.xlsx');
X= data(:,1)';  % Ͷ��ָ�����ݣ�ÿһ�д���ÿ�����ߵ�Ԫ��Ͷ������
Y= data(:,2:4)';  % ����ָ�����ݣ�ÿһ�д���ÿ�����ߵ�Ԫ�Ĳ�������
n=size(X,2);      %���ߵ�Ԫ��
m=size(X,1);      %Ͷ��ָ����
q=size(Y,1);      %����ָ����
% Ͷ�뵼������
w = [];
for i = 1:n
   f = [zeros(1,n) 1];              % ����Ŀ�꺯��
   A = [X -X(:,i); -Y zeros(q,1)];  % ָ������ʽԼ��
   b = [zeros(1,m) -Y(:,i)']';
   Aeq = [ones(1,n) 0];             % �����ʽԼ��
   beq = 1;
   LB =[zeros(n+1,1)];              % ָ���½�
   UB = [ ];
   w(:,i) = linprog(f,A,b,Aeq,beq,LB,UB);   % ģ����� 
end
theta_BCC_input = w(n+1,:)';                % ������
% xlswrite('zq_1-out.xls',theta_BCC_input);
xlswrite('zq_2-out.xls',theta_BCC_input);
xlswrite('zq_3-out.xls',theta_BCC_input);
