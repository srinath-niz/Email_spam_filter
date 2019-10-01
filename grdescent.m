function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;


normd=100;
iter = 0;

wold = w0;
loss_old = 0;
while((iter<maxiter) && (normd>tolerance))
    iter = iter+1;
    
    [loss_new,grad] = func(wold);
    
    wn = wold - stepsize*(grad);
    normd = norm(wn-wold);
    
    if iter>1
        if (loss_old - loss_new)>0
            stepsize = 1.1*stepsize;
        else
            stepsize = 0.5*stepsize;
            
        end
        loss_old = loss_new;
    else
        loss_old = loss_new;
    end
    wold = wn;
end
w= wn;