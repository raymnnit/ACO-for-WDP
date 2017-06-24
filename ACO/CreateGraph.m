

function model=CreateGraph()
    D = csvread('t8f.csv');
    
    W = csvread('w8f.csv');

    n=size(D,2);



    x=[82 91 12 92 63 9 28 55 96 97 15 98 96 49 80 14 42 92 80 96 99];

    

    y=[66 3 85 94 68 76 75 39 66 17 71 3 27 4 9 83 70 32 95 3 5];

    

    %n=numel(x);
    
    
    %
    

    %D=zeros(n,n);

    

    %

    

    model.n=n;

    model.x=x;

    model.y=y;

    model.D=D;
    
    model.W=W;



end