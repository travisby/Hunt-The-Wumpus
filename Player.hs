module Player (
    Player(Player), room, alive,
    move, shoot, smell
) where

import Map

data Player = Player {
    room        :: Room,
    numArrows   :: Int,
    alive       :: Bool
}

move newSpot player gameMap
    | areTwoRoomsAdjacent newSpot (room player) gameMap = Player newSpot (numArrows player) True
    | otherwise = error "Cannot move into that room "

shoot spot player gameMap
    | areTwoRoomsAdjacent spot (room player) gameMap = Player (room player) (numArrows player - 1) True
    | numArrows player <= 0 = error "You are out of ammo!"
    | otherwise = error "Cannot shoot into that room"

smell player roomWhereSmellIsComingFrom gameMap
    | areTwoRoomsAdjacent roomWhereSmellIsComingFrom (room player) gameMap = "You smell a Wumpus!"
    | otherwise = ""
