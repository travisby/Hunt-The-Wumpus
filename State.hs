module State (
) where

import Player
import Wumpus
import Map

data State = State {
    player  :: Player,
    wumpus  :: Wumpus,
    map     :: Map
}

start playerStart wumpusStart = State (Player playerStart 3) (Wumpus wumpusStart)
    where gameMap = getMap 20
