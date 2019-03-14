[a, b] = delenie([1 1 1 0 0 1 1 0 1 1 0 1 1 0 1],[1 1 1 0 1 0 0 0 1]);

fprintf("Частное = ");
fprintf("%d",a);
fprintf("\nОстаток = ");
fprintf("%d",b);
fprintf("\n");

function [chastnoe ostatok] = delenie(f,s)
ch = [];
ost = [];
while length(f)>=length(s)
     ch(length(f)-length(s)+1)=1;
     v = [s zeros(1,length(ch)-1)];
     ost = f - v;
     ost = delzer(ost);
     ost = abs(ost);
     while length(ost)>=length(s)
        ch(length(ost)- length(s)+1)=1;
        
        ost = ost - [s zeros(1,length(ost)- length(s))];
        ost = delzer(ost);
        ost = abs(ost);
     end
     f = ost;
end
chastnoe = rot90(rot90(ch));
ostatok = ost;
end


function rez = delzer(a)
j = 1;
for i=a
    if i==0
        j = j+1;
    else
        break;
    end
end
rez = [a(j:end)];
end