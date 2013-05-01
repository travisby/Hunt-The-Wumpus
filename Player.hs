module Player (
    Player(Player), room
) where

import Map

data Player = Player {
    room        :: Room,
    numArrows   :: Int
}

move newSpot player gameMap
    | newSpot `elem` possibleRooms = Player (getRoom gameMap newSpot) (numArrows player)
    | otherwise = error "Cannot move into that room"
    where possibleRooms = connectedRooms (room player)
