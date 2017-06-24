

function L=TourLength(tour,model)



    n=numel(tour);
    
    w = model.W;
    disp(w);



    %tour=[tour tour(1)];

    

    L=0;

    for i=1:n

        L=L+w(path(i));

    end



end