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
    | isAdjacentToCreature newSpot (room player) gameMap = Player newSpot (numArrows player)
    | otherwise = error "Cannot move into that room"
