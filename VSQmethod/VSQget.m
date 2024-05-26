function val = VSQget(options,name,value,flag)
%VSQget Get options for VSQ Tools functions



% Fast access with no error checking.
if (nargin == 4) && isequal(flag,'fast')
    val = VSQgetfast(options,name,value);
    return
end

if nargin < 2
    error('Not enough input arguments.');
end
if nargin < 3
    value = [];
end

if ~isempty(options) && ~isa(options,'struct')
    error('First argument must be an options structure created with VSQset.');
end

if isempty(options)
    val = value;
    return;
end
allfields = VSQoption_fields;
  
Names = allfields;

name = deblank(name(:)'); % Force this to be a row vector.
j = find(strncmpi(name,Names,length(name)));
if isempty(j)             % If no matches.
    error(['Unrecognized property name ''%s''.  ' ...
           'See VSQset for possibilities.'], name);
elseif length(j) > 1      % If more than one match.
    % Check for any exact matches (in case any names are subsets of others).
    k = find(strcmpi(name,Names));
    if length(k) == 1
        j = k;
    else
        error('Ambiguous property name ''%s'' ', name);
    end
end

if any(strcmp(Names,Names{j,:}))
    val = options.(Names{j,:});
    if isempty(val)
        val = value;
    end
else
    val = value;
end

%------------------------------------------------------------------
function value = VSQgetfast(options,name,defaultopt)
%VSQGETFAST- Get VSQ OPTIONS parameter with no error checking.
%   VAL = VSQGETFAST(OPTIONS,FIELDNAME,DEFAULTOPTIONS) will get the
%   value of the FIELDNAME from OPTIONS with no error checking or
%   fieldname completion. If the value is [], it gets the value of the
%   FIELDNAME from DEFAULTOPTIONS, another OPTIONS structure which is
%   probably a subset of the options in OPTIONS.

if isempty(options)
     value = defaultopt.(name);
     return;
end
% We need to know if name is a valid field of options, but it is faster
% to use a try-catch than to test if the field exists and if the field name
% is correct.
try
    value = options.(name);
catch
    value = [];
end

if isempty(value)
    value = defaultopt.(name);
end