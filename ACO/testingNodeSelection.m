A = [0,1,0,1,1];

w = [1.3, 0.7, 0.01, 2, 1.3];

posloc = find(A.*w >0);

wt = A.*w;

wt = wt(wt~=0);

wt = wt./(sum(wt));

[v, i] = max(wt);

r = posloc(i);

%i = A(randsample(length(posloc),1,true,wt));