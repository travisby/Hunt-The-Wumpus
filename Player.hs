module Player (
    Player(Player), room
) where

import Map

data Player = Player {
    room        :: Room,
    numArrows   :: Int
}
