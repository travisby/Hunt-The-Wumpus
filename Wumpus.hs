module Wumpus (
    Wumpus(Wumpus), room, alive
) where

import Map
import Data.Random.Extras

data Wumpus = Wumpus {
    room    :: Room,
    alive   :: Bool
}

move newSpot wumpus gameMap
    | isAdjacentToCreature newSpot (room wumpus) gameMap = Wumpus newSpot
    | otherwise = error "Cannot move into that room"

getMoveForWumpus wumpus gameMap = safeChoice (getPossibleRooms gameMap (room wumpus))
