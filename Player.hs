module Player (
    Player(Player), room, alive,
    move, shoot
) where

import Map

data Player = Player {
    room        :: Room,
    numArrows   :: Int,
    alive       :: Bool
}

move newSpot player gameMap
    | areTwoRoomsAdjacent newSpot (room player) gameMap = Player newSpot (numArrows player) True
    | otherwise = error ("Cannot move into that room " ++ (show newSpot))

shoot spot player gameMap
    | areTwoRoomsAdjacent spot (room player) gameMap = Player (room player) (numArrows player - 1) True
    | otherwise = error "Cannot shoot into that room"
