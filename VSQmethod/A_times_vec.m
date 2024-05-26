function vout = A_times_vec(H, vin)
%
% vout = A_times_vec(H, vin)
%
% This computes vout = A*vin.  If A is a function handle, then we use the
% user-supplied function, which is passed as A. Otherwise, we use the
% mtimes * operator.
%


if isa(H, 'function_handle')
    transp_flag = 'notransp';
    vout = H(vin, transp_flag);
else
    vout = H*vin;
end