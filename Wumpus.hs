module Wumpus (
    Wumpus(Wumpus), room, alive,
    wumpusIfShot, getMoveForWumpus 
) where

import Map
import Data.Random.Extras
import Data.Random
import Data.Random.Source.DevRandom

data Wumpus = Wumpus {
    room    :: Room,
    alive   :: Bool
}

move newSpot wumpus gameMap
    | areTwoRoomsAdjacent newSpot (room wumpus) gameMap = Wumpus newSpot
    | otherwise = error "Cannot move into that room"

getMoveForWumpus wumpus gameMap = runRVar (choice (getPossibleRooms gameMap (room wumpus))) DevRandom

wumpusIfShot wumpus givenRoom
    | room wumpus == givenRoom = Wumpus givenRoom False
    | otherwise = wumpus
