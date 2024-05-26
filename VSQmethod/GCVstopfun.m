function G = GCVstopfun(alpha, u, s, beta, m, n)
%   
%  G = GCVstopfun(alpha, u, s, beta, n, insolv)
%  This function evaluates the GCV function G(i, alpha), that will be used 
%     to determine a stopping iteration.
%
% Input:
%   alpha - regularization parameter at the kth iteration of HyBR
%       u - P_k^T e_1 where P_k contains the left singular vectors of B_k
%       s - singular values of bidiagonal matrix B_k
%    beta - norm of rhs b
%     m,n - size of the ORIGINAL problem (matrix A)


k = length(s);
beta2 = beta^2;

s2 = abs(s) .^ 2;
alpha2 = alpha^2;
    
t1 = 1 ./ (s2 + alpha2);
t2 = abs(alpha2*u(1:k) .* t1) .^2;
t3 = s2 .* t1;

num = beta2*(sum(t2) + abs(u(k+1))^2)/n;
den = ( (m - sum(t3))/n )^2;
G = num / den;
