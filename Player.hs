module Player (
    Player(Player), room,
    move
) where

import Map

data Player = Player {
    room        :: Room,
    numArrows   :: Int
}

move newSpot player gameMap
    | isAdjacentToPlayer newSpot player gameMap = Player newSpot (numArrows player)
    | otherwise = error "Cannot move into that room"

isAdjacentToPlayer newRoom player gameMap = roomID newRoom `elem` possibleRooms
    where possibleRooms = connectedRooms (room player)
