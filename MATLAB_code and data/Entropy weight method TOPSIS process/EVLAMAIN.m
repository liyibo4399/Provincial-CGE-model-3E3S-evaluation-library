clc;clear;
%%
X=xlsread('【1018-2】Steel_3E3S.xlsx');

X=X(:,6:end);

%1-2     3       4-6                7-8      9-10      11-13

%极小    极小    4、6正向 5 负向     极小     极大     11、13极小  12极大


%X(:,[1:2 17])=[];

%%
% X=xlsread('副本(4.18)水泥数据-李娟.xlsx');
X(find(isnan(X)==1)) = 0;

E1=X(:,1:2);E2=X(:,3);E3=X(:,4:6);
S1=X(:,7:8);S2=X(:,9:10);S3=X(:,11:13);





%%
%获取行数列数
[n,m] = size(E1);
%disp(['共有' num2str(n) '个评价对象 共有' num2str(m) '个评价指标'])
judge=1;
if judge==1
    Position=[1 2];
%    disp('请输入这些列分别是什么指标类型（1：极小型 2：中间型 3：区间型）')
    Type=[1 1];
    for i=1:size(Position,2)
        E1(:,Position(i))=Positivization(E1(:,Position(i)),Type(i),Position(i));
    end
%    disp('正向化后的矩阵为 X=');
%    disp(E1(1).Vlu);
end
%标准化
Z = E1 ./ repmat(sum(E1.*E1) .^ 0.5, n, 1);
 
 
 
%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")
Judge = 1;
if Judge == 1
    if sum(sum(Z<0))>0
%        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn)
            end
        end
 %       disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
 %   disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
 

 
D_P = sum([W .* (Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;%最优距离
D_N = sum([W .* (Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
%disp('最后的得分为：')
E1_S = S %得分归一化 最后各方案得分相加为1


 %%

[n,m] = size(E2);
%disp(['共有' num2str(n) '个评价对象 共有' num2str(m) '个评价指标'])
judge=1;
if judge==1
    Position=[1];
%    disp('请输入这些列分别是什么指标类型（1：极小型 2：中间型 3：区间型）')
    Type=[1];
    for i=1:size(Position,2)
        E2(:,Position(i))=Positivization(E2(:,Position(i)),Type(i),Position(i));
    end
%    disp('正向化后的矩阵为 X=');
%    disp(E1(1).Vlu);
end
%标准化
Z = E2 ./ repmat(sum(E2.*E2) .^ 0.5, n, 1);
%disp('标准化矩阵 Z = ')
%disp(Z)
 
 
 
%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")
Judge = 1;
if Judge == 1
    if sum(sum(Z<0))>0
%        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn)
            end
        end
 %       disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
 %   disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
 
 
 
D_P = sum([W .* (Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;%最优距离
D_N = sum([W .* (Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
%disp('最后的得分为：')
E2_S= S %得分归一化 最后各方案得分相加为1


 
%%

[n,m] = size(E3);
%disp(['共有' num2str(n) '个评价对象 共有' num2str(m) '个评价指标'])
judge=1;
if judge==1
    Position=[2];
%    disp('请输入这些列分别是什么指标类型（1：极小型 2：中间型 3：区间型）')
    Type=[1];
    for i=1:size(Position,2)
        E3(:,Position(i))=Positivization(E3(:,Position(i)),Type(i),Position(i));
    end
%    disp('正向化后的矩阵为 X=');
%    disp(E1(1).Vlu);
end
%标准化
Z = E3 ./ repmat(sum(E3.*E3) .^ 0.5, n, 1);
%disp('标准化矩阵 Z = ')
%disp(Z)
 
 
 
%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")
Judge = 1;
if Judge == 1
    if sum(sum(Z<0))>0
%        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn)
            end
        end
 %       disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
 %   disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
 
 
 
D_P = sum([W .* (Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;%最优距离
D_N = sum([W .* (Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
%disp('最后的得分为：')
E3_S= S %得分归一化 最后各方案得分相加为1
 
%%

[n,m] = size(S1);
%disp(['共有' num2str(n) '个评价对象 共有' num2str(m) '个评价指标'])
judge=1;
if judge==1
    Position=[1 2];
%    disp('请输入这些列分别是什么指标类型（1：极小型 2：中间型 3：区间型）')
    Type=[1 1];
    for i=1:size(Position,2)
        S1(:,Position(i))=Positivization(S1(:,Position(i)),Type(i),Position(i));
    end
%    disp('正向化后的矩阵为 X=');
%    disp(E1(1).Vlu);
end
%标准化
Z = S1 ./ repmat(sum(S1.*S1) .^ 0.5, n, 1);
%disp('标准化矩阵 Z = ')
%disp(Z)
 
 
 
%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")
Judge = 1;
if Judge == 1
    if sum(sum(Z<0))>0
%        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn)
            end
        end
 %       disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
 %   disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
 
 
 
D_P = sum([W .* (Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;%最优距离
D_N = sum([W .* (Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
%disp('最后的得分为：')
S1_S= S %得分归一化 最后各方案得分相加为1


%%

[n,m] = size(S2);
%disp(['共有' num2str(n) '个评价对象 共有' num2str(m) '个评价指标'])
judge=0;
if judge==1
    Position=[0];
%    disp('请输入这些列分别是什么指标类型（1：极小型 2：中间型 3：区间型）')
    Type=[0];
    for i=1:size(Position,2)
        S2(:,Position(i))=Positivization(S2(:,Position(i)),Type(i),Position(i));
    end
%    disp('正向化后的矩阵为 X=');
%    disp(E1(1).Vlu);
end
%标准化
Z = S2 ./ repmat(sum(S2.*S2) .^ 0.5, n, 1);
%disp('标准化矩阵 Z = ')
%disp(Z)
 
 
 
%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")
Judge = 1;
if Judge == 1
    if sum(sum(Z<0))>0
%        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn)
            end
        end
 %       disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
 %   disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
 
 
 
D_P = sum([W .* (Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;%最优距离
D_N = sum([W .* (Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
%disp('最后的得分为：')
S2_S = S %得分归一化 最后各方案得分相加为1
%[sorted_S,index] = sort(E1_S ,'descend');
%disp('按得分从高到底排列方案 分别为:  ');
%disp(index);%方案排名


 %%
% % 找到第三列中正数的索引
% positiveIndices = S3(:, 3) > 0;
% 
% % 将正数调整为其倒数
% S3(positiveIndices, 3) = 1 ./ S3(positiveIndices, 3);

[n,m] = size(S3);
%disp(['共有' num2str(n) '个评价对象 共有' num2str(m) '个评价指标'])
judge=1;
if judge==1
    Position=[1 3];
%    disp('请输入这些列分别是什么指标类型（1：极小型 2：中间型 3：区间型）')
    Type=[1 1];
    for i=1:size(Position,2)
        S3(:,Position(i))=Positivization(S3(:,Position(i)),Type(i),Position(i));
    end
%    disp('正向化后的矩阵为 X=');
%    disp(E1(1).Vlu);
end
%标准化
Z = S3 ./ repmat(sum(S3.*S3) .^ 0.5, n, 1);
%disp('标准化矩阵 Z = ')
%disp(Z)
 
 
 
%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")
Judge = 1;
if Judge == 1
    if sum(sum(Z<0))>0
        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn);
            end
        end
        disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W = Entropy_Method(Z);
    disp('熵权法确定的权重为：');
    disp(W);        
else
    W = ones(1,m) ./ m ; %如果不需要加权重就默认权重都相同，即都为1/m
end
 
 
 
D_P = sum([W .* (Z - repmat(max(Z),n,1)) .^ 2 ],2) .^ 0.5;%最优距离
D_N = sum([W .* (Z - repmat(min(Z),n,1)) .^ 2 ],2) .^ 0.5;%最劣距离
S = D_N ./ (D_P+D_N);%相对接近度（可用来当得分）   
%disp('最后的得分为：')
S3_S = S %得分归一化 最后各方案得分相加为1

%% 整理

col = size(X,1);

for j=1:28:col-27
E1end_S(:,(j+27)/28)=E1_S(j:j+27);
end

for j=1:28:col-27
E2end_S(:,(j+27)/28)=E2_S(j:j+27);
end


for j=1:28:col-27
E3end_S(:,(j+27)/28)=E3_S(j:j+27);
end


for j=1:28:col-27
S1end_S(:,(j+27)/28)=S1_S(j:j+27);
end


for j=1:28:col-27
S2end_S(:,(j+27)/28)=S2_S(j:j+27);
end



for j=1:28:col-27
S3end_S(:,(j+27)/28)=S3_S(j:j+27);
end



PROES(:,:) = [E1_S E2_S E3_S S1_S S2_S S3_S];
PROES(find(isnan(PROES)==1))=0;
%X(find(isnan(X)==1)) = 0;


 
 %% 保存变量
xlswrite('F:\Master\MATLAB\zhuanti1\CGE\Score.xlsx',E1end_S,1,'B2')
xlswrite('F:\Master\MATLAB\zhuanti1\CGE\Score.xlsx',E2end_S,2,'B2')
xlswrite('F:\Master\MATLAB\zhuanti1\CGE\Score.xlsx',E3end_S,3,'B2')
xlswrite('F:\Master\MATLAB\zhuanti1\CGE\Score.xlsx',S1end_S,4,'B2')
xlswrite('F:\Master\MATLAB\zhuanti1\CGE\Score.xlsx',S2end_S,5,'B2')
xlswrite('F:\Master\MATLAB\zhuanti1\CGE\Score.xlsx',S3end_S,6,'B2')


%% 耦合协调度
Data = PROES;

%disp("请输入是否需要增加权重向量，需要输入1，不需要输入0")

Z = Data;

    if sum(sum(Z<0))>0
        disp('标准化矩阵中存在负数 正在重新标准化')
        for j=1:m
            minn=min(Z(:,j));
            maxx=max(Z(:,j));
            for i=1:n
                Z(i,j)=(Z(i,j)-minn)/(maxx-minn);
            end
        end
        disp('标准化完成 矩阵Z=  ');
        disp(Z);
    end
    W1 = Entropy_Method(Z);
    disp('熵权法确定的权重为：');
    disp(W1);        

    W2 = ones(1,6) ./ 6 ; %如果不需要加权重就默认权重都相同，即都为1/m
    disp('标准权重为：');
    disp(W2);        


[M,N] = size(Data);
for i=1:M
C(i) = N.*((prod(Data(i,:))./((sum(Data(i,:))).^N)).^(1/N));
T1(i) = sum(W1.*(Data(i,:)));
T2(i) = sum(W2.*(Data(i,:)));
end

D(:,1)= sqrt(C.*T1)';
D(:,2)= sqrt(C.*T2)';

PROESD = [PROES D];
%% 写入
   %将para的数字依次写入xls文件里面


        tepm = xlsread('3E3SSCORE.xlsx');
    if size(tepm,1) == 0%是否是空文档
        mRowRange = '1';
    else
        mRowRange = num2str(size(tepm,1)+1);%数组长度转化为字符串
    end
        bb = strcat('A', mRowRange);%这里的b代表上一次记录数据的行维度+1，永远不会重复记录了，每次都会记录到上一次结果的下一行
        xlswrite('F:\Master\MATLAB\zhuanti1\CGE\3E3SSCORE1.xlsx',PROESD,1,bb);
