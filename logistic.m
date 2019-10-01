function [loss,gradient]=logistic(w,xTr,yTr,lambda)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

loss=0;
gradient = 0;
for i=1:n
    loss = loss + log(1 + exp(-yTr(i)*w'*xTr(:,i)));
    
    pr = -yTr(i)*w'*xTr(:,i);
    gradient = gradient + (exp(pr)*(-yTr(i)*xTr(:,i)))/(1 + exp(pr));
end

if nargin>3
    loss = loss + lambda*(norm(w))^2;
    gradient = gradient + 2*lambda*w;
end