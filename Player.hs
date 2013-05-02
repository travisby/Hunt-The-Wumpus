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

shoot spot player gameMap
    | isAdjacentToCreature spot (room player) gameMap = Player (room player) (numArrows player - 1)
    | otherwise = error "Cannot shoot into that room"
