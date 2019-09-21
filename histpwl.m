function out = histpwl(im,a,b,gamma)
N=length(a);
out = zeros(size(im));
lut = zeros(255);

%Preparing the LUT for all Gray scale values
for i=1:256
    newi = i-1;
    val = newi/255;
    for j=1:N-1
        if(val>=a(j)&&val<a(j+1))
           lut(i) =  power(((val-a(j))/(a(j+1)-a(j))),gamma)*(b(j+1)-b(j))+b(j);
           break
        else
            lut(i)=i;
        end
    end
end

%Creating the output image from LUT
for i=1:256
    pix = find(im==i-1);
    out(pix) = lut(i);
end
out = uint8(255*out);
end

