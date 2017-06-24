D = [0 3 2 5 0;0 0 2 0 1;0 0 0 0 1;0 0 0 0 1;0 1 1 1 0];


%Starting Node
s = D(1,1);
n = size(D,2);
c=0;

%k = all(D(1,2:n-1));

%t = randi([2,n-1],1);

%sol = sol + D(1,t);

for i=2:n-1
    k = all(D(i-1,i:n-1));
    if(k > 0)
        t = randi([i,n-1]);
        c = c+D(i-1,t);
        disp(c);
    else
        c= c+ D(i-1,find(D(i-1,i:n-1),1,'first'));
        disp(c);
    end
end