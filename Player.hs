module Player(
    Player(Player), numAmmo, location, playerStart
) where 

data Player = Player {
    numAmmo :: Int,
    location :: Int
}

playerStart :: Player
playerStart = Player 3 0

smell gameMap player wumpus
    | 1 <= filter (==wumpusLocation) adjacentRooms  = "I smell something..."
    | otherwise = ""
    where
        wumpusLocation = location wumpus
        adjacentRooms = getAdjacentRoomIDs (location player) gameMap
-- smell
-- touch
-- hear

-- move
