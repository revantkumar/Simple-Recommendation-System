function [ U, V ] = myRecommender( rateMatrix, lowRank )
    % Please type your name here:
    name = 'Kumar, Revant';
    disp(name); % Do not delete this line.

    % Parameters
    maxIter = 450; % Choose your own.
    learningRate = 0.0003; % Choose your own.
    regularizer = 0.03; % Choose your own.
    
    % Random initialization:
    [n1, n2] = size(rateMatrix);
    U = rand(n1, lowRank) / lowRank;
    V = rand(n2, lowRank) / lowRank;

    % Gradient Descent:
    
    % IMPLEMENT YOUR CODE HERE.
    
    limit = 10e-3;    
    F = limit + 1;
    iterations = 1;    
    
    while (F > limit && iterations <= maxIter)   
        
        derivativesU = (1-2*learningRate*regularizer)*U + 2*learningRate*((rateMatrix - U*V').*(rateMatrix > 0))*V;
        derivativesV = (1-2*learningRate*regularizer)*V + 2*learningRate*(((rateMatrix - U*V').*(rateMatrix > 0))')*U;
        U = derivativesU;
        V = derivativesV;
        learningRate = learningRate -  0.0000002;
        if mod(iterations,100) == 0
            regularizer = regularizer + 0.002;
        end
        
        F = sum(sum(((U*V' - rateMatrix).*(rateMatrix > 0)).^2)); 
        iterations = iterations + 1;        
        
    end     
end