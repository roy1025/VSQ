function vout = Atransp_times_vec(H, vin)
%
% This computes vout = H'*vin.  If H is a function handle, then we use the
% user-supplied function, which is passed as H. Otherwise, we use the
% mtimes * operator.
%


if isa(H, 'function_handle')
    transp_flag = 'transp';
    vout = H(vin, transp_flag);
else
    vout = H'*vin;
end