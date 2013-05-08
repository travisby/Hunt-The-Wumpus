module State (
    State(player, wumpus, ourGameMap, State),
    start,
    getPossibleRoomsStr,
    winning, makeMoveFromStr, playerSmell
) where

import Player
import Wumpus
import Map

data State = State {
    player      :: Player,
    wumpus      :: Wumpus,
    ourGameMap  :: Map
}

start playerStart wumpusStart = State (Player playerStart 3 True) (Wumpus wumpusStart True)
    where gameMap = getMap 20

areThePlayerAndTheWumpusAdjacent state = areTwoRoomsAdjacent (Player.room ourPlayer) (Wumpus.room ourWumpus) gameMap
    where
        ourPlayer = player state
        ourWumpus = wumpus state
        gameMap = ourGameMap state

getPossibleRooms state = Map.getPossibleRooms (ourGameMap state) (Player.room (player state))

getPossibleRoomsStr state = show (map Map.roomID (State.getPossibleRooms state))

-- Wow, this is a horrible function...
-- 0 if no winner, 1 if Wumpus wins, 2 if Player Wins...
winning state
    | not (Player.alive (player state)) = 1
    | not (Wumpus.alive (wumpus state)) = 2
    | otherwise = 0

makeMoveFromStr "shoot" roomNum state = State newPlayer newWumpus (ourGameMap state)
    where
        newPlayer = Player.shoot theRoom (player state) theMap
        newWumpus = Wumpus.wumpusIfShot (wumpus state) theRoom
        theRoom = Map.getRoom theMap (read roomNum :: Int)
        theMap = ourGameMap state
makeMoveFromStr "move" roomNum state = State myPlayer (wumpus state) (ourGameMap state)
    where
        newPlayer = Player.move theRoom (player state) theMap
        myPlayer = if (Player.room newPlayer) == (Wumpus.room theWumpus) then (Player (Player.room newPlayer) (Player.numArrows newPlayer) False) else newPlayer
        theRoom = Map.getRoom theMap (read roomNum :: Int)
        theMap = ourGameMap state
        theWumpus = wumpus state

makeMoveFromStr _ _ _ = error "That was not a valid move!"

playerSmell state = Player.smell (player state) (Wumpus.room (wumpus state)) (ourGameMap state)
