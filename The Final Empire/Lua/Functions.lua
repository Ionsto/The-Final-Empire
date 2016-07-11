-- Lua Script1
-- Author: sacha
-- DateCreated: 7/3/2016 12:00:38 AM
--------------------------------------------------------------
--Idea
--When a road is created check the location,if it is on a river, then add gold per turn for the civ
--When the road is destroyed, remove this extra gold per turn
--
--int hexX, int hexY, PlayerID player, int routeType
function AddRoad(hexX, hexY, player, routeType)
end
--int hexX, int hexY
function DestroyRoad(hexX,hexY)

end
function UpdateGold()

end
LuaEvents.SerialEventRoadCreated.Add(AddRoad);