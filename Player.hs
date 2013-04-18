module Player(
    Player(Player), numAmmo, location, playerStart
) where 

data Player = Player {
    numAmmo :: Int,
    location :: Int
}

playerStart :: Player
playerStart = Player 3 0

-- smell
-- touch
-- hear

-- move
