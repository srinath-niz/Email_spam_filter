clear,%clc

% addpath('data');
% addpath('data');

load data_train;
valsplit

tic;
lambda = 0.01;%0.001:0.005:0.01
for k=1:length(lambda)
    lm = lambda(k)
trainspamfilter(xTr,yTr,lm);
spamfilter(xTv,yTv,0.1);
end
toc;