module State (
    State(State), wumpus, player, stateStart
) where

import Player
import Wumpus

data State = State {
    wumpus :: Wumpus,
    player :: Player
}

stateStart :: State
stateStart = State (Wumpus 0) (Player 0 0)
