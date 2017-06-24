

function L=PathCost(tour,model)



    n=numel(tour);
    
    w = model.W;



    %tour=[tour tour(1)];

    

    L=0;

    for i=1:n

        L=L+w(tour(i));
        %disp(L);

    end



end