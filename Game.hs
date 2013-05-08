import State
import Map

main = do
    let myMap = Map.getMap 20
    startRoomForPlayer <- Map.getRandomPointOnMap myMap
    startRoomForWumpus <- Map.getRandomPointOnMap myMap
    let state = State.start startRoomForPlayer startRoomForWumpus myMap

    putStr $ show 1
