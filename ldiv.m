function funresult=ldiv(a,b,N)
%a numerator
%b denominator
%default order of the filter == 20
funresult=[];
if nargin < 3
    if nargin > 1
            N=20;
    else
            disp('Usage: M = ldiv(a,b,N)')
            disp('a:numerator , b denominator and N is the order of the resultant filter')
            return
    end 
end
if size(a) < 1
    disp('Error: numerator must at least have one element not empty')
    return
end
if size(b) < 1
    disp('Error: denominator must at least have one element not empty')
    return
end
if b(1)==0
    disp('Error: The first element of denominator must have nonzero value')
    return
end
if size(b) < 2
    funresult=a./b;
    for i =length(funresult)+1:N
       funresult(i)=0;
    end
    return
end
for i = length(a)+1:N
    a(i)=0;
end
for i = 1 : N
    funresult(i)=a(1)/b(1);
    if length(a)>1
            for k= 2:length(b)
                if k > length(a)
                    a(k)=0;
                end
                a(k)=a(k)-funresult(length(funresult))*b(k);
            end
        for i = 1:length(a)-1
                a(i)=a(i+1);
        end
        a=a(1:length(a)-1);
    end
end