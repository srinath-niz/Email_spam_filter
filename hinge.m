function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
b = 0;

sum=0;
grad1 =0;
for i=1:n
    px = 1 - yTr(i)*(w'*xTr(:,i) + b);
    px_m = max(px,0);
    sum = sum + px_m;
    
    gt = yTr(i)*w'*xTr(:,i);
    if gt < 1
        grad1 = grad1 - yTr(i)*xTr(:,i);
    else
        grad1 = grad1 + 0;
    end
end

loss = sum + lambda*w'*w;

gradient = grad1 + 2*lambda*w;