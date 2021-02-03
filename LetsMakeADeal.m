% Constants
totalGames = 800000;
numDoors = 3;

% Variables
door1 = 0;
door2 = 0;
door3 = 0;
totalWins = 0;

% Loop through and preform each game
for games=1 : totalGames

    % See what door is going to have the "car" (=1)
    doorWithCar = randi([1,3]);

    % Set door to have the "car"
    if(doorWithCar == 1)
        door1 = 1;
    elseif(doorWithCar==2)
        door2 = 1;
    else
        door3 = 1;
    end

    % Contestant then selects a door randomly
    origContestantSelectedDoor = randi([1,3]);

    % Game show host shows door that does not have "car"
    for i=1 : numDoors
        if( i ~= origContestantSelectedDoor && i ~= doorWithCar)
            doorShownToContestant = i;
        end    
    end

    % Switch contestant door to last reamining one
    for i=1 : numDoors
        if( i ~= origContestantSelectedDoor && i ~= doorShownToContestant)
            contestantSelectedDoor = i;
        end    
    end

    % Check if contestant won the "car"
    if(contestantSelectedDoor == doorWithCar)
        % Add win for this game to total win count
        totalWins = totalWins + 1;
    end
end

% Figure out win percentage
winPer = totalWins/totalGames;
winPer = winPer * 100;
    
% Display the information
fprintf('Total wins: %u \n', totalWins);
fprintf('Win Percentage: %.4f%% \n \n', winPer);
   