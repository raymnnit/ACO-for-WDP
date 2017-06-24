D = csvread('adjacency.csv');

n = size(D,2);

path = [];

st_node = ones(1,n);

pos_loc=[];

%Picking any node at random from intial collection
while(sum(st_node)>0)
    
    pos_loc = find(st_node>0);
    
    disp(pos_loc);
    
    r = pos_loc(randsample(length(pos_loc),1));
    
    disp(r);
    
    path = [path r];
    
    %c = sum(pos_loc);

    %s1 = find(pos_loc<r,1,'first');

    androw = D(r,:);
    
    disp(androw);

    final_pos = st_node.*androw;
    
    disp(final_pos);

    %j = find(final_pos>0, 1, 'first');

    st_node = final_pos;


end
