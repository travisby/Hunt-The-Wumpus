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
    | isAdjacentToCreature newSpot (room player) gameMap = Player newSpot (numArrows player)
    | otherwise = error "Cannot move into that room"

shoot spot player gameMap
    | isAdjacentToCreature spot (room player) gameMap = Player (room player) (numArrows player - 1)
    | otherwise = error "Cannot shoot into that room"
