module Wumpus (
    Wumpus(Wumpus), room
) where

import Map
import Data.Random.Extras

data Wumpus = Wumpus {
    room    :: Room
}

getMoveForWumpus wumpus gameMap = safeChoice (getPossibleRooms gameMap (room wumpus))
