function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);


loss = 0;
gradient = 0;
for i=1:n
    loss = loss + (w'*xTr(:,i) - yTr(i))^2;
    
    gradient = gradient + 2*(w'*xTr(:,i) - yTr(i))*xTr(:,i);
end

loss = loss + lambda*(norm(w))^2;
gradient = gradient + 2*lambda*w;


% [loss,gradient]=logistic(w,xTr,yTr);
% loss = loss + lambda*(norm(w))^2;