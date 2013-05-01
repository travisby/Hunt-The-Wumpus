module Wumpus (
    Wumpus(Wumpus), room
) where

import Map

data Wumpus = Wumpus {
    room    :: Room
}
