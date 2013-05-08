import State
import Map

gameLoop state = do
    putStrLn $ "[move/shoot] " ++ State.getPossibleRoomsStr state
    playerMove <- getLine
    return playerMove

main = do
    let myMap = Map.getMap 20
    startRoomForPlayer <- Map.getRandomPointOnMap myMap
    startRoomForWumpus <- Map.getRandomPointOnMap myMap
    let state = State.start startRoomForPlayer startRoomForWumpus myMap
    gameLoop state
    -- 1 for failure, because not finished :P
    putStr $ show 1
