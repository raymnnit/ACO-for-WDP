
clc;

clear;

close all;



%% Problem Definition



model=CreateGraph();



CostFunction=@(tour) TourLength(tour,model);



nVar=model.n;





%% ACO Parameters



MaxIt=500;      % Maximum Number of Iterations



nAnt=70;        % Number of Ants (Population Size)



Q=1;



tau0=2*Q/(nVar*mean(model.D(:)));	% Initial Phromone



alpha=0.95;        % Phromone Exponential Weight

beta=0.85;         % Heuristic Exponential Weight



rho=0.05;       % Evaporation Rate





%% Initialization



eta=(model.D)./2;             % Heuristic Information Matrix



tau=tau0*ones(nVar,nVar);   % Phromone Matrix



BestCost=zeros(MaxIt,1);    % Array to Hold Best Cost Values



% Empty Ant

empty_ant.Tour=[];

empty_ant.Cost=[];



% Ant Colony Matrix

ant=repmat(empty_ant,nAnt,1);



% Best Ant

BestSol.Cost=0;





%% ACO Main Loop



for it=1:MaxIt

    

    % Move Ants

    for k=1:nAnt

        

        ant(k).Tour=1;

        

        while ant(k).Tour(end)< nVar

            
            i=ant(k).Tour(end);
            
            P=tau(i,:).^alpha.*eta(i,:).^beta;
            
            P(ant(k).Tour)=0;

            P=P/sum(P);

            j=RouletteWheelSelection(P, ant(k).Tour, model.D);

            ant(k).Tour=[ant(k).Tour j];
            
          

        end

        

        ant(k).Cost=CostFunction(ant(k).Tour);

        

        if ant(k).Cost>BestSol.Cost

            BestSol=ant(k);

        end

        

    end

    

    % Update Phromones

    for k=1:nAnt

        

        tour=ant(k).Tour;

        

        tour=[tour tour(1)]; %#ok

        

        for l=1:(length(tour)-1)

            

            i=tour(l);

            j=tour(l+1);

            

            tau(i,j)=tau(i,j)+Q/ant(k).Cost;

            

        end

        

    end

    

    % Evaporation

    tau=(1-rho)*tau;

    

    % Store Best Cost

    BestCost(it)=BestSol.Cost;

    

    % Show Iteration Information

    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);

    

    % Plot Solution

    %figure(1);

    %PlotSolution(BestSol.Tour,model);

    %pause(0.01);

    

end



%% Results



figure;

plot(BestCost,'LineWidth',2);

xlabel('Iteration');

ylabel('Best Cost');

grid on;



