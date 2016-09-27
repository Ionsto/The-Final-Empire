-- Lua Script1
-- Author: sacha
-- DateCreated: 7/3/2016 12:00:38 AM
--------------------------------------------------------------
--Idea
--When a road is created check the location,if it is on a river, then add gold per turn for the civ
--When the road is destroyed, remove this extra gold per turn
--
GoldPlayers = {};
for i = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
	if Players[i]:IsEverAlive() then
		GoldPlayers[i] = 0;
	end
end
--int hexX, int hexY, PlayerID player, int routeType
function AddRoad(hexX, hexY, player, routeType)
	local riverplot = (Map.GetPlot(hexX,hexY));
	if (riverplot:IsNEOfRiver()) then 
	GoldPlayers[player] += 1;
	end
end
--int hexX, int hexY
function DestroyRoad(hexX,hexY)
	local riverplot = (Map.GetPlot(hexX,hexY));
	if (riverplot:IsNEOfRiver()) then 
		GoldPlayers[Map.GetPlot(hexX,hexY).GetPlayer()] -= 1;
	end
end
function UpdateGold(player)
	Players[player].ChangeGold(GoldPlayers[player]);
end
LuaEvents.SerialEventRoadCreated.Add(AddRoad);
LuaEvents.SerialEventRoadDestroyed.Add(AddRoad);
GameEvents.PlayerDoTurn.Add(UpdateGold);