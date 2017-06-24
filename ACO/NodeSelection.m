
function solcon=NodeSelection(tau, model, st, tour,alpha,beta, wt)

    pos_loc=[];
    
%Picking any node at random from intial collection
while(sum(st)>0)
    
    pos_loc = find((st.*tau(tour(end),:)>0));
    
    wt = wt./(sum(wt));
    
    %Weighted Decision on which node to take
    
    wpos=(tau(tour(end),:).^alpha).*(st.*wt).^beta;
    
    wpos = wpos(wpos~=0);
    
    wpos = wpos./(sum(wpos));
    
    %disp(wpos);
    
    i = randsample(length(wpos),1,true,wpos);
    
    %disp(i);
    
    %disp(['Possible Nodes ' num2str(pos_loc)]);
    
    r = pos_loc(i);
    
    %disp(['Chosen Node ' num2str(r)]);
    
    tour = [tour r];
    
    solcon = tour;
    
    %c = sum(pos_loc);

    %s1 = find(pos_loc<r,1,'first');

    androw = model(r,:);
    
    %disp(['Choices at chosen Node ' num2str(androw)]);

    final_pos = st.*androw;
    
    %disp(['Vector at chosen Node after AND Operation ' num2str(final_pos)]);

    %j = find(final_pos>0, 1, 'first');

    st = final_pos;

end

end