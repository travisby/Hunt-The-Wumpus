-- Map
data Map = Map {
    rooms :: [Room],
    state :: ()
    } deriving (Show)

getRoom :: Map -> Int -> Room
getRoom map n = rooms map !! (n + 1)

-- Room
data Room = Room {
    roomID :: Int
    }

instance Show Room where
    show room = show (roomRelations getMapRelations !! (roomID room + 1))

-- MapRoomRelation
data MapRoomRelation = MapRoomRelation  {
    roomRelations :: [[Int]]
    } deriving (Show)

-- Map Utilities
-- Allows us to have dynamic map size generation in the future.
generateMapRelations :: Int -> [[Int]]
generateMapRelations 2 = [[1],[2]]
generateMapRelations 20 = [
    [5,2,8],
    [1,3,10],
    [2,4,12],
    [3,5,14],
    [4,1,6],
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

-- Statically defined at twenty for now
getMapRelations :: MapRoomRelation
getMapRelations = MapRoomRelation $ generateMapRelations 20
