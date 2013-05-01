module Player (
    Player(Player)
) where

import Map

data Player = Player {
    roomID      :: Int,
    numArrows   :: Int
}
