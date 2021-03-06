import State
import Map
import Wumpus


gameLoop state = do
    putStrLn $ State.playerSmell state
    putStrLn "[move/shoot] "
    playerMove <- getLine
    putStrLn $ "Room " ++ State.getPossibleRoomsStr state
    playerRoom <- getLine

    let newState = State.makeMoveFromStr playerMove playerRoom state
    

    maybeMovedWumpusPosition <- Wumpus.getMoveForWumpus (wumpus state) (ourGameMap state)
    let maybeNewWumpus = Wumpus maybeMovedWumpusPosition True

    let isThereAWinner = State.winning newState
    -- if ((==) isThereAWinner 0) and ((==) playerMove "shoot")
    if and [((==) isThereAWinner 0), ((==) playerMove "shoot")]
        -- get moved wumpus
        then gameLoop (State.State (player newState) maybeNewWumpus (ourGameMap newState))
    else if isThereAWinner == 0
        then gameLoop newState
    else if isThereAWinner == 1
        -- my way of exiting :P
        then error "You lost!"
    else if isThereAWinner == 2
        -- my way of exiting :P
        then error "Congratulations, you won!"
    else error "Woah that function was weird"


main = do
    let myMap = Map.getMap 20
    startRoomForPlayer <- Map.getRandomPointOnMap myMap
    startRoomForWumpus <- Map.getRandomPointOnMap myMap
    let state = State.start startRoomForPlayer startRoomForWumpus myMap
    gameLoop state
    -- 1 for failure, because not finished :P
    putStr $ show 1
