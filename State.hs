module State (
    State(player, wumpus, ourGameMap),
    start
) where

import Player
import Wumpus
import Map

data State = State {
    player      :: Player,
    wumpus      :: Wumpus,
    ourGameMap  :: Map
}

start playerStart wumpusStart = State (Player playerStart 3) (Wumpus wumpusStart)
    where gameMap = getMap 20

areThePlayerAndTheWumpusAdjacent state = areTwoRoomsAdjacent (Player.room ourPlayer) (Wumpus.room ourWumpus) gameMap
    where
        ourPlayer = player state
        ourWumpus = wumpus state
        gameMap = ourGameMap state
