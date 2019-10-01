function trainspamfilter(xTr,yTr,lm);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr
%
% NO OUTPUT

[d,n]=size(xTr);

% Feel free to change this code any way you want

%ridge 0.05 - 98.87

f=@(w) ridge(w,xTr,yTr,lm);
w0=zeros(size(xTr,1),1); % initialize with all-zeros vector
w=grdescent(f,w0,1e-3,10000,1e-8);

save('w1','w');


% func,w0,stepsize,maxiter,tolerance