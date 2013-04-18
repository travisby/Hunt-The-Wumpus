module Wumpus (
    Wumpus(Wumpus), location, wumpusStart
) where

data Wumpus = Wumpus {
    location :: Int
}

wumpusStart :: Wumpus
wumpusStart = Wumpus 0
