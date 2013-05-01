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
