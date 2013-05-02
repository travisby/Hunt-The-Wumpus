module Wumpus (
    Wumpus(Wumpus), room
) where

import Map
import Data.Random.Extras

data Wumpus = Wumpus {
    room    :: Room
}

move newSpot wumpus gameMap
    | isAdjacentToCreature newSpot (room wumpus) gameMap = Wumpus newSpot
    | otherwise = error "Cannot move into that room"

getMoveForWumpus wumpus gameMap = safeChoice (getPossibleRooms gameMap (room wumpus))
