module Map (
    Map, rooms, state,
    State, wumpus, player,
    Room, roomID, connectedRooms, getRoom
) where

import Player

data Map = Map {
    rooms :: [Room],
    state :: State
    }

data State = State {
    wumpus :: Wumpus,
    player :: Player
}

data Room = Room {
    roomID :: Int,
    connectedRooms :: [Int]
    }

type RoomID = Int
type RoomRoomsRelation = [Int]

instance Show Map where
    show ourMap = foldr withNewLines [] (reverse (map show (rooms ourMap)))
        where withNewLines acc str = str ++ acc ++ "\n"

getRoom :: Map -> Int -> Room
getRoom map n = rooms map !! (n + 1)

-- Room

instance Show Room where
    show room = show (roomID room) ++ ": " ++ show (connectedRooms room)

getAdjacentRoomIDs :: RoomID -> Map -> [RoomID] 
getAdjacentRoomIDs myID myMap = connectedRooms (rooms myMap !! (myID - 1))

-- Allows us to have dynamic map size generation in the future.
generateMapRelations :: Int -> [RoomRoomsRelation]
generateMapRelations 2 = [[1],[2]]
generateMapRelations 20 = [
    [2,5,8],
    [1,3,10],
    [2,4,12],
    [3,5,14],
    [1,4,6],
    [5,7,15],
    [6,8,17],
    [1,7,9],
    [8,10,18],
    [2,9,11],
    [10,12,19],
    [3,11,13],
    [12,14,20],
    [4,13,15],
    [6,14,16],
    [15,17,20],
    [7,16,18],
    [9,17,19],
    [11,18,20],
    [13,16,19]
    ]
generateMapRelations _ = error "Sorry bud, this is not implimented.  Please only use two or twenty"

getMap :: Int -> Map
getMap numRooms = Map [Room x (relations !! (x - 1)) | x <- [1..numRooms]] (State 0 0)
    where relations = generateMapRelations numRooms

-- Takes a Map and a State object, and sets the state
setMap :: Map -> State -> Map
setMap ourMap = Map (rooms ourMap)