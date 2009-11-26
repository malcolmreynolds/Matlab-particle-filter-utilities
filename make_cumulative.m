function wnew = make_cumulative(w);

len = length(w);
wnew = zeros(1,len);

for i=1:len,
  wnew(i) = sum(w(1:i));
end

