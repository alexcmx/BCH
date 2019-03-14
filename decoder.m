function result = decoder(f,g,n,k)
[ch,ost] = delenie(f,g);
sdvig = 0;
l = length(f);
s = bchnumerr(n,k);% number of mistakes
w = weight(ost);
while w>s
%% сдвиг влево
f = [zeros(1,15-length(f)) f];
f = [f(2:end) f(1)];
f = delzer(f);
sdvig = sdvig + 1;
[ch,ost] = delenie(f,g);
w = weight(ost);
end
if(length(f)>length(ost))
    ost = [zeros(1, length(f)-length(ost)) ost];
end
f = f+ost;
f = [zeros(1,l-length(f)) f];
for i =1:sdvig
   f = [f(end) f(1:end-1)];
end
result = f(1:k);
end

function result = weight(a)
i = 0;
for j=a
    if j==1
        i = i+1;
    end
end
result = i;
end