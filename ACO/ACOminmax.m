
clc;

clear;

close all;



%% Problem Definition



model=CreateGraph();



%CostFunction=@(tour) TourLength(tour,model);



nVar=model.n;





%% ACO Parameters



MaxIt=200;      % Maximum Number of Iterations



nAnt=50;        % Number of Ants (Population Size)



Q=5;



tau0=0.99*Q/(nVar*mean(model.D(:)));	% Initial Phromone



alpha=0.98;        % Phromone Exponential Weight

beta=0.95;         % Heuristic Exponential Weight



rho=0.05;       % Evaporation Rate





%% Initialization



eta=(model.D);             % Heuristic Information Matrix



tau=tau0*ones(nVar,nVar);   % Pheromone Matrix



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

    % Moving the Ants

    for k=1:nAnt

        
        ant(k).Tour=1;

        st_node = [0 ones(1, nVar-2) 0];
        
        

        solcon = NodeSelection(tau, model.D, st_node, ant(k).Tour,alpha,beta, model.W);

        

        ant(k).Cost=PathCost(solcon,model);
        
        ant(k).Tour = solcon;

        

        if ant(k).Cost>BestSol.Cost

            BestSol=ant(k);

        end

        

    end

    

    % Update Pheromones using Min-Max

    for k=1:nAnt

        

        solcon=ant(k).Tour;

        solcon=[solcon solcon(1)]; %#ok

        for l=1:(length(solcon)-1)

            

            i=solcon(l);

            j=solcon(l+1);

            

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



