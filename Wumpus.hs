module Wumpus (
    Wumpus(Wumpus), room, alive,
    wumpusIfShot
) where

import Map
import Data.Random.Extras

data Wumpus = Wumpus {
    room    :: Room,
    alive   :: Bool
}

move newSpot wumpus gameMap
    | areTwoRoomsAdjacent newSpot (room wumpus) gameMap = Wumpus newSpot
    | otherwise = error "Cannot move into that room"

getMoveForWumpus wumpus gameMap = safeChoice (getPossibleRooms gameMap (room wumpus))

wumpusIfShot wumpus givenRoom
    | room wumpus == givenRoom = Wumpus givenRoom False
    | otherwise = wumpus
