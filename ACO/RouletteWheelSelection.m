
function j=RouletteWheelSelection(P, tour, model)

    %n=length(tour);

    r= (0.35)*rand(1,1);
    
    n=size(model,2);

    
    C=cumsum(P);

    
    j=find(r<C,1,'first');

    
    if((all(model(tour, j)) > 0))
        return;
    else if(j < n)
        j= tour(end) + find(model(tour(end)+1:n,j),1,'first');
        end
    end

end