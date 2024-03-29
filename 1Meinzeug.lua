util.require_natives("natives-1681379138", "g-uno")
util.require_natives("2944b", "g")
local response = false
local localVer = 0.46
local currentVer
async_http.init("raw.githubusercontent.com", "/TheaterChaos/Mein-zeug/main/Meinzeugversion", function(output)
    currentVer = tonumber(output)
    response = true
    if localVer ~= currentVer then
        util.toast("Neue version ist verfügbar lad sie dir mit Update lua runter. Deine Version: "..localVer.." Neue Version: ".. currentVer )
        menu.action(menu.my_root(), "Update Lua", {}, "", function()
            async_http.init('raw.githubusercontent.com','/TheaterChaos/Mein-zeug/main/1Meinzeug.lua',function(a)
                local err = select(2,load(a))
                if err then
                    util.toast("Script failed to download. Please try again later. If this continues to happen then manually update via github.")
                return end
                local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH, "wb")
                f:write(a)
                f:close()
			end)
			async_http.dispatch()
			util.yield(1000)

			async_http.init('raw.githubusercontent.com','/TheaterChaos/Mein-zeug/main/Alltabels.lua',function(b)
				local err = select(2,load(b))
				if err then
					util.toast("ALLtabels.lua failed to download. Please try again later. If this continues to happen then manually update via github.")
				return end
				local f = io.open(filesystem.resources_dir() .. 'alltabels.lua', "wb")
				f:write(b)
				f:close()
				util.toast("Successfully updated Selfmade. Restarting Script... :)")
				util.restart_script()
			end)
			async_http.dispatch()  
			util.yield(1000)
        end)
    end
end, function() response = true end) 
async_http.dispatch()
repeat 
    util.yield()
until response


--require ('resources/Alltabels')

--local resource_dir = filesystem.resources_dir()
--if not filesystem.exists(resource_dir) then
--	util.toast("resource directory not found. notification system will be less of a bruh")
--else
--	util.register_file(resource_dir .. "bruhzowski.ytd")
--end

-- Functions and infos

local int_min = -2147483647
local int_max = 2147483647

local a = 1
local bba = 10
local abb = 10


vehenterstealnpc = false
vehentersteal = false

INTERIOR_IDS = {
	pentGarage = 275457,
	casino = 275201,
	casinoGarage = 274945,
	beeker = 179457,
	lsCarMeet = 285697,
	lsCarMeet2 = 286209,
	benny = 196609,
	barber = 165377,
	barber2 = 198657,
	barber3 = 171009,
	barber4 = 199937,
	barber5 = 140545,
	barber6 = 180225,
	barber7 = 155905,
	vehWarehouse = 290817,
	ammuNation = 248065,
	ammuNation2 = 153857,
	ammuNation3 = 168193,
	ammuNation4 = 200961,
	ammuNation5 = 164609,
	ammuNation6 = 137729,
	ammuNation7 = 140289,
	ammuNation8 = 180481,
	ammuNation9 = 178689,
	ammuNation10 = 176385,
	ammuNation11 = 175617,
	lsc = 234753,
	lsc2 = 164353,
	lsc3 = 201729,
	lsc4 = 153601,
	twoCarGarage = 149249,
	sixCarGarage = 148737,
	tenCarGarage = 146433,
	fiftyCarGarage = 290561,
	eclipseTowers = 230657,
	lombank = 255745,
	lombank2 = 255489,
	lombank3 = 256001,
	lombank4 = 241921,
	lombank5 = 256257,
	arcadius = 253441,
	arcadius2 = 237313,
	arcadius3 = 253697,
	arcadius4 = 253953,
	arcadius5 = 254209,
	mazeTower = 239617,
	mazeTower2 = 254465,
	mazeTower3 = 254721,
	mazeTower4 = 254977,
	mazeTower5 = 255233,
	mazeBuilding = 244225,
	mazeBuilding2 = 256513,
	mazeBuilding3 = 256769,
	mazeBuilding4 = 257025,
	mazeBuilding5 = 257281,
	apart = 206081,
	apart2 = 206337,
	apart3 = 206593,
	apart4 = 149761,
	apart5 = 148225,
	delPerro = 145409,
	delPerro2 = 145921,
	delPerro3 = 145665,
	fourWay = 147201,
	fourWay2 = 141313,
	fourWay3 = 147969,
	docForgery = 246785,
	methLab = 247041,
	weedFarm = 247297,
	counterfeitCash = 247809,
	cocaineLockup = 247553,
	yacht = 213249,
	yacht2 = 212737,
	yacht3 = 212225,
	hangar = 260353,
	strip = 197121,
	tattoo = 199425,
	tattoo2 = 140033,
	tattoo3 = 180737,
	tattoo4 = 180737,
	tattoo5 = 251137,
	tattoo6 = 176897,
	alta = 141825,
	alta2 = 141569,	            richards = 142849,
	richards2 = 143361,
	richards3 = 146177,
	weazel = 143617,
	weazel2 = 143105,
	weazel3 = 142593,
	clothes = 165633,
	clothes2 = 235265,
	clothes3 = 166145,
	clothes4 = 140801,
	clothes5 = 176129,
	clothes6 = 169217,
	clothes7 = 201473,
	clothes8 = 171265,
	clothes9 = 137217,
	clothes10 = 198145,
	clothes11 = 183553,
	clothes12 = 175361,
	clothes13 = 179713,
	clothes14 = 202497
}
INTERIOR_COORDS = {	            kosatkaMissile = {1558.553, 1558.653, 387.213, 388.713, -200, 0},
	kosatka = {1553, 1568, 361, 452, -200, 0},
	pentGarage = {1248, 1315, 2218, 264, -200, 0},
	musicLocker = {1537, 1583, 233, 263, -200, 0},
	casino = {1082, 1168, 191, 286, -200, 0},
	casinoGarage = {1333, 1413, 178, 259, -200, 0},
	eclipseTowers = {-824, -738, 295, 363, 107, 230},
	autoShop = {-1369, -1318.5, 134.5, 170.5, -200, 0},
	subMission = {511, 517, 4816, 4906, -200, 0},
	facility = {310, 511, 4755, 4885, -200, 0},
	avenger = {504, 535, 4744, 4756, -200, 0},
	beeker = {98, 115, 6613, 6631, 0, 35},
	penthouse = {932, 994, -3, 84, 0, 120},
	arcade = {2673, 2744, -403, -348, -200, 0},
	docForgery = {1155, 1175, -3201, -3188, -200, 0},
	mcClub = {1093, 1128, -3180, -3137, -200, 0},
	counterfeitCash = {1113, 1141, -3200, -3191, -200, 0},
	vehWarehouse = {926.5, 1014.5, -3039.5, -2985, -200, 0},
	vehWarehouse2 = {553, 576.51, -456.60, -402.20, -200, 0},
	methLab = {995, 1019, -3204, -3191, -200, 0},
	cocaineLockup = {1084, 1104, -3201, -3185, -200, 0},
	weedFarm = {1029, 1068, -3210, -3178, -200, 0},
	moc = {1097, 1109, -3014, -2990, -200, 0},
	twoCarGarage = {168, 180, -1009, -999, -200, -90},
	sixCarGarage = {189, 208, -1008, -993, -200, -90},
	tenCarGarage = {216, 242, -1010, -961, -200, 0},
	fiftyCarGarage = {510, 533, -2640, -2599, -200, 0},
	bunker = {822, 955, -3253, -3061, -200, 0},
	fib = {74, 193, -797, -699, 40, 262},
	agency = {345, 407, -98, -32, 70, 122},
	agency2 = {-1047, -987, -795, -708, 26, 76},
	agency3 = {-1042, -992, -447, -404, 42, 77},
	agency4 = {-610, -568, -727, -704, 37, 129},
	agencyGarage = {-1084, -1058, -93, -60, -200, 40},
	lsc = {1172, 1189, 2635, 2644, 0, 43},
	lsc2 = {723, 738, -1094, -1064, 0, 30},
	lsc3 = {-355, -319, -147, -121, 0, 44},
	lsc4 = {-1170, -1139, -2026, -2007, 0, 18},
	mazeTower = {-118, -29, -868, -773, 0, 320},
	hangar = {-1308, -1225, -3073, -2956, -200, 0},
	nightclub = {-1648, -1564, -3022, -2983, -200, 0},
	nightclubBasement = {-1526, -1480, -3048, -2960, -200, 0},
	mazeBuilding = {-1421, -1328, -511, -440, 0, 84},
	terrorbyte = {-1426, -1416, -3019, -3006, -200, 0},
	benny = {-228.2, -195.2, -1334.2, -1314.1, 0, 39},
	lombank = {-1595, -1549, -592, -550, 0, 114},
	arcadius = {-200, -118, -650, -560, 34, 176},
	apart = {323, 347, 420, 445, 0, 152},
	apart2 = {323, 381, 400, 445, 0, 150},
	apart3 = {112, 127, 540, 572, 0, 188},
	apart4 = {254, 267, -1005, -994, -200, 0},
	apart5 = {337, 353, -1004, -992, -200, 0},
	ammuNation = {807, 828, -2165, -2148, 0, 35},
	ammuNation2 = {838, 847, -1036, -1024, 0, 33},
	ammuNation3 = {-667, -658, -945, -931, 0, 25},
	ammuNation4 = {1688, 1702, 3751.5, 3764, 0, 39},
	ammuNation5 = {-1315, -1302, -398, -387, 0, 38},
	ammuNation6 = {3, 25, -1116, -1095, 0, 38},
	ammuNation7 = {243, 256, -54, -43, 0, 74},
	ammuNation8 = {-336, -322, 6075, 6088, 0, 34},
	ammuNation9 = {2565, 2573, 290, 304, 0, 114},
	ammuNation10 = {-3176, -3163, 1081, 1091, 0, 25},
	ammuNation11 = {-1123, -1110, 2690, 2702, 0, 22},
	delPerro = {-1483, -1434, -573, -509, 40, 84},
	fourWay = {-52, -2, -607, -569, 40, 106},
	lsCarMeet = {-2224, -2140, 1071, 1161, -200, 0},
	lsCarMeet2 = {-2224, -1835, 970, 1250, 24, 30},
	strip = {92, 138, -1307, -1277, 28, 32},
	barber = {-825.1, -807, -191.3, -179, 37, 40},
	barber2 = {132.5, 142, -1714.1, -1703, 29, 35},
	barber3 = {-1289, -1277, -1120, -1115, 6, 10},
	barber4 = {1928, 1937, 3725, 3736, 32, 36},
	barber5 = {-37, -29, -157, -146, 57, 66},
	barber6 = {-284.2, -274, 6223, 6233, 31, 37},
	barber7 = {1206, 1217, -477, -469, 66, 78},
	tattoo = {1860, 1867, 3744, 3752, 32, 36},
	tattoo2 = {319, 327, 178, 187, 103, 127},
	tattoo3 = {-297, -289, 6196, 6203, 31, 34},
	tattoo4 = {-1158, -1148, -1430, -1422, 4, 11},
	tattoo5 = {1319, 1329, -1657, -1649, 52, 57},
	tattoo6 = {-3176, -3167, 1072, 1080, 20, 25},
	alta = {-291, -252, -971, -937, 70, 100},
	tinsel = {-630, -571, 36, 72, 50, 115},
	richards = {-937, -893, -392, -359, 75, 116},
	weazel = {-923, -875, -469, -420, 85, 128},
	clothes = {-721, -699, -165, -145, 37, 40},
	clothes2 = {-172, -154, -315, -293, 39, 43},
	clothes3 = {-1462, -1443, -247, -225, 49, 52},
	clothes4 = {116, 133, -235, -206, 54, 57},
	clothes5 = {-3181, -3161, 1033, 1061, 20, 23},
	clothes6 = {-1207, -1180, -784, -763, 17, 20},
	clothes7 = {612, 624, 2747, 2776, 41, 45},
	clothes8 = {-832, -814, -1084, -1066, 11, 15},
	clothes9 = {418, 432, -813, -798, 29, 35},
	clothes10 = {69, 83, -1401, -1386, 29, 34},
	clothes11 = {1686, 1700, 4716, 4831, 41, 45},
	clothes12 = {-1111, -1093, 2700, 2718, 18, 22},
	clothes13 = {-4, 14, 6505, 6523, 31, 36},
	clothes14 = {1188, 1203, 2703, 2716, 38, 41},
	masks = {-1340.5, -1334, -1284, -1274, 4, 5},
	cayoPerico = {3500, 5950, -6300, -3990},
	ussLex = {2990, 3130, -4830, -4510},
	arena = {147, 233, 5155, 5218}
}
LANGUAGES = {
	[0] = "EN",
	[1] = "FR",
	[2] = "DE",
	[3] = "IT",
	[4] = "ES",
	[5] = "BR",
	[6] = "PL",
	[7] = "RU",
	[8] = "KR",
	[9] = "CN",
	[10] = "JP",
	[11] = "MX",
	[12] = "CN"
}
local EXPLOSIONVARIATION = {
    {1, "GRENADE", {}, ""},
    {2, "GRENADELAUNCHER", {}, ""},
    {3, "STICKYBOMB", {}, ""},
    {4, "MOLOTOV", {}, ""},
    {5, "ROCKET", {}, ""},
    {6, "TANKSHELL", {}, ""},
    {7, "HI_OCTANE", {}, ""},
    {8, "CAR", {}, ""},
    {9, "PLANE", {}, ""},
    {10, "PETROL_PUMP", {}, ""},
    {11, "BIKE", {}, ""},
    {12, "DIR_STEAM", {}, ""},
    {13, "DIR_FLAME", {}, ""},
    {14, "DIR_WATER_HYDRANT", {}, ""},
    {15, "DIR_GAS_CANISTER", {}, ""},
    {16, "BOAT", {}, ""},
    {17, "SHIP_DESTROY", {}, ""},
    {18, "TRUCK", {}, ""},
    {19, "BULLET", {}, ""},
    {20, "SMOKEGRENADELAUNCHER", {}, ""},
    {21, "SMOKEGRENADE", {}, ""},
    {22, "BZGAS", {}, ""},
    {23, "FLARE", {}, ""},
    {24, "GAS_CANISTER", {}, ""},
    {25, "EXTINGUISHER", {}, ""},
    {26, "PROGRAMMABLEAR", {}, ""},
    {27, "TRAIN", {}, ""},
    {28, "BARREL", {}, ""},
    {29, "PROPANE", {}, ""},
    {30, "BLIMP", {}, ""},
    {31, "DIR_FLAME_EXPLODE", {}, ""},
    {32, "TANKER", {}, ""},
    {33, "PLANE_ROCKET", {}, ""},
    {34, "VEHICLE_BULLET", {}, ""},
    {35, "GAS_TANK", {}, ""},
    {36, "BIRD_CRAP", {}, ""},
    {37, "RAILGUN", {}, ""},
    {38, "BLIMP2", {}, ""},
    {39, "FIREWORK", {}, ""},
    {40, "SNOWBALL", {}, ""},
    {41, "PROXMINE", {}, ""},
    {42, "VALKYRIE_CANNON", {}, ""},
    {43, "AIR_DEFENCE", {}, ""},
    {44, "PIPEBOMB", {}, ""},
    {45, "VEHICLEMINE", {}, ""},
    {46, "EXPLOSIVEAMMO", {}, ""},
    {47, "APCSHELL", {}, ""},
    {48, "BOMB_CLUSTER", {}, ""},
    {49, "BOMB_GAS", {}, ""},
    {50, "BOMB_INCENDIARY", {}, ""},
    {51, "BOMB_STANDARD", {}, ""},
    {52, "TORPEDO", {}, ""},
    {53, "TORPEDO_UNDERWATER", {}, ""},
    {54, "BOMBUSHKA_CANNON", {}, ""},
    {55, "BOMB_CLUSTER_SECONDARY", {}, ""},
    {56, "HUNTER_BARRAGE", {}, ""},
    {57, "HUNTER_CANNON", {}, ""},
    {58, "ROGUE_CANNON", {}, ""},
    {59, "MINE_UNDERWATER", {}, ""},
    {60, "ORBITAL_CANNON", {}, ""},
    {61, "BOMB_STANDARD_WIDE", {}, ""},
    {62, "EXPLOSIVEAMMO_SHOTGUN", {}, ""},
    {63, "OPPRESSOR2_CANNON", {}, ""},
    {64, "MORTAR_KINETIC", {}, ""},
    {65, "VEHICLEMINE_KINETIC", {}, ""},
    {66, "VEHICLEMINE_EMP", {}, ""},
    {67, "VEHICLEMINE_SPIKE", {}, ""},
    {68, "VEHICLEMINE_SLICK", {}, ""},
    {69, "VEHICLEMINE_TAR", {}, ""},
    {70, "SCRIPT_DRONE", {}, ""},
    {71, "RAYGUN", {}, ""},
    {72, "BURIEDMINE", {}, ""},
    {73, "SCRIPT_MISSILE", {}, ""},
    {74, "RCTANK_ROCKET", {}, ""},
    {75, "BOMB_WATER", {}, ""},
    {76, "BOMB_WATER_SECONDARY", {}, ""},
    {77, "EXP_TAG_MINE_CNCSPIKE", {}, ""},
    {78, "EXP_TAG_BZGAS_MK2", {}, ""},
    {79, "FLASHGRENADE", {}, ""},
    {80, "STUNGRENADE", {}, ""},
    {81, "EXP_TAG_CNC_KINETICRAM", {}, ""},
    {82, "SCRIPT_MISSILE_LARGE", {}, ""},
    {83, "SUBMARINE_BIG", {}, ""},
    {84, "EMPLAUNCHER_EMP", {}, ""}
}

local menus = {}

    local function getNonWhitelistedPlayers(whitelistListTable, whitelistGroups, whitelistedName)
        local playerList = players.list()
        local notWhitelisted = {}
        for i = 1, #playerList do
            if not (players.get_name(playerList[i]) == whitelistedName) then
                notWhitelisted[#notWhitelisted + 1] = playerList[i]
            end
        end
        return notWhitelisted
    end

local function get_friend_count()
    native_invoker.begin_call();native_invoker.end_call("203F1CFD823B27A4");
    return native_invoker.get_return_value_int();
end
local function get_frined_name(friendIndex)
   native_invoker.begin_call();native_invoker.push_arg_int(friendIndex);native_invoker.end_call("4164F227D052E293");return native_invoker.get_return_value_string();
end

function getVehicle(ped)
	return IS_PED_SITTING_IN_ANY_VEHICLE(ped) and GET_VEHICLE_PED_IS_IN(ped, false)
end

function getTargetVehicleData(entity)
	local vehicle = GET_VEHICLE_INDEX_FROM_ENTITY_INDEX(entity)
	local driver = GET_PED_IN_VEHICLE_SEAT(vehicle, -1, true)
	local player = NETWORK_GET_PLAYER_INDEX_FROM_PED(driver)
	local result = {}
	result.vehicle = vehicle
	result.driver = driver
	result.player = player
	return result
end

function setVehiclePlate(vehicle, text)
	if text and text:len() > 0 then
		SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, text)
	end
end

local minimum = memory.alloc()
local maximum = memory.alloc()
function getDimensions(entity)
	GET_MODEL_DIMENSIONS(GET_ENTITY_MODEL(entity), minimum, maximum)
	local minimum_vec = v3.new(minimum)
	local maximum_vec = v3.new(maximum)
	local dimensions = {
		x = maximum_vec.y - minimum_vec.y,
		y = maximum_vec.x - minimum_vec.x,
		z = maximum_vec.z - minimum_vec.z
	}
	return dimensions
end

local colorR, colorG, colorB = memory.alloc(1), memory.alloc(1), memory.alloc(1)
function copyVehicleData(vehicle, cloneVehicle)
	SET_VEHICLE_MOD_KIT(cloneVehicle, 0)
	for i = 17, 22 do
		TOGGLE_VEHICLE_MOD(cloneVehicle, i, IS_TOGGLE_MOD_ON(vehicle, i))
	end
	for i = 0, 49 do
		local modValue = GET_VEHICLE_MOD(vehicle, i)
		SET_VEHICLE_MOD(cloneVehicle, i, modValue)
	end
	if GET_IS_VEHICLE_PRIMARY_COLOUR_CUSTOM(vehicle) then
		GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, colorR, colorG, colorB)
		SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	else
		GET_VEHICLE_MOD_COLOR_1(vehicle, colorR, colorG, colorB)
		SET_VEHICLE_MOD_COLOR_1(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	end
	if GET_IS_VEHICLE_SECONDARY_COLOUR_CUSTOM(vehicle) then
		GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, colorR, colorG, colorB)
		SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	else
		GET_VEHICLE_MOD_COLOR_2(vehicle, colorR, colorG)
		SET_VEHICLE_MOD_COLOR_2(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG))
	end
	GET_VEHICLE_COLOURS(vehicle, colorR, colorG)
	SET_VEHICLE_COLOURS(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG))
	GET_VEHICLE_EXTRA_COLOURS(vehicle, colorR, colorG)
	SET_VEHICLE_EXTRA_COLOURS(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG))
	GET_VEHICLE_EXTRA_COLOUR_5(vehicle, colorR)
	GET_VEHICLE_EXTRA_COLOUR_6(vehicle, colorG)
	SET_VEHICLE_EXTRA_COLOUR_5(cloneVehicle, memory.read_ubyte(colorR))
	SET_VEHICLE_EXTRA_COLOUR_6(cloneVehicle, memory.read_ubyte(colorG))
	GET_VEHICLE_TYRE_SMOKE_COLOR(vehicle, colorR, colorG, colorB)
	SET_VEHICLE_TYRE_SMOKE_COLOR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	GET_VEHICLE_NEON_COLOUR(vehicle, colorR, colorG, colorB)
	SET_VEHICLE_NEON_COLOUR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	for i = 0, 3 do
		SET_VEHICLE_NEON_ENABLED(cloneVehicle, i, GET_VEHICLE_NEON_ENABLED(vehicle, i))
	end
	local windowTint = GET_VEHICLE_WINDOW_TINT(vehicle)
	SET_VEHICLE_WINDOW_TINT(cloneVehicle, windowTint)
	local lightsColor = GET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle)
	SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(cloneVehicle, lightsColor)
	SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(cloneVehicle, GET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle))
	setVehiclePlate(cloneVehicle, GET_VEHICLE_NUMBER_PLATE_TEXT(vehicle))
	SET_VEHICLE_TYRES_CAN_BURST(cloneVehicle, GET_VEHICLE_TYRES_CAN_BURST(vehicle))
	SET_VEHICLE_DIRT_LEVEL(cloneVehicle, GET_VEHICLE_DIRT_LEVEL(vehicle))
	for i = 1, 14 do
		SET_VEHICLE_EXTRA(cloneVehicle, i, not IS_VEHICLE_EXTRA_TURNED_ON(vehicle, i))
	end
	local roofState = GET_CONVERTIBLE_ROOF_STATE(vehicle)
	if roofState == 1 or roofState == 2 then
		LOWER_CONVERTIBLE_ROOF(cloneVehicle, true)
	end
	SET_VEHICLE_ENGINE_ON(cloneVehicle, GET_IS_VEHICLE_ENGINE_RUNNING(vehicle), true, true)
end
function clonevehicle(vehicle)
	local vehicleHeading = GET_ENTITY_HEADING(vehicle)
	local vehicleHash = GET_ENTITY_MODEL(vehicle)
	local coords = GET_ENTITY_COORDS(vehicle)
	SET_ENTITY_AS_MISSION_ENTITY(vehicle)
	local rot = GET_ENTITY_ROTATION(vehicle, 2):toDir()
	v3.mul(rot, -getDimensions(vehicle).x - 2)
	v3.add(coords, rot)
	local cloneVehicle = entities.create_vehicle(vehicleHash, coords, vehicleHeading)
	copyVehicleData(vehicle, cloneVehicle)
	return cloneVehicle
end

function reclaimVehicles()
	for k, v in menu.get_children(menu.ref_by_path("Vehicle>Personal Vehicles")) do
			for k1, v1 in v.command_names do
				if (v1 ~= "findpv")
				then
					menu.trigger_commands(v1.."request")
				end
			end
		end
	end

function Streamptfx(lib)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(lib)
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(lib) do
        util.yield()
    end
    GRAPHICS.USE_PARTICLE_FX_ASSET(lib)
end

local classes = {
	[0]= "Compacts",
	[1]= "Sedans",
	[2]= "SUVs",
	[3]= "Coupes",
	[4]= "Muscle",
	[5]= "Sports Classics",
	[6]= "Sports",
	[7]= "Super",
	[8]= "Motorcycles",
	[9]= "Off-road",
	[10]= "Industrial",
	[11]= "Utility",
	[12]= "Vans",
	[13]= "Cycles",
	[14]= "Boats",
	[15]= "Helicopters",
	[16]= "Planes",
	[17]= "Service",
	[18]= "Emergency",
	[19]= "Military",
	[20]= "Commercial",
	[21]= "Trains",
	[22]= "IDK"}


--[[local function is_user_a_stand_user(pid)
    if players.exists(pid) and pid != players.user() then
        for menu.player_root(pid):getChildren() as cmd do
            if cmd:getType() == COMMAND_LIST_CUSTOM_SPECIAL_MEANING and (cmd:refByRelPath("Stand Nutzer"):isValid() or cmd:refByRelPath("Stand User (Co-Loading)"):isValid() or cmd:refByRelPath("Stand user"):isValid() or cmd:refByRelPath("Stand Nutzer (Mit Co-Load)"):isValid()) then
				return true
            end
        end
    end
    return false
end]]


function levideaktivate()
	if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
		menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
	end
end

function PlayerisFriend(player)
	for _, pid in players.list(false, true, false) do
		if player == pid then
			return true
		end
	end
	return false
end

local function getcontrole(entity)
	local time = 0
		repeat
		time += 1
		--util.draw_debug_text("GETTING CONTROLE")
		NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
			if time > 300 then
				--util.toast("konnte keine kontrolle bekommen")
				time = 0
				return false
			end
		util.yield()
		until NETWORK_HAS_CONTROL_OF_ENTITY(entity)
	return true
end

function getfreevehsteat(vehicle)
	if IS_VEHICLE_SEAT_FREE(vehicle, -1, false) then
		if not DOES_ENTITY_EXIST(GET_PED_IN_VEHICLE_SEAT(vehicle, -1, true)) then
			return -1
		end
	end
	local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
	for i = 0, maxPassengers do
		if IS_VEHICLE_SEAT_FREE(vehicle, i, false) then
			if not DOES_ENTITY_EXIST(GET_PED_IN_VEHICLE_SEAT(vehicle, i, true)) then
				return i
			end
		end
	end
	return false
end

function getpedsinvehicle(vehicle)
	local pedstable = {}
	if not IS_VEHICLE_SEAT_FREE(vehicle, -1, false) then
		table.insert(pedstable, GET_PED_IN_VEHICLE_SEAT(vehicle, -1, true))
	end
	local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
	for i = 0, maxPassengers do
		if not IS_VEHICLE_SEAT_FREE(vehicle, i, false) then
			local pedinveh = GET_PED_IN_VEHICLE_SEAT(vehicle, i, true)
			table.insert(pedstable, pedinveh)
		end
	end
	if pedstable == {} then
		return 0
	else
		return pedstable
	end
end

local getseatname = {
	[-1]= "Driver",
	[0]= "Front Right Passenger",
	[1]= "Back Left Passenger",
	[2]= "Back Right Passenger",
	[3]= "Further Back Left Passenger",
	[4]= "Further Back Right Passenger",
	[5]= "IDK Seat",
	[6]= "IDK Seat",
	[7]= "IDK Seat",
	[8]= "IDK Seat",
	[9]= "IDK Seat",
	[10]= "IDK Seat"}

local function v3(x, y, z)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
end

local function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end

handle_ptr = memory.alloc(13*8)
local function pid_to_handle(pid)
    NETWORK_HANDLE_FROM_PLAYER(pid, handle_ptr, 13)
    return handle_ptr
end

local function roundDecimals(float, decimals)
	decimals = 10 ^ decimals
	return math.floor(float * decimals) / decimals
end

local keyLookupTable = {
    ['VK_LBUTTON']              =  0x01,	--Left mouse button
    ['VK_RBUTTON']              =  0x02,	--Right mouse button
    ['VK_CANCEL']               =  0x03,	--Control-break processing
    ['VK_MBUTTON']              =  0x04,	--Middle mouse button (three-button mouse)
    ['VK_XBUTTON1']             =  0x05,	--X1 mouse button
    ['VK_XBUTTON2']             =  0x06,	--X2 mouse button
    -- -	0x07	Undefined
    ['VK_BACK']	                =  0x08,	--BACKSPACE key
    ['VK_TAB']                  =  0x09,	--TAB key
    -- -	0x0A-0B	Reserved
    ['VK_CLEAR']                =  0x0C,	--CLEAR key
    ['VK_RETURN']	            =  0x0D,	--ENTER key
    -- -	0x0E-0F	Undefined
    ['VK_SHIFT']                =  0x10,	--SHIFT key
    ['VK_CONTROL']	            =  0x11,	--CTRL key
    ['VK_MENU']	                =  0x12,	--ALT key
    ['VK_PAUSE']	            =  0x13, 	--PAUSE key
    ['VK_CAPITAL']	            =  0x14,	--CAPS LOCK key
    ['VK_KANA']	                =  0x15, 	--IME Kana mode
    ['VK_HANGUEL']	            =  0x15,	--IME Hanguel mode (maintained for compatibility; use VK_HANGUL)
    ['VK_HANGUL']	            =  0x15,	--IME Hangul mode
    ['VK_IME_ON']	            =  0x16,	--IME On
    ['VK_JUNJA']	            =  0x17,	--IME Junja mode
    ['VK_FINAL']	            =  0x18,	--IME final mode
    ['VK_HANJA']	            =  0x19,	--IME Hanja mode
    ['VK_KANJI']	            =  0x19,	--IME Kanji mode
    ['VK_IME_OFF']	            =  0x1A,	--IME Off
    ['VK_ESCAPE']	            =  0x1B,	--ESC key
    ['VK_CONVERT']	            =  0x1C,	--IME convert
    ['VK_NONCONVERT']           =  0x1D,	--IME nonconvert
    ['VK_ACCEPT']	            =  0x1E,	--IME accept
    ['VK_MODECHANGE']           =  0x1F,	--IME mode change request
    ['VK_SPACE']	            =  0x20,	--SPACEBAR
    ['VK_PRIOR']	            =  0x21,	--PAGE UP key
    ['VK_NEXT']	                =  0x22,	--PAGE DOWN key
    ['VK_END']	                =  0x23,	--END key
    ['VK_HOME']	                =  0x24,	--HOME key
    ['VK_LEFT']	                =  0x25,	--LEFT ARROW key
    ['VK_UP']	                =  0x26,	--UP ARROW key
    ['VK_RIGHT']	            =  0x27,	--RIGHT ARROW key
    ['VK_DOWN']	                =  0x28,	--DOWN ARROW key
    ['VK_SELECT']	            =  0x29,	--SELECT key
    ['VK_PRINT']	            =  0x2A,	--PRINT key
    ['VK_EXECUTE']	            =  0x2B,	--EXECUTE key
    ['VK_SNAPSHOT']	            =  0x2C,	--PRINT SCREEN key
    ['VK_INSERT']	            =  0x2D,	--INS key
    ['VK_DELETE']	            =  0x2E,	--DEL key
    ['VK_HELP']	                =  0x2F,	--HELP key
    ['VK_0']                    =  0x30,	--0 key
    ['VK_1']                    =  0x31,	--1 key
    ['VK_2']                    =  0x32,	--2 key
    ['VK_3']                    =  0x33,	--3 key
    ['VK_4']                    =  0x34,	--4 key
    ['VK_5']                    =  0x35,	--5 key
    ['VK_6']                    =  0x36,	--6 key
    ['VK_7']                    =  0x37,	--7 key
    ['VK_8']                    =  0x38,	--8 key
    ['VK_9']                    =  0x39,	--9 key
    -- -	0x3A-40	Undefined
    ['VK_A']                    =  0x41,	--A key
    ['VK_B']                    =  0x42,	--B key
    ['VK_C']                    =  0x43,	--C key
    ['VK_D']                    =  0x44,	--D key
    ['VK_E']                    =  0x45,	--E key
    ['VK_F']                    =  0x46,	--F key
    ['VK_G']                    =  0x47,	--G key
    ['VK_H']                    =  0x48,	--H key
    ['VK_I']                    =  0x49,	--I key
    ['VK_J']                    =  0x4A,	--J key
    ['VK_K']                    =  0x4B,	--K key
    ['VK_L']                    =  0x4C,	--L key
    ['VK_M']                    =  0x4D,	--M key
    ['VK_N']                    =  0x4E,	--N key
    ['VK_O']                    =  0x4F,	--O key
    ['VK_P']                    =  0x50,	--P key
    ['VK_Q']                    =  0x51,	--Q key
    ['VK_R']                    =  0x52,	--R key
    ['VK_S']                    =  0x53,	--S key
    ['VK_T']                    =  0x54,	--T key
    ['VK_U']                    =  0x55,	--U key
    ['VK_V']                    =  0x56,	--V key
    ['VK_W']                    =  0x57,	--W key
    ['VK_X']                    =  0x58,	--X key
    ['VK_Y']                    =  0x59,	--Y key
    ['VK_Z']                    =  0x5A,	--Z key
    ['VK_LWIN']	                =  0x5B,	--Left Windows key (Natural keyboard)
    ['VK_RWIN']	                =  0x5C,	--Right Windows key (Natural keyboard)
    ['VK_APPS']	                =  0x5D,	--Applications key (Natural keyboard)
    -- -	0x5E	Reserved
    ['VK_SLEEP']	            =  0x5F,	--Computer Sleep key
    ['VK_NUMPAD0']	            =  0x60,	--Numeric keypad 0 key
    ['VK_NUMPAD1']	            =  0x61,	--Numeric keypad 1 key
    ['VK_NUMPAD2']	            =  0x62,	--Numeric keypad 2 key
    ['VK_NUMPAD3']	            =  0x63,	--Numeric keypad 3 key
    ['VK_NUMPAD4']	            =  0x64,	--Numeric keypad 4 key
    ['VK_NUMPAD5']	            =  0x65,	--Numeric keypad 5 key
    ['VK_NUMPAD6']	            =  0x66,	--Numeric keypad 6 key
    ['VK_NUMPAD7']	            =  0x67,	--Numeric keypad 7 key
    ['VK_NUMPAD8']	            =  0x68,	--Numeric keypad 8 key
    ['VK_NUMPAD9']	            =  0x69,	--Numeric keypad 9 key
    ['VK_MULTIPLY']	            =  0x6A,	--Multiply key
    ['VK_ADD']	                =  0x6B,	--Add key
    ['VK_SEPARATOR']            =  0x6C,	--Separator key
    ['VK_SUBTRACT']	            =  0x6D,	--Subtract key
    ['VK_DECIMAL']	            =  0x6E,	--Decimal key
    ['VK_DIVIDE']	            =  0x6F,	--Divide key
    ['VK_F1']	                =  0x70,	--F1 key
    ['VK_F2']	                =  0x71,	--F2 key
    ['VK_F3']	                =  0x72,	--F3 key
    ['VK_F4']	                =  0x73,	--F4 key
    ['VK_F5']	                =  0x74,	--F5 key
    ['VK_F6']	                =  0x75,	--F6 key
    ['VK_F7']	                =  0x76,	--F7 key
    ['VK_F8']	                =  0x77,	--F8 key
    ['VK_F9']	                =  0x78,	--F9 key
    ['VK_F10']	                =  0x79,	--F10 key
    ['VK_F11']	                =  0x7A,	--F11 key
    ['VK_F12']	                =  0x7B,	--F12 key
    ['VK_F13']	                =  0x7C,	--F13 key
    ['VK_F14']	                =  0x7D,	--F14 key
    ['VK_F15']	                =  0x7E,	--F15 key
    ['VK_F16']	                =  0x7F,	--F16 key
    ['VK_F17']	                =  0x80,	--F17 key
    ['VK_F18']	                =  0x81,	--F18 key
    ['VK_F19']	                =  0x82,	--F19 key
    ['VK_F20']	                =  0x83,	--F20 key
    ['VK_F21']	                =  0x84,	--F21 key
    ['VK_F22']	                =  0x85,	--F22 key
    ['VK_F23']	                =  0x86,	--F23 key
    ['VK_F24']	                =  0x87,	--F24 key
    -- -	0x88-8F	Unassigned
    ['VK_NUMLOCK']	            =  0x90,	--NUM LOCK key
    ['VK_SCROLL']	            =  0x91,	--SCROLL LOCK key
    -- 0x92-96	OEM specific
    -- -	0x97-9F	Unassigned
    ['VK_LSHIFT']	            =  0xA0,    --Left SHIFT key
    ['VK_RSHIFT']	            =  0xA1,    --Right SHIFT key
    ['VK_LCONTROL']	            =  0xA2,    --Left CONTROL key
    ['VK_RCONTROL']	            =  0xA3,    --Right CONTROL key
    ['VK_LMENU']	            =  0xA4,    --Left MENU key
    ['VK_RMENU']	            =  0xA5,    --Right MENU key
    ['VK_BROWSER_BACK']	        =  0xA6,	--Browser Back key
    ['VK_BROWSER_FORWARD']	    =  0xA7,	--Browser Forward key
    ['VK_BROWSER_REFRESH']	    =  0xA8,	--Browser Refresh key
    ['VK_BROWSER_STOP']	        =  0xA9,	--Browser Stop key
    ['VK_BROWSER_SEARCH']	    =  0xAA,	--Browser Search key
    ['VK_BROWSER_FAVORITES']	=  0xAB,	--Browser Favorites key
    ['VK_BROWSER_HOME']	        =  0xAC,	--Browser Start and Home key
    ['VK_VOLUME_MUTE']	        =  0xAD,	--Volume Mute key
    ['VK_VOLUME_DOWN']	        =  0xAE,	--Volume Down key
    ['VK_VOLUME_UP']	        =  0xAF,	--Volume Up key
    ['VK_MEDIA_NEXT_TRACK']	    =  0xB0,	--Next Track key
    ['VK_MEDIA_PREV_TRACK']	    =  0xB1,	--Previous Track key
    ['VK_MEDIA_STOP']	        =  0xB2,	--Stop Media key
    ['VK_MEDIA_PLAY_PAUSE']	    =  0xB3,	--Play/Pause Media key
    ['VK_LAUNCH_MAIL']	        =  0xB4,	--Start Mail key
    ['VK_LAUNCH_MEDIA_SELECT']	=  0xB5,	--Select Media key
    ['VK_LAUNCH_APP1']	        =  0xB6,	--Start Application 1 key
    ['VK_LAUNCH_APP2']	        =  0xB7,	--Start Application 2 key
    -- -	0xB8-B9	Reserved
    ['VK_OEM_1']	            =  0xBA,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the ';:' key
    ['VK_OEM_PLUS']	            =  0xBB,	--For any country/region, the '+' key
    ['VK_OEM_COMMA']	        =  0xBC,	--For any country/region, the ',' key
    ['VK_OEM_MINUS']	        =  0xBD,	--For any country/region, the '-' key
    ['VK_OEM_PERIOD']	        =  0xBE,	--For any country/region, the '.' key
    ['VK_OEM_2']	            =  0xBF,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '/?' key
    ['VK_OEM_3']	            =  0xC0,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '`~' key
    -- -	0xC1-D7	Reserved
    -- -	0xD8-DA	Unassigned
    ['VK_OEM_4']	            =  0xDB,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '[{' key
    ['VK_OEM_5']	            =  0xDC,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the '\|' key
    ['VK_OEM_6']	            =  0xDD,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the ']}' key
    ['VK_OEM_7']	            =  0xDE,	--Used for miscellaneous characters; it can vary by keyboard. For the US standard keyboard, the 'single-quote/double-quote' key
    ['VK_OEM_8']	            =  0xDF,	--Used for miscellaneous characters; it can vary by keyboard.
    -- -	0xE0	Reserved
    --0xE1	OEM specific
    ['VK_OEM_102']              =  0xE2,	--The <> keys on the US standard keyboard, or the \\| key on the non-US 102-key keyboard
    -- 0xE3-E4	OEM specific
    ['VK_PROCESSKEY']	        =  0xE5,	--IME PROCESS key
    -- 0xE6	OEM specific
    ['VK_PACKET']	            =  0xE7, 	--Used to pass Unicode characters as if they were keystrokes. The VK_PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more information, see Remark in KEYBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
    -- -	0xE8	Unassigned
    -- 0xE9-F5	OEM specific
    ['VK_ATTN']	                =  0xF6,	--Attn key
    ['VK_CRSEL']	            =  0xF7,	--CrSel key
    ['VK_EXSEL']	            =  0xF8,	--ExSel key
    ['VK_EREOF']	            =  0xF9,	--Erase EOF key
    ['VK_PLAY']	                =  0xFA,	--Play key
    ['VK_ZOOM']	                =  0xFB,	--Zoom key
    ['VK_NONAME']	            =  0xFC,	--Reserved
    ['VK_PA1']	                =  0xFD,	--PA1 key
    ['VK_OEM_CLEAR']	        =  0xFE,	--Clear key
}

local justPressed = {}
local lastPressMS = {}

local loadthigson = true

local function getKeyCode(string_or_int)
    local lookup = keyLookupTable[string_or_int]
    return (lookup and lookup or string_or_int)
end

function is_key_down(string_or_int)
    local keyCode = getKeyCode(string_or_int)
    return util.is_key_down(keyCode)
end

function is_key_just_down(string_or_int)
    local keyCode = getKeyCode(string_or_int)
    local isDown = util.is_key_down(keyCode)

    if isDown and not justPressed[keyCode] then
        justPressed[keyCode] = true
        return true
    elseif not isDown then
        justPressed[keyCode] = false
    end
    return false
end

local function update_leave(pid)
	if menu.get_value(menu.ref_by_command_name("selected" ..pid)) == true then
		menu.trigger_commands("selected" .. pid .. " " .. "off")
		util.yield(200)
		menu.delete(cmd_id[pid])
	else
		menu.delete(cmd_id[pid])
	end
end

local function get_ground_z(coords)
    local start_time = os.time()
    while true do
        local success, est = util.get_ground_z(coords['x'], coords['y'], coords['z'])
        if success then
            return est
        end
        util.yield()
    end
end

function get_ms_since_last_press(string_or_int)
    local keyCode = getKeyCode(string_or_int)
    local isDown = util.is_key_down(keyCode)
    if lastPressMS[keyCode] == nil then
        if isDown then
            lastPressMS[keyCode] = util.current_time_millis()
        end
        return -1
    end
    local prevPress = lastPressMS[keyCode]
    if isDown then
        lastPressMS[keyCode] = util.current_time_millis()
        return prevPress != nil and util.current_time_millis() - prevPress or -1
    end
    return util.current_time_millis() - lastPressMS[keyCode]
end

function isanykeypressed()
	for keyLookupTable as key do
		local keydown = is_key_down(key)
		if keydown then
			return true
		end
	end
	return false
end

function isMoving(ped)
	if not PED.IS_PED_IN_ANY_VEHICLE(ped, true) and ENTITY.GET_ENTITY_SPEED(ped) > 1 then return true end
	if ENTITY.GET_ENTITY_SPEED(PED.GET_VEHICLE_PED_IS_IN(ped, false)) > 1 then return true end
end

function getseatofplayer(vehicle)
	if not IS_VEHICLE_SEAT_FREE(vehicle, -1, false) then
		if GET_PED_IN_VEHICLE_SEAT(vehicle, -1, false) == players.user_ped() then
			return -1
		end
	end
	local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
	for i = -1, maxPassengers do
		if not IS_VEHICLE_SEAT_FREE(vehicle, i, false) then
			if GET_PED_IN_VEHICLE_SEAT(vehicle, i, false) == players.user_ped() then
				return i
			end
		end
	end
	return -2
end

local function get_ip_data(ip)
    local data = {city = "unknown", state = "unknown", country = "unknown"}
    if util.is_soup_netintel_inited() then
        if (loc := soup.netIntel.getLocationByIp(ip)):isValid() then
            --data.city = loc.city
            --data.state = loc.state
            data.country = soup.getCountryName(loc.country_code, "EN")
        end
    end
    return data
end

players.on_leave(update_leave)

timer1 = 0

function getClosestVehicle(myPos)
	local closestDist = 999999999999
	local closestVeh = nil
	for _, veh in pairs(entities.get_all_vehicles_as_pointers()) do--use pointers because handles take more time
	      local vehpos = entities.get_position(veh) --takes pointer
	      local dist = myPos:distance(vehpos)
	      if (dist < closestDist) then
	    	closestDist = dist
	    	closestVeh = veh
	      end
    end
    if closestVeh ~= nil then
        return entities.pointer_to_handle(closestVeh)
    end
end

local function pidlanguage(pid)
	local IP = tostring(soup.IpAddr(players.get_connect_ip(pid)))
	local ip_data = get_ip_data(tostring(IP))
	languages = ip_data.country
	return languages
end

local function playerjoinmassge(pid)
	if player_join then
		playername = players.get_name(pid)
		rockstarid = players.get_rockstar_id(pid)
		connectetip = players.get_connect_port(pid)
		ranklevel = players.get_rank(pid)
		money = players.get_money(pid)
		languagesname = pidlanguage(pid)
		if languagesname == nil then
			goto end
		end
		if util.is_session_transition_active() then
			if ranklevel == 0 or money == 0 then
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname, TOAST_CONSOLE)
			elseif PlayerisFriend(pid) then
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname.."\nLevel: "..ranklevel.."\nGeld: "..money, TOAST_CONSOLE)
			elseif PlayerisFriend(pid) and ranklevel == 0 or money == 0 then
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname, TOAST_CONSOLE)
			else
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname.."\nLevel: "..ranklevel.." / Geld: "..money, TOAST_CONSOLE)
			end
		else
			if ranklevel == 0 or money == 0 then
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname, TOAST_ALL)
			elseif PlayerisFriend(pid) then
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname.."\nLevel: "..ranklevel.." / Geld: "..money, TOAST_ALL)
			elseif PlayerisFriend(pid) and ranklevel == 0 or money == 0 then
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname, TOAST_ALL)
			else
				util.toast("Spieler Gejoint\n"..playername.."   ("..rockstarid..") / Land: "..languagesname.."\nLevel: "..ranklevel.." / Geld: "..money, TOAST_ALL)
			end
		end
		::end::
	end
end

local function getvehtype(hashveh)
	if IS_THIS_MODEL_A_BOAT(hashveh) then
		return "BOAT"
	elseif IS_THIS_MODEL_A_PLANE(hashveh) then
		return "PLANE"
	elseif IS_THIS_MODEL_A_HELI(hashveh) then
		return "HELI"
	elseif IS_THIS_MODEL_A_CAR(hashveh) then
		return "CAR"
	elseif IS_THIS_MODEL_A_TRAIN(hashveh) then
		return "TRAIN"
	elseif IS_THIS_MODEL_A_BIKE(hashveh) then
		return "BIKE"
	elseif IS_THIS_MODEL_A_BICYCLE(hashveh) then
		return "BICYCLE"
	elseif IS_THIS_MODEL_A_QUADBIKE(hashveh) then
		return "QUADBIKE"
	elseif util.is_this_model_a_trailer(hashveh) then
		return "TRAILER"
	else
		return "NOT FOUND"
	end
end

function getorganisationplayers(pid)
	local orgmembers = {}
	local bossofpid = players.get_boss(pid)
	if bossofpid == -1 then
		return false
	end
		for players.list(false, true, true) as pid1 do
			local bossofpid1 = players.get_boss(pid1)
			if bossofpid1 != -1 then
				if bossofpid == bossofpid1 then
					table.insert(orgmembers,pid1)
				end
			end
		end
		return orgmembers
end

function getorgtype(pid)
	local orgtype = players.get_org_type(pid)
	if orgtype == -1 then
		return "false"
	elseif orgtype == 0 then
		return "CEO"
	elseif orgtype == 1 then
		return "Bike Club"
	end
end

function getHealth(ped)
	local hp = GET_ENTITY_HEALTH(ped)
	local maxHp = GET_PED_MAX_HEALTH(ped)
	local armor = GET_PED_ARMOUR(ped)
	local total = hp
	if maxHp == 0 then
		total = 0
	elseif armor > 0 then
		total = math.floor((total + armor) / (maxHp + 50) * 100)
	else
		total = math.floor(total / maxHp * 100)
	end
	return {
		health = hp,
		armor = armor,
		maxHealth = maxHp,
		total = total .. "%"
	}
end

function getKD(pid)
    pid = pid or players.user()
    return math.floor(players.get_kd(pid) * 100) / 100	
end

function getMoney(pid, shorten)
	pid = pid or players.user()
	local money = players.get_money(pid)
	if not shorten then
		return money
	end
	local length = string.len(tostring(money))
	if length < 4 then
		return money
	elseif length < 7 then
		return string.format("%.2fK", money / 1000)
	elseif length < 10 then
		return string.format("%.2fM", money / 1000000)
	end
	return string.format("%.2fB", money / 1000000000)
end


local weapons = util.get_weapons()
local weaponHash = memory.alloc_int()
function getWeapon(ped)
	GET_CURRENT_PED_WEAPON(ped, weaponHash, true)
	local readWeaponHash = memory.read_int(weaponHash)
	local weaponName
	for _, wep in weapons do
		if wep.hash == readWeaponHash then
			weaponName = util.get_label_text(wep.label_key)
			break
		end
	end
	return weaponName
end

function getSpeed(entity, onlyValue)
	local speed = GET_ENTITY_SPEED(entity)
	local localSpeed
	localSpeed = math.floor(speed * 3.6)
	if onlyValue then
		return localSpeed
	end
	return localSpeed .. " " .. "kmh"
end

function getPlayerPosition(pid)
    pid = pid or players.user()
    return players.get_position(pid)
end

function getmodelnamebyhash(hash)
	if util.get_label_text(hash) ~= "NULL" then
		return util.get_label_text(hash)
	end
	return util.reverse_joaat(hash)
end

function getLanguage(pid)
	pid = pid or Player.getUserPlayer()
	return LANGUAGES[players.get_language(pid)]
end

local function removeValues(t, removeT)
	for _, r in ipairs(removeT) do
		for i, v in ipairs(t) do
			if v == r then
				table.remove(t, i)
			end
		end
	end
end

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end
excludeselected = false

cmd_id = {}
for i = 0, 31 do
	cmd_id[i] = 0
end

listpickups = {}
for i = 20, 0 do
	listpickups[i] = 0
end

listkicken = {}
for i = 0, 31 do
	listkicken[i] = 0
end

listfriendly = {}
for i = 0, 31 do
	listfriendly[i] = 0
end

listtp = {}
for i = 0, 31 do
	listtp[i] = 0
end

listtrolling = {}
for i = 0, 31 do
	listtrolling[i] = 0
end

listgenerel = {}
for i = 0, 31 do
	listgenerel[i] = 0
end

veh = {}
for i = 0, 300 do
	veh[i] = 0
end

vehinfotab = {}
for i = 0, 300 do
	vehinfotab[i] = 0
end

local colors = {
green = 184,
red = 6,
yellow = 190,
black = 2,
white = 1,
gray = 3,
pink = 201,
purple = 49,
blue = 11
}

function getInterior(pid)
	pid = pid or players.user()
	local pos = players.get_position(pid)
	local interior = GET_INTERIOR_FROM_COLLISION(pos.x, pos.y, pos.z)
	if interior > 0 then
		for name, val in INTERIOR_IDS do
			if val == interior then
				local hasNumber = string.find(name, "%d")
				if hasNumber then
					return name:gsub('%d', '')
				end
				return name
			end
		end
	end	    local function checkCoordsFor(name)
		if name == "kosatka" and checkCoordsFor("kosatkaMissile") then
			return "kosatkaMissile"
		end
		local coords = INTERIOR_COORDS[name]
		if pos.x >= coords[1] and pos.x <= coords[2] and pos.y >= coords[3] and pos.y <= coords[4] then
			if not coords[5] or (pos.z >= coords[5] and pos.z <= coords[6]) then
				local hasNumber = string.find(name, "%d")
				if hasNumber then
					return name:gsub('%d', '')
				end
				return name
			end
		end
	end
	for name in INTERIOR_COORDS do
		local interiorName = checkCoordsFor(name)
		if interiorName then
			return interiorName
		end
	end
	if players.is_in_interior(pid) then
		return "interior"
	end
	return nil
end

local options <const> = {"zu Meinem", "zu Seinem"}


-- player options

local function player(pid)
    menu.divider(menu.player_root(pid), "Selfmade")
	local main = menu.list(menu.player_root(pid), "Selfmade", {"PlMein"}, "")
    local bozo = menu.list(main, "Notizen", {"Notizen"}, "")
	local anderes = menu.list(main, "anderes zeug", {"anderes"}, "")
	local orgthings = menu.list(main, "org zeug", {"orgthings"}, "wenn du im org bist wird nichts davon auf dich gemacht")
	local orgthingsteleport = menu.list(orgthings, "Teleportieren", {"orgtele"}, "")
	local orgthingsfriendly = menu.list(orgthings, "Freundlich", {"orgfriendlys"}, "")
	local orgthingsfriendlyvehicle = menu.list(orgthingsfriendly, "Vehicle", {"orgfriendlysvehicle"}, "")
	local orgthingsweapons = menu.list(orgthings, "Waffen", {"orgweapons"}, "")
	local orgthingstrolling = menu.list(orgthings, "Trolling", {"orgtrolling"}, "")
	local orgthingstrollingvehicle = menu.list(orgthingstrolling, "Vehicle", {"orgtrollingvehicle"}, "")
	local orgthingscrash = menu.list(orgthings, "Crash", {"orgcrash"}, "")
	--local spam = menu.list(main, "spam zeug", {"spamzeug"}, "")

	--[[menu.toggle(spam, "alle loops", {}, "auto spam besser selber an machen sonst kaka", function(on_toggle)
		if on_toggle then
			menu.trigger_commands("ptfxspam" .. players.get_name(pid) .. " on")
			menu.trigger_commands("explospam" .. players.get_name(pid) .. " on")
		else
			menu.trigger_commands("ptfxspam" .. players.get_name(pid) .. " off")
			menu.trigger_commands("explospam" .. players.get_name(pid) .. " off")
		end
    end)

	local ptfx = {lib = 'scr_rcbarry2', sel = 'scr_clown_appears'}
	menu.toggle_loop(spam, 'PTFX Spam', {"ptfxspam"}, 'PTFX Spam', function ()
    local targets = GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    Streamptfx(ptfx.lib)
    GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD( ptfx.sel, tar1.x, tar1.y, tar1.z + 1, 0, 0, 0, 10.0, true, true, true)
	end)

	menu.list_action(spam, 'Ptfx List', {}, 'such dir hier aus was du für ein ptfx willst', Fxcorelist, function(fxsel)
    ptfx.sel = Fxha[fxsel]
    ptfx.lib = 'core'
	end)

	menu.toggle_loop(spam, "auto spam", {"autospam"}, "auto spawn spawnt viele t20", function(on_toggle)
			menu.trigger_commands("as" .. players.get_name(pid) .. " spawn" .. " t20")
    end)
	menu.toggle_loop(spam, "explosiv spam", {"explospam"}, "lässt ihn die ganze zeit explodieren", function(on_toggle)
		menu.trigger_commands("explode" .. players.get_name(pid))
	end)]]

	-- org teleport menu
	menu.action(orgthingsteleport, "Zu Mir Teleportieren", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("summon".. playername)
				util.toast("org wird zu dir teleportiert")
			end
		end
 	end)
	menu.action(orgthingsteleport, "Zu Meinem Wegpunkt Teleportieren", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("wpsummon".. playername)
				util.toast("org wird zum wegpunkt teleportiert")
			end
		end
 	end)
	menu.action(orgthingsteleport, "Zu Meinem Missionsziel Teleportieren", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("summonobj".. playername)
				util.toast("org wird zum Missionziehl teleportiert")
			end
		end
 	end)

	--org Freundlich menu vehicle
	menu.action(orgthingsfriendlyvehicle, "Komplett Verbessern", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("upgradeveh".. playername)
				util.toast("Fahrzeuge wurde upgegraded")
			end
		end
 	end)
	menu.action(orgthingsfriendlyvehicle, "Fahrzeug Reparieren", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("repairveh".. playername)
				util.toast("org Fahrzeuge wurde Repariert")
			end
		end
 	end)
	menu.action(orgthingsfriendlyvehicle, "Unzerstörbar", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("givevehgod".. playername))
				if check then
					menu.trigger_commands("givevehgod".. playername.. " off")
					util.toast("Godmode vehicle wurde für org ausgeschaltet")
				else
					menu.trigger_commands("givevehgod".. playername.. " on")
					util.toast("Godmode vehicle für org eingeschaltet")
				end
			end
		end
 	end)

	--freundlich menu main
	menu.action(orgthingsfriendly, "CEO Geld-Schleife", {}, "wird nicht dem boss gegeben\nAN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local bossofceo = players.get_boss(pid1)
				if bossofceo == pid1 then
				else
					local playername = players.get_name(pid1)
					local check = menu.get_value(menu.ref_by_command_name("ceopay".. playername))
					if check then
						menu.trigger_commands("ceopay".. playername.. " off")
						util.toast("CEO Geld-Schleife wurde für org mitglieder ausgeschaltet")
					else
						menu.trigger_commands("ceopay".. playername.. " on")
						util.toast("CEO Geld-Schleife wurde für org mitglieder eingeschaltet")
					end
				end
			end
		end
 	end)
	menu.action(orgthingsfriendly, "Kasino-Figuren Geben", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("figurines".. playername))
				if check then
					menu.trigger_commands("figurines".. playername.. " off")
					util.toast("Kasino-Figuren wurde für org ausgeschaltet")
				else
					menu.trigger_commands("figurines".. playername.. " on")
					util.toast("Kasino-Figuren wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingsfriendly, "Spielkarten Geben", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("cards".. playername))
				if check then
					menu.trigger_commands("cards".. playername.. " off")
					util.toast("Spielkarten wurde für org ausgeschaltet")
				else
					menu.trigger_commands("cards".. playername.. " on")
					util.toast("Spielkarten wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingsfriendly, "Automatische Heilung", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("autoheal".. playername))
				if check then
					menu.trigger_commands("autoheal".. playername.. " off")
					util.toast("autoheal wurde für org ausgeschaltet")
				else
					menu.trigger_commands("autoheal".. playername.. " on")
					util.toast("autoheal wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingsfriendly, "Nie Gefahndet", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("bail".. playername))
				if check then
					menu.trigger_commands("bail".. playername.. " off")
					util.toast("Nie Gefahndet wurde für org ausgeschaltet")
				else
					menu.trigger_commands("bail".. playername.. " on")
					util.toast("Nie Gefahndet wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingsfriendly, "Vom Radar Verschwinden", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("giveotr".. playername))
				if check then
					menu.trigger_commands("giveotr".. playername.. " off")
					util.toast("Vom Radar Verschwinden für org ausgeschaltet")
				else
					menu.trigger_commands("giveotr".. playername.. " on")
					util.toast("Vom Radar Verschwinden wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingsfriendly, "P's & Q's Geben", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("snack".. playername))
				if check then
					menu.trigger_commands("snack".. playername.. " off")
					util.toast("P's & Q's für org ausgeschaltet")
				else
					menu.trigger_commands("snack".. playername.. " on")
					util.toast("P's & Q's wurde für org eingeschaltet")
				end
			end
		end
 	end)

	--org weapons
	menu.action(orgthingsweapons, "Alle Waffen Geben", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("arm".. playername)
				util.toast("alle Waffen wurde an org gegeben")
			end
		end
 	end)
	menu.action(orgthingsweapons, "Munition Geben", {}, "gibt nur für die ausgerüstete waffe munition", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				menu.trigger_commands("ammo".. playername)
				util.toast("Munition wurde allen gegeben")
			end
		end
 	end)
	menu.action(orgthingsweapons, "Fallschirm Geben", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("paragive".. playername)
				util.toast("Fallschirm wurde an org gegeben")
			end
		end
 	end)
	menu.action(orgthingsweapons, "Unbewaffnen", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("disarm".. playername))
				if check then
					menu.trigger_commands("disarm".. playername.. " off")
					util.toast("Unbewaffnen für org ausgeschaltet")
				else
					menu.trigger_commands("disarm".. playername.. " on")
					util.toast("Unbewaffnen wurde für org eingeschaltet")
				end
			end
		end
 	end)

	--org trolling vehicle
	menu.action(orgthingstrollingvehicle, "Töten", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("killveh".. playername)
				util.toast("autos von org wurden getötet")
			end
		end
 	end)
	menu.action(orgthingstrollingvehicle, "EMP", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("empveh".. playername)
				util.toast("autos von org wurden mit emp versetzt")
			end
		end
 	end)
	menu.action(orgthingstrollingvehicle, "Löschen", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("delveh".. playername)
				util.toast("autos von org wurden gelöscht")
			end
		end
 	end)

	--org trolling
	menu.click_slider(orgthingstrolling, "Fahndungslevel Setzen", {}, "", 0 ,5, 0, 1, function(s)
		local level = s
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				if level == 0 then
					menu.trigger_commands("pwanted".. playername.. " " ..level)
					util.toast("Fahnungslevel von org wurde auf ".. level.. " gesetzt")
				elseif level == 1 then
					menu.trigger_commands("pwanted".. playername.. " " ..level)
					util.toast("Fahnungslevel von org wurde auf ".. level.. " gesetzt")
				elseif level == 2 then
					menu.trigger_commands("pwanted".. playername.. " " ..level)
					util.toast("Fahnungslevel von org wurde auf ".. level.. " gesetzt")
				elseif level == 3 then
					menu.trigger_commands("pwanted".. playername.. " " ..level)
					util.toast("Fahnungslevel von org wurde auf ".. level.. " gesetzt")
				elseif level == 4 then
					menu.trigger_commands("pwanted".. playername.. " " ..level)
					util.toast("Fahnungslevel von org wurde auf ".. level.. " gesetzt")
				elseif level == 5 then
					menu.trigger_commands("pwanted".. playername.. " " ..level)
					util.toast("Fahnungslevel von org wurde auf ".. level.. " gesetzt")
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Einfrieren", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("freeze".. playername))
				if check then
					menu.trigger_commands("freeze".. playername.. " off")
					util.toast("Einfrieren wurde für org ausgeschaltet")
				else
					menu.trigger_commands("freeze".. playername.. " on")
					util.toast("Einfrieren wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Kamera Nach Vorne Zwingen", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("confuse".. playername))
				if check then
					menu.trigger_commands("confuse".. playername.. " off")
					util.toast("Kamera Nach Vorne Zwingen wurde für org ausgeschaltet")
				else
					menu.trigger_commands("confuse".. playername.. " on")
					util.toast("Kamera Nach Vorne Zwingen wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Ragdoll", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("ragdoll".. playername))
				if check then
					menu.trigger_commands("ragdoll".. playername.. " off")
					util.toast("Ragdoll wurde für org ausgeschaltet")
				else
					menu.trigger_commands("ragdoll".. playername.. " on")
					util.toast("Ragdoll wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Kamera Verwackeln", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("shakecam".. playername))
				if check then
					menu.trigger_commands("shakecam".. playername.. " off")
					util.toast("Kamera Verwackeln wurde für org ausgeschaltet")
				else
					menu.trigger_commands("shakecam".. playername.. " on")
					util.toast("Kamera Verwackeln wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Töten", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("kill".. playername)
				util.toast("Töten wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingstrolling, "Explodieren", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("explode".. playername)
				util.toast("Explodieren wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingstrolling, "Benachrichtigungs-Spam", {}, "AN / AUS", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				local check = menu.get_value(menu.ref_by_command_name("notifyspam".. playername))
				if check then
					menu.trigger_commands("notifyspam".. playername.. " off")
					util.toast("Benachrichtigungs-Spam wurde für org ausgeschaltet")
				else
					menu.trigger_commands("notifyspam".. playername.. " on")
					util.toast("Benachrichtigungs-Spam wurde für org eingeschaltet")
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Kick Vom Fahrzeug", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("vehkick".. playername)
				util.toast("Kick Vom Fahrzeug wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingstrolling, "Kick Vom Innenraum", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("interiorkick".. playername)
				util.toast("Kick Vom Innenraum wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingstrolling, "Kick Vom CEO/MC", {}, "kickt den boss raus damit ist die org aufgelöst", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local bossofceo = players.get_boss(pid1)
				if bossofceo == players.user() then
					util.toast("du kickst dich damit selber du depp")
				else
					if bossofceo == pid1 then
						local playername = players.get_name(bossofceo)
						menu.trigger_commands("ceokick".. playername)
						util.toast("Kick Vom CEO/MC wurde für "..playername.. " angewendet")
					end
				end
			end
		end
 	end)
	menu.action(orgthingstrolling, "Unedlicher Ladebildschirm", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("infiniteloading".. playername)
				util.toast("Unedlicher Ladebildschirm wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingstrolling, "In Freemode-Mission Zwingen", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("mission".. playername)
				util.toast("In Freemode-Mission Zwingen wurde für og angewendet")
			end
		end
 	end)

	--org crashen
	menu.action(orgthingscrash, "Elegant", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("crash".. playername)
				util.toast("Elegant (crash) wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingscrash, "Burger King Fußsalat", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("footlettuce".. playername)
				util.toast("Burger King Fußsalat (crash) wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingscrash, "Fahrzeug Totschlag", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("slaughter".. playername)
				util.toast("Fahrzeug Totschlag (crash) wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthingscrash, "Dampfwalze", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("steamroll".. playername)
				util.toast("Dampfwalze (crash) wurde für og angewendet")
			end
		end
 	end)
	menu.action(orgthings, "Kick", {}, "", function()
		local orgmembers = getorganisationplayers(pid)
		if orgmembers == "false" then
			util.toast("spieler ist in keiner organisation")
		else
			for orgmembers as pid1 do
				local playername = players.get_name(pid1)
				menu.trigger_commands("kick".. playername)
				util.toast("Kick wurde für og angewendet")
			end
		end
 	end)
	

	menu.toggle_loop(anderes, "Remove Player Godmode", {}, "Blocked by most menus.", function()
		util.trigger_script_event(1 << pid, {800157557, pid, 225624744, math.random(0, 9999)})
    end)
	
    menu.action(bozo, "kicken", {"notekick"}, "kickt ihn aus der lobby", function()
         menu.trigger_commands("kick" .. players.get_name(pid))
    end)

    menu.action(bozo, "Stand user", {"notestand"}, "Speichert ihn als stand user", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "Stand user")
         util.toast(players.get_name(pid) .." wurde als Stand user gespeichert ")
    end)

    menu.action(bozo, "Streamer", {"notestreamer"}, "Speichert ihn als Streamer", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "Streamer")
         util.toast(players.get_name(pid) .." wurde als Streamer gespeichert ")
    end)

    menu.action(bozo, "Wixxer mit direkt block", {"notewixxermitblock"}, "Speichert ihn als Wixxer mit direkt block aber ohne ein notify", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "Wixxer")
         menu.trigger_commands("historyblock" .. players.get_name(pid) .. " " .. "on")
         util.toast(players.get_name(pid) .." wurde als Wixxer mit Block gespeichert ")
    end)
   
    menu.action(bozo, "Wixxer ohne block", {"notewixxer"}, "Speichert ihn als Wixxer ohne block", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "Wixxer")
         util.toast(players.get_name(pid) .." wurde als Wixxer ohne block gespeichert ")
    end)

    menu.action(bozo, "Freund", {"notefreund"}, "Speichert ihn als Freund", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "Freund")
         util.toast(players.get_name(pid) .." wurde als Freund gespeichert ")
    end)

    menu.action(bozo, "Modder", {"notemodder"}, "Speichert ihn als Modder", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "Modder")
         util.toast(players.get_name(pid) .." wurde als Modder gespeichert ")
    end)

    menu.action(bozo, "Notiz entfernen", {"noteentfernen"}, "Entfernt seine jetzige notiz und wenn blockt dann auch denn block", function()
         menu.trigger_commands("historynote" .. players.get_name(pid) .. " " .. "")
         menu.trigger_commands("historyblock" .. players.get_name(pid) .. " " .. "off")
         util.toast(players.get_name(pid) .." Notiz wurde entfernt ")
    end)

    menu.action(bozo, "Zur history seite", {}, "zur history seite", function()
         menu.trigger_commands("history")
    end)





	if (filesystem.exists(filesystem.scripts_dir() .. "lib/wiriscript/orbital_cannon.lua")) then
		local OrbitalCannon = require "wiriscript.orbital_cannon"

		menu.action(main, "Kill With Orbital Cannon", {}, "", function()
			if players.is_in_interior(pid) then
				util.toast("ist im gebäude")
			elseif is_player_passive(pid) then
				util.toast("ist im passive")
			elseif not OrbitalCannon.exists() and IS_PLAYER_PLAYING(pid) then
				OrbitalCannon.create(pid)
			end
		end)

		util.on_stop(function()
			if OrbitalCannon.exists() then
				OrbitalCannon.destroy()
			end
		end)
		
		
		while true do
			OrbitalCannon.mainLoop()
			util.yield_once()
		end
	else
		menu.action(main, "Kill With Orbital Cannon", {}, "", function()
			util.toast("du hast bestimmte files nicht")
		end)
	end
end

players.on_join(player)
players.dispatch_on_join()

--local parents
local Self = menu.list(menu.my_root(), "Self zeug", {}, "")
local vehicle = menu.list(menu.my_root(), "Vehicle zeug", {}, "")
local Entitymanager = menu.list(menu.my_root(), "Entity Manager", {}, "")
local Entitymanagercleararea = menu.list(Entitymanager, "Clear Area", {}, "")
local Entitymanageresp = menu.list(Entitymanager, "Entity ESP", {}, "")
local Entitymanagernearvehicle = menu.list(Entitymanager, "Near Entitys", {}, "")
local player_zeug = menu.list(menu.my_root(), "Player zeug", {}, "")
--local streamer = menu.list(player_zeug, "Streamer zeug", {}, "")
local Zeugforjob = menu.list(menu.my_root(), "Zeug für jobs/missions", {}, "")
local custselc = menu.list(menu.my_root(), "Custom Selection", {}, "", function(); end)
local misc = menu.list(menu.my_root(), "Misc", {}, "", function(); end)
local frendlist = menu.list(misc, "friend list", {"fl"}, "", function(); end)
local players_list = menu.list(misc, "Players", {}, "")

local function gen_fren_funcs(name)
	local balls = menu.list(frendlist, name, {"friend "..name}, "", function(); end)
	menu.divider(balls, name)
	menu.action(balls,"join", {"jf "..name}, "",function()
		menu.trigger_commands("join "..name)
	end)
	menu.action(balls,"add to history", {}, "",function()
		menu.trigger_commands("historyadd " .. name)
	end)
	menu.action(balls,"open in history", {}, "",function()
		menu.trigger_commands("findplayer " .. name)
	end)
	menu.action(balls,"open profile", {"pf "..name}, "",function()
		menu.trigger_commands("nameprofile "..name)
	end)
end

menu.divider(frendlist, "frens:)")
for i = 0 , get_friend_count() do
	local name = get_frined_name(i)
	if name == "*****" then goto yes end
	gen_fren_funcs(name)
	::yes::
end

local function handle_player_list(pid)
    local ref = menus[pid]
    if not players.exists(pid) then
        if ref then
            menu.delete(ref)
            menus[pid] = nil
        end
    end
end

local function player_list(pid)
	menus[pid] = menu.action(players_list, players.get_name(pid), {}, "", function() -- thanks to dangerman and aaron for showing me how to delete players properly
		menu.trigger_commands("Plmein " .. players.get_name(pid))
	end)
end

players.on_join(player_list)
players.on_leave(handle_player_list)

for pids = 0, 31 do
	if players.exists(pids) then
		menus[pids] = menu.action(players_list, players.get_name(pids), {}, "", function() -- thanks to dangerman and aaron for showing me how to delete players properly
			menu.trigger_commands("Plmein " .. players.get_name(pids))
		end)
	end
end

local Entitymanagerespvehicle = menu.list(Entitymanageresp, "Vehicles", {}, "")
local Entitymanageresppeds = menu.list(Entitymanageresp, "Peds", {}, "")
local Entitymanagerespobjects = menu.list(Entitymanageresp, "objects", {}, "")
local Entitymanageresppickups = menu.list(Entitymanageresp, "Pickups", {}, "")

local deactivateother = false
menu.toggle(Entitymanageresp, "Deaktivieren andere ESP", {}, "deactiviere andere esp wenn du eine an machst", function(on_toggle)
	if on_toggle then
		deactivateother = true
	else
		deactivateother = false
	end
end)

local enabledveh, showonlymissionveh = false, false
local xValueveh, yValueveh, scaleValueveh = 0, 0, 35
local colorveh = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
local maxDistanceveh = 700
local showDistanceveh, shownameveh, showmyveh, showspeedveh, showdriverveh, showinvehveh, showmissionveh, showownerveh, showentitygroupveh, 
showonlyotherownerveh, getonlyvisibleveh, showdestroyedveh, showidnameveh = true, true, true, true, false, false, false, false, true, false, false, true, true

	local function renderESPveh(givedata)
		if not enabledveh then
	        return false
	    end
		if not util.is_session_started() or IS_PAUSE_MENU_ACTIVE() then
			return
		end
		local data = {}
		local gameX, gameY = memory.alloc(1), memory.alloc(1)
	    local myPed = players.user_ped()
	    local myPos = players.get_position(players.user())
	    for _, vehs in pairs(entities.get_all_vehicles_as_pointers()) do
			local vehshandle = entities.pointer_to_handle(vehs)
	        if not IS_ENTITY_ON_SCREEN(vehshandle) and getonlyvisibleveh then
	            goto continue
	        end
			local modelhash = entities.get_model_hash(vehs)
	        local pPos = entities.get_position(vehs)
	        local dist = myPos:distance(pPos)
	        if (dist > maxDistanceveh) then
	            goto continue
	        end
			local driverplayer = false
	        local isMyVehicle = false
			local ispedinveh = IS_PED_IN_ANY_VEHICLE(myPed, false)
			local vehofped = GET_VEHICLE_PED_IS_IN(myPed, false)
	       	local driver = GET_PED_IN_VEHICLE_SEAT(vehshandle, -1)
			local ownerveh =  players.get_name(entities.get_owner(vehshandle))
			local missionentityveh = IS_ENTITY_A_MISSION_ENTITY(vehshandle)
	            if driver == myPed then
	                isMyVehicle = true
	            end
			if not showmyveh and ispedinveh and vehofped == vehshandle then
				goto continue
			end
			if (not missionentityveh) and showonlymissionveh then
				goto continue
			end
			if IS_PED_A_PLAYER(driver) then
				driverplayer = true
				driverplayerindex = players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(driver))
			end
	        local posToUse = pPos
	        GET_SCREEN_COORD_FROM_WORLD_COORD(posToUse.x, posToUse.y, posToUse.z + 1, gameX, gameY)
	        local screenX, screenY = memory.read_float(gameX), memory.read_float(gameY)
	        local valuesToDisplay = {}
	        local playersInVehicle = ""
			if showentitygroupveh then
	            valuesToDisplay[#valuesToDisplay + 1] = "VEHICLE"
	        end
			if showDistanceveh then
	            valuesToDisplay[#valuesToDisplay + 1] = math.floor(dist)
	        end
			if (shownameveh or showspeedveh or showidnameveh) then
	            local textLine = ""
	            if shownameveh then
	                textLine = getmodelnamebyhash(modelhash) .. " "
	            end
				if showidnameveh then
	                textLine = textLine .. "["..util.reverse_joaat(modelhash) .. "] "
	            end
	            if showspeedveh and getSpeed(vehshandle, true) > 0 then
	                textLine = textLine .. getSpeed(vehshandle)
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        if isMyVehicle and showinvehveh then
	            local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehshandle)
	            for i = 0, maxPassengers do
	                if not IS_VEHICLE_SEAT_FREE(vehshandle, i, false) then
	                    local vehPed = GET_PED_IN_VEHICLE_SEAT(vehshandle, i)
	                    if IS_PED_A_PLAYER(vehPed) then
	                        playersInVehicle = playersInVehicle .. players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(vehPed)) .. ", "
	                    end
	                end
	            end
			end
			if not isMyVehicle and showinvehveh then
				local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehshandle)
				for i = 0, maxPassengers do
	                if not IS_VEHICLE_SEAT_FREE(vehshandle, i, false) then
	                    local vehPed = GET_PED_IN_VEHICLE_SEAT(vehshandle, i)
	                    if IS_PED_A_PLAYER(vehPed) then
	                        playersInVehicle = playersInVehicle .. players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(vehPed)) .. ", "
	                    end
	                end
	            end
	        end
			if driverplayer and showdriverveh then
	            valuesToDisplay[#valuesToDisplay + 1] = "Driver" .. ": " .. driverplayerindex
	        end
	        if playersInVehicle:len() > 0 then
	            valuesToDisplay[#valuesToDisplay + 1] = "in Vehicle" .. ": " .. playersInVehicle:gsub(", $", "")
	        end
			if missionentityveh and showmissionveh then
				valuesToDisplay[#valuesToDisplay + 1] = "Mission Entity"
			end
			if showownerveh then
				if  showonlyotherownerveh and (ownerveh == players.get_name(players.user())) then
				else
					valuesToDisplay[#valuesToDisplay + 1] = "Owner: ".. ownerveh
				end
			end
			if (GET_VEHICLE_ENGINE_HEALTH(vehshandle) <= 0) and not showdestroyedveh then
				goto continue
			end
	        local text = table.concat(valuesToDisplay, "\n")
			if not givedata then
	       		directx.draw_text(screenX + xValueveh, screenY + yValueveh, text, 5, scaleValueveh, colorveh, false)
			end
			if givedata then
				table.insert(data, vehshandle)
			end
			::continue::
		end
		if givedata then
			return data
		end
	end
	
enabledToggleveh = menu.toggle(Entitymanagerespvehicle, "Enable ESP Vehicle", {"ESPveh"}, "", function(on_toggle)
	if on_toggle then
		enabledveh = true
		if deactivateother then
			menu.trigger_commands("ESPped off")
			menu.trigger_commands("ESPobject off")
			menu.trigger_commands("ESPpickup off")
		end
		util.create_tick_handler(renderESPveh)
	else
		enabledveh = false
	end
end)


onlymissionToggleveh = menu.toggle(Entitymanagerespvehicle, "Show Only Mission", {}, "", function(on)
	showonlymissionveh = on
end, showonlymissionveh)
showonlymissionveh = menu.get_value(onlymissionToggleveh)

local actionSubmenuveh = menu.list(Entitymanagerespvehicle, "Action", {}, "action für die auf dennen ESP drauf ist")
local actionsettingsSubmenuveh = menu.list(actionSubmenuveh, "Settings", {}, "")
local explosiontype = 6
local explosionsettingveh = menu.list_select(actionsettingsSubmenuveh, "Explosion", {}, "Explosion wie haftbomben oder granaten haben eine grenze also nicht wundern", EXPLOSIONVARIATION, explosiontype, function(value)
	explosiontype = value
end)
onlyvisibleToggleveh = menu.toggle(actionSubmenuveh, "get only visible vehs", {}, "", function(on)
	getonlyvisibleveh = on
end, getonlyvisibleveh)
getonlyvisibleveh = menu.get_value(onlyvisibleToggleveh)
menu.action(actionSubmenuveh, "teleport to me", {}, "Nutzen auf eigene gefahr\nignoriert spieler", function()
	local data = renderESPveh(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if IS_VEHICLE_SEAT_FREE(entity, -1, false) then
				if entities.request_control(entity, 150) then
					SET_ENTITY_AS_MISSION_ENTITY(entity)
					SET_ENTITY_COORDS(entity, pPos.x, pPos.y, pPos.z)
				end
			else
				pedinseat = GET_PED_IN_VEHICLE_SEAT(entity, -1, true)
				if not IS_PED_A_PLAYER(pedinseat) then
					if entities.request_control(entity, 150) then
						SET_ENTITY_AS_MISSION_ENTITY(entity)
						SET_ENTITY_COORDS(entity, pPos.x, pPos.y, pPos.z)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuveh, "Delete", {}, "", function()
	local data = renderESPveh(true)
	if data then
		for data as entity do
			if IS_VEHICLE_SEAT_FREE(entity, -1, false) then
				if entities.request_control(entity, 150) then
					entities.delete(entity)
				end
			else
				pedofvehicle = GET_PED_IN_VEHICLE_SEAT(entity, -1, true)
				if not IS_PED_A_PLAYER(pedofvehicle) then
					if entities.request_control(pedofvehicle, 150) then
						entities.delete(entity)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuveh, "Explode", {}, "bissel bugi aber mit bissel spamen geht klar", function()
	local time = 0
	local data = renderESPveh(true)
	if data then
		for data as entity do
			--local pointerent = entities.handle_to_pointer(entity)
			--local positon = entities.get_position(pointerent)
			local boneindex = GET_ENTITY_BONE_INDEX_BY_NAME(entity, "engine")
			local position = GET_ENTITY_BONE_POSTION(entity, boneindex)
			if position ~= number then
				if IS_VEHICLE_SEAT_FREE(entity, -1, false) then
					--if entities.request_control(entity, 150) then
						repeat
							util.yield()
							time += 1
							ADD_EXPLOSION(position.x, position.y, position.z, explosiontype, 1, true, false, 0.0, false)
						until (GET_VEHICLE_ENGINE_HEALTH(entity) <= 0) or time == 500 or (not DOES_ENTITY_EXIST(entity))
					--end
				else
					pedofvehicle = GET_PED_IN_VEHICLE_SEAT(entity, -1, true)
					if not IS_PED_A_PLAYER(pedofvehicle) then
						--if entities.request_control(pedofvehicle, 150) then
							repeat
								util.yield()
								time += 1
								ADD_EXPLOSION(position.x, position.y, position.z, explosiontype, 1, true, false, 0.0, false)
							until (GET_VEHICLE_ENGINE_HEALTH(entity) <= 0) or time == 500 or (not DOES_ENTITY_EXIST(entity))
						--end
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuveh, "Repair", {}, "", function()
	local data = renderESPveh(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if IS_VEHICLE_SEAT_FREE(entity, -1, false) then
				if entities.request_control(entity, 150) then
					STOP_ENTITY_FIRE(entity)
					SET_VEHICLE_FIXED(entity)
					SET_VEHICLE_DIRT_LEVEL(entity, 0)
				end
			else
				pedinseat = GET_PED_IN_VEHICLE_SEAT(entity, -1, true)
				if not IS_PED_A_PLAYER(pedinseat) then
					if entities.request_control(entity, 150) then
						STOP_ENTITY_FIRE(entity)
						SET_VEHICLE_FIXED(entity)
						SET_VEHICLE_DIRT_LEVEL(entity, 0)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.toggle_loop(actionSubmenuveh, "Freeze", {}, "", function()
	local data = renderESPveh(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if IS_VEHICLE_SEAT_FREE(entity, -1, false) then
				if entities.request_control(entity, 150) then
					FREEZE_ENTITY_POSITION(entity, true)
				end
			else
				pedinseat = GET_PED_IN_VEHICLE_SEAT(entity, -1, true)
				if not IS_PED_A_PLAYER(pedinseat) then
					if entities.request_control(entity, 150) then
						FREEZE_ENTITY_POSITION(entity, true)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.toggle_loop(actionSubmenuveh, "UN Freeze", {}, "", function()
	local data = renderESPveh(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if IS_VEHICLE_SEAT_FREE(entity, -1, false) then
				if entities.request_control(entity, 150) then
					FREEZE_ENTITY_POSITION(entity, false)
				end
			else
				pedinseat = GET_PED_IN_VEHICLE_SEAT(entity, -1, true)
				if not IS_PED_A_PLAYER(pedinseat) then
					if entities.request_control(entity, 150) then
						FREEZE_ENTITY_POSITION(entity, false)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)

local positionSubmenuveh = menu.list(Entitymanagerespvehicle, "position", {}, "")
xSliderveh = menu.slider(positionSubmenuveh, "XPos", {}, "", -10, 10, xValueveh, 1, function(val)
	xValueveh = val / 200
end)
--xValue = menu.get_value(xSlider) / 100
ySliderveh = menu.slider(positionSubmenuveh, "YPos", {}, "", -10, 10, yValueveh, 1, function(val)
	yValueveh = val / 200
end)
--yValue = menu.get_value(ySlider) / 100
scaleSliderveh = menu.slider(positionSubmenuveh, "scale", {}, "", 1, 200, scaleValueveh, 1, function(val)
	scaleValueveh = val / 100
end)
scaleValueveh = menu.get_value(scaleSliderveh) / 100

colorRefveh = menu.colour(Entitymanagerespvehicle, "color", {}, "", colorveh, true, function(c)
	colorveh = c
end)

maxDistSliderveh = menu.slider(Entitymanagerespvehicle, "max Dist", {"setdisvehicle"}, "", 10, 10000, maxDistanceveh, 10, function(val)
	maxDistanceveh = val
end)
maxDistanceveh = menu.get_value(maxDistSliderveh)

entitygroupToggleveh = menu.toggle(Entitymanagerespvehicle, "show Entity Group", {}, "", function(on)
	showentitygroupveh = on
end, showentitygroupveh)
showentitygroupveh = menu.get_value(entitygroupToggleveh)
distToggleveh = menu.toggle(Entitymanagerespvehicle, "show Distance", {}, "", function(on)
	showDistanceveh = on
end, showDistanceveh)
showDistanceveh = menu.get_value(distToggleveh)
nametoggleveh = menu.toggle(Entitymanagerespvehicle, "show Name", {}, "", function(on)
	shownameveh = on
end, shownameveh)
shownameveh = menu.get_value(nametoggleveh)
idnametoggleveh = menu.toggle(Entitymanagerespvehicle, "show ID Name", {}, "", function(on)
	showidnameveh = on
end, showidnameveh)
showidnameveh = menu.get_value(idnametoggleveh)
speedtoggleveh = menu.toggle(Entitymanagerespvehicle, "show Speed", {}, "", function(on)
	showspeedveh = on
end, showspeedveh)
showspeedveh = menu.get_value(speedtoggleveh)
showdrivertoggleveh = menu.toggle(Entitymanagerespvehicle, "show Driver", {}, "", function(on)
	showdriverveh = on
end, showdriverveh)
showdriverveh = menu.get_value(showdrivertoggleveh)
showinvehtoggleveh = menu.toggle(Entitymanagerespvehicle, "show In vehicle", {}, "", function(on)
	showinvehveh = on
end, showinvehveh)
showinvehveh = menu.get_value(showinvehtoggleveh)
myvehtoggleveh = menu.toggle(Entitymanagerespvehicle, "show My Vehicle", {}, "", function(on)
	showmyveh = on
end, showmyveh)
showmyveh = menu.get_value(myvehtoggleveh)
missiontoggleveh = menu.toggle(Entitymanagerespvehicle, "show Mission Entity", {}, "", function(on)
	showmissionveh = on
end, showmissionveh)
showmissionveh = menu.get_value(missiontoggleveh)
ownertoggleveh = menu.toggle(Entitymanagerespvehicle, "show Owner", {}, "", function(on)
	showownerveh = on
end, showownerveh)
showownerveh = menu.get_value(ownertoggleveh)
onlyotherownertoggleveh = menu.toggle(Entitymanagerespvehicle, "show only other Owners", {}, "", function(on)
	showonlyotherownerveh = on
end, showonlyotherownerveh)
showonlyotherownerveh = menu.get_value(onlyotherownertoggleveh)
destroyedtoggleveh = menu.toggle(Entitymanagerespvehicle, "show Destroyed vehicle", {}, "", function(on)
	showdestroyedveh = on
end, showdestroyedveh)
showdestroyedveh = menu.get_value(destroyedtoggleveh)

local enabledped, showonlymissionped = false, false
local xValueped, yValueped, scaleValueped = 0, 0, 35
local colorped = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
local maxDistanceped = 700
local showDistanceped, shownameped, showmissionped, showvehpedisinped, showownerped, showentitygroupped, showdeadped, 
getonlyvisibleped, showpedsinvehped, showonlyblibsped = true, true, true, true, false, true, false, false, true, false

	local function renderESPped(givedata)
		if not enabledped then
	        return false
	    end
		if not util.is_session_started() or IS_PAUSE_MENU_ACTIVE() then
			return
		end
		local data = {}
		local gameX, gameY = memory.alloc(1), memory.alloc(1)
	    local myPed = players.user_ped()
	    local myPos = players.get_position(players.user())
	    for _, peds in pairs(entities.get_all_peds_as_pointers()) do
			local pedshandle = entities.pointer_to_handle(peds)
	        if (not IS_ENTITY_ON_SCREEN(pedshandle)) and getonlyvisibleped then
	            goto continue
	        end
			local modelhash = entities.get_model_hash(peds)
	        local pPos = entities.get_position(peds)
	        local dist = myPos:distance(pPos)
			local ownerped =  players.get_name(entities.get_owner(pedshandle))
	        if (dist > maxDistanceped) then
	            goto continue
	        end
			local ispedinveh = IS_PED_IN_ANY_VEHICLE(pedshandle, false)
			local vehofped = GET_VEHICLE_PED_IS_IN(pedshandle, false)
			local vehmodelhash = entities.get_model_hash(vehofped)
			local missionentityped = IS_ENTITY_A_MISSION_ENTITY(pedshandle)
			ispeddead = IS_PED_DEAD_OR_DYING(pedshandle, 1)
			if IS_PED_A_PLAYER(pedshandle) then
				goto continue
			end
			if (not missionentityped) and showonlymissionped then
				goto continue
			end
			if not showdeadped and ispeddead then
				goto continue
			end
			if ispedinveh and not showpedsinvehped then
				goto continue
			end
			if showonlyblibsped and (GET_BLIP_FROM_ENTITY(pedshandle) == 0) then
				goto continue
			end
	        local posToUse = pPos
	        GET_SCREEN_COORD_FROM_WORLD_COORD(posToUse.x, posToUse.y, posToUse.z + 1, gameX, gameY)
	        local screenX, screenY = memory.read_float(gameX), memory.read_float(gameY)
	        local valuesToDisplay = {}
			if showentitygroupped then
	            valuesToDisplay[#valuesToDisplay + 1] = "PED"
	        end
			if showDistanceped then
	            valuesToDisplay[#valuesToDisplay + 1] = math.floor(dist)
	        end
			if shownameped then
	            local textLine = ""
	            if shownameped then
	                textLine = getmodelnamebyhash(modelhash) .. " "
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        if ispedinveh and showvehpedisinped then
				valuesToDisplay[#valuesToDisplay + 1] = "Vehicle: ".. getmodelnamebyhash(vehmodelhash)
			end
			if missionentityped and showmissionped then
				valuesToDisplay[#valuesToDisplay + 1] = "Mission Entity"
			end
			if showownerped then
				valuesToDisplay[#valuesToDisplay + 1] = "Owner: ".. ownerped
			end
	        local text = table.concat(valuesToDisplay, "\n")
			if not givedata then
	        	directx.draw_text(screenX + xValueped, screenY + yValueped, text, 5, scaleValueped, colorped, false)
			end
			if givedata then
				table.insert(data, pedshandle)
			end
			::continue::
	    end
		if givedata then
			return data
		end
	end
	
enabledToggleped = menu.toggle(Entitymanageresppeds, "Enable ESP Ped", {"ESPped"}, "", function(on_toggle)
	if on_toggle then
		enabledped = true
		if deactivateother then
			menu.trigger_commands("ESPveh off")
			menu.trigger_commands("ESPobject off")
			menu.trigger_commands("ESPpickup off")
		end
		util.create_tick_handler(renderESPped)
	else
		enabledped = false
	end
end)

onlymissionToggleped = menu.toggle(Entitymanageresppeds, "Show Only Mission", {}, "", function(on)
	showonlymissionped = on
end, showonlymissionped)
showonlymissionped = menu.get_value(onlymissionToggleped)
onlyblibsToggleped = menu.toggle(Entitymanageresppeds, "Show Only peds with blibs", {}, "", function(on)
	showonlyblibsped = on
end, showonlyblibsped)
showonlyblibsped = menu.get_value(onlyblibsToggleped)

local actionSubmenuped = menu.list(Entitymanageresppeds, "Action", {}, "action für die auf dennen ESP drauf ist")
local actionsettingsSubmenuped = menu.list(actionSubmenuped, "Settings", {}, "")
local explosionsettingped = menu.list_select(actionsettingsSubmenuped, "Explosion", {}, "Explosion wie haftbomben oder granaten haben eine grenze also nicht wundern", EXPLOSIONVARIATION, explosiontype, function(value)
	explosiontype = value
end)
onlyvisibleToggleped = menu.toggle(actionSubmenuped, "get only visible peds", {}, "", function(on)
	getonlyvisibleped = on
end, getonlyvisibleped)
getonlyvisibleped = menu.get_value(onlyvisibleToggleped)
menu.action(actionSubmenuped, "teleport to me", {}, "ignoriert spieler", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					if IS_PED_IN_ANY_VEHICLE(entity, false) then
						CLEAR_PED_TASKS_IMMEDIATELY(entity)
						TASK_LEAVE_ANY_VEHICLE(entity, 0, 16)
						SET_ENTITY_COORDS(entity, pPos.x, pPos.y, pPos.z)
					else
						SET_ENTITY_COORDS(entity, pPos.x, pPos.y, pPos.z)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "Delete", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					entities.delete(entity)
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "Explode", {}, "", function()
	local time = 0
	local data = renderESPped(true)
	if data then
		for data as entity do
			--local pointerent = entities.handle_to_pointer(entity)
			--local positon = entities.get_position(pointerent)
			local boneindex = GET_ENTITY_BONE_INDEX_BY_NAME(entity, "IK_Head")
			local position = GET_ENTITY_BONE_POSTION(entity, boneindex)
			if position ~= number then
				if not IS_PED_A_PLAYER(entity) then
					if GET_ENTITY_CAN_BE_DAMAGED(entity) then
						repeat
							util.yield()
							time += 1
							ADD_EXPLOSION(position.x, position.y, position.z, explosiontype, 1, true, false, 0.0, false)
						until (IS_PED_DEAD_OR_DYING(entity)) or time == 100 or (not DOES_ENTITY_EXIST(entity))
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "HEAL", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					maxhealth = GET_PED_MAX_HEALTH(entity)
					SET_ENTITY_HEALTH(entity, maxhealth, 0)
					STOP_ENTITY_FIRE(entity)
					CLEAR_PED_TASKS_IMMEDIATELY(entity)
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "silent kill", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					SET_ENTITY_HEALTH(entity, 0, 0)
					FORCE_PED_MOTION_STATE(entity, 0x0DBB071C, 0,0,0)
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "Clear Tasks", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					CLEAR_PED_TASKS_IMMEDIATELY(entity)
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "Freeze", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					FREEZE_ENTITY_POSITION(entity, true)
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "UN Freeze", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if entities.request_control(entity, 150) then
					FREEZE_ENTITY_POSITION(entity, false)
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuped, "Leave all vehicle", {}, "", function()
	local data = renderESPped(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if not IS_PED_A_PLAYER(entity) then
				if IS_PED_IN_ANY_VEHICLE(entity) then
					local getvehicle = GET_VEHICLE_PED_IS_IN(entity, false)
					if entities.request_control(entity, 150) then
						TASK_LEAVE_VEHICLE(entity, getvehicle, 16)
					end
				end
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)

local positionSubmenuped = menu.list(Entitymanageresppeds, "position", {}, "")
xSliderped = menu.slider(positionSubmenuped, "XPos", {}, "", -10, 10, xValueped, 1, function(val)
	xValueped = val / 200
end)
--xValue = menu.get_value(xSlider) / 100
ySliderped = menu.slider(positionSubmenuped, "YPos", {}, "", -10, 10, yValueped, 1, function(val)
	yValueped = val / 200
end)
--yValue = menu.get_value(ySlider) / 100
scaleSliderped = menu.slider(positionSubmenuped, "scale", {}, "", 1, 200, scaleValueped, 1, function(val)
	scaleValueped = val / 100
end)
scaleValueped = menu.get_value(scaleSliderped) / 100

colorRefped = menu.colour(Entitymanageresppeds, "color", {}, "", colorped, true, function(c)
	colorped = c
end)

maxDistSliderped = menu.slider(Entitymanageresppeds, "max Dist", {"setdisped"}, "", 10, 10000, maxDistanceped, 10, function(val)
	maxDistanceped = val
end)
maxDistanceped = menu.get_value(maxDistSliderped)

entitygroupToggleped = menu.toggle(Entitymanageresppeds, "show Entity Group", {}, "", function(on)
	showentitygroupped = on
end, showentitygroupped)
showentitygroupped = menu.get_value(entitygroupToggleped)
distToggleped = menu.toggle(Entitymanageresppeds, "show Distance", {}, "", function(on)
	showDistanceped = on
end, showDistanceped)
showDistanceped = menu.get_value(distToggleped)
nametoggleped = menu.toggle(Entitymanageresppeds, "show Name", {}, "", function(on)
	shownameped = on
end, shownameped)
shownameped = menu.get_value(nametoggleped)
pedsinvehtoggleped = menu.toggle(Entitymanageresppeds, "show Peds in vehicle", {}, "", function(on)
	showpedsinvehped = on
end, showpedsinvehped)
showpedsinvehped = menu.get_value(pedsinvehtoggleped)
vehpedisintoggleped = menu.toggle(Entitymanageresppeds, "show Vehicle PedIsIn", {}, "", function(on)
	showvehpedisinped = on
end, showvehpedisinped)
showvehpedisinped = menu.get_value(vehpedisintoggleped)
missiontoggleped = menu.toggle(Entitymanageresppeds, "show Mission Entity", {}, "", function(on)
	showmissionped = on
end, showmissionped)
showmissionped = menu.get_value(missiontoggleped)
deadtoggleped = menu.toggle(Entitymanageresppeds, "show dead peds", {}, "", function(on)
	showdeadped = on
end, showdeadped)
showdeadped = menu.get_value(deadtoggleped)
ownertoggleped = menu.toggle(Entitymanageresppeds, "show Owner", {}, "", function(on)
	showownerped = on
end, showownerped)
showownerped = menu.get_value(ownertoggleped)


local enabledobj, showonlymissionobj = false, false
local xValueobj, yValueobj, scaleValueobj = 0, 0, 35
local colorobj = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
local maxDistanceobj = 300
local showDistanceobj, shownameobj, showmissionobj, showownerobj, showattachtoobjobj, showattachtopedobj, 
showattachtovehobj, showentitygroupobj, getonlyvisibleobj = true, true, true, true, false, false, false, true, false

	local function renderESPobj(givedata)
		if not enabledobj then
	        return false
	    end
		if not util.is_session_started() or IS_PAUSE_MENU_ACTIVE() then
			return
		end
		local data = {}
		local gameX, gameY = memory.alloc(1), memory.alloc(1)
	    local myPed = players.user_ped()
	    local myPos = players.get_position(players.user())
	    for _, objs in pairs(entities.get_all_objects_as_pointers()) do
			local objshandle = entities.pointer_to_handle(objs)
	        if not IS_ENTITY_ON_SCREEN(objshandle) and getonlyvisibleobj then
	            goto continue
	        end
			local modelhash = entities.get_model_hash(objs)
	        local pPos = entities.get_position(objs)
	        local dist = myPos:distance(pPos)
			local ownerobj = players.get_name(entities.get_owner(objshandle))
			local missionentityobj = IS_ENTITY_A_MISSION_ENTITY(objshandle)
			local attachedobj = IS_ENTITY_ATTACHED_TO_ANY_OBJECT(objshandle)
			local attachedped = IS_ENTITY_ATTACHED_TO_ANY_PED(objshandle)
			local attachedveh = IS_ENTITY_ATTACHED_TO_ANY_VEHICLE(objshandle)
	        if (dist > maxDistanceobj) then
	            goto continue
	        end
			if (not missionentityobj) and showonlymissionobj then
				goto continue
			end
			if showattachtoobjobj or showattachtopedobj or showattachtovehobj then
				if attachedobj or attachedped or attachedveh then
					if attachedobj and showattachtoobjobj then
						goto checkdone
					end
					if attachedped and showattachtopedobj then
						goto checkdone
					end
					if attachedveh and showattachtovehobj then
						goto checkdone
					end
				end
				goto continue
			end
			--[[if not attachedobj and showattachtoobjobj then
				goto continue
			end
			if not attachedped and showattachtopedobj then
				goto continue
			end
			if not attachedveh and showattachtovehobj then
				goto continue
			end]]
			::checkdone::
	        local posToUse = pPos
	        GET_SCREEN_COORD_FROM_WORLD_COORD(posToUse.x, posToUse.y, posToUse.z + 1, gameX, gameY)
	        local screenX, screenY = memory.read_float(gameX), memory.read_float(gameY)
	        local valuesToDisplay = {}
			if showentitygroupobj then
	            valuesToDisplay[#valuesToDisplay + 1] = "OBJECT"
	        end
			if attachedobj and showattachtoobjobj then
	            valuesToDisplay[#valuesToDisplay + 1] = "Attached to OBJ"
	        end
			if attachedped and showattachtopedobj then
	            valuesToDisplay[#valuesToDisplay + 1] = "Attached to PED"
	        end
			if attachedveh and showattachtovehobj then
	            valuesToDisplay[#valuesToDisplay + 1] = "Attached to VEH"
	        end
			if showDistanceobj then
	            valuesToDisplay[#valuesToDisplay + 1] = math.floor(dist)
	        end
			if shownameobj then
	            local textLine = ""
	            if shownameobj then
	                textLine = getmodelnamebyhash(modelhash) .. " "
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
			if missionentityobj and showmissionobj then
				valuesToDisplay[#valuesToDisplay + 1] = "Mission Entity"
			end
			if showownerobj then
				valuesToDisplay[#valuesToDisplay + 1] = "Owner: ".. ownerobj
			end
	        local text = table.concat(valuesToDisplay, "\n")
			if not givedata then
	        	directx.draw_text(screenX + xValueobj, screenY + yValueobj, text, 5, scaleValueobj, colorobj, false)
			end
			if givedata then
				table.insert(data, objshandle)
			end
			::continue::
	    end
		if givedata then
			return data
		end
	end
	
enabledToggleobj = menu.toggle(Entitymanagerespobjects, "Enable ESP Objects", {"ESPobject"}, "", function(on_toggle)
	if on_toggle then
		enabledobj = true
		if deactivateother then
			menu.trigger_commands("ESPped off")
			menu.trigger_commands("ESPveh off")
			menu.trigger_commands("ESPpickup off")
		end
		util.create_tick_handler(renderESPobj)
	else
		enabledobj = false
	end
end)

onlymissionToggleobj = menu.toggle(Entitymanagerespobjects, "Show Only Mission", {}, "", function(on)
	showonlymissionobj = on
end, showonlymissionobj)
showonlymissionobj = menu.get_value(onlymissionToggleobj)
local actionSubmenuobj = menu.list(Entitymanagerespobjects, "Action", {}, "action für die auf dennen ESP drauf ist")
onlyvisibleToggleobj = menu.toggle(actionSubmenuobj, "get only visible OBJ", {}, "", function(on)
	getonlyvisibleobj = on
end, getonlyvisibleobj)
getonlyvisibleobj = menu.get_value(onlyvisibleToggleobj)
menu.action(actionSubmenuobj, "teleport to me", {}, "", function()
	local data = renderESPobj(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if entities.request_control(entity, 150) then
				SET_ENTITY_COORDS_NO_OFFSET(entity, pPos.x, pPos.y, pPos.z, false, false, false)
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenuobj, "Delete", {}, "", function()
	local data = renderESPobj(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if entities.request_control(entity, 150) then
				entities.delete(entity)
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)

local positionSubmenuobj = menu.list(Entitymanagerespobjects, "position", {}, "")
xSliderobj = menu.slider(positionSubmenuobj, "XPos", {}, "", -10, 10, xValueobj, 1, function(val)
	xValueobj = val / 200
end)
--xValue = menu.get_value(xSlider) / 100
ySliderobj = menu.slider(positionSubmenuobj, "YPos", {}, "", -10, 10, yValueobj, 1, function(val)
	yValueobj = val / 200
end)
--yValue = menu.get_value(ySlider) / 100
scaleSliderobj = menu.slider(positionSubmenuobj, "scale", {}, "", 1, 200, scaleValueobj, 1, function(val)
	scaleValueobj = val / 100
end)
scaleValueobj = menu.get_value(scaleSliderobj) / 100
colorRefobj = menu.colour(Entitymanagerespobjects, "color", {}, "", colorobj, true, function(c)
	colorobj = c
end)
maxDistSliderobj = menu.slider(Entitymanagerespobjects, "max Dist", {"setdisobject"}, "", 10, 10000, maxDistanceobj, 10, function(val)
	maxDistanceobj = val
end)
maxDistanceobj = menu.get_value(maxDistSliderobj)

entitygroupToggleobj = menu.toggle(Entitymanagerespobjects, "show Entity Group", {}, "", function(on)
	showentitygroupobj = on
end, showentitygroupobj)
showentitygroupobj = menu.get_value(entitygroupToggleobj)
distToggleobj = menu.toggle(Entitymanagerespobjects, "show Distance", {}, "", function(on)
	showDistanceobj = on
end, showDistanceobj)
showDistanceobj = menu.get_value(distToggleobj)
nametoggleobj = menu.toggle(Entitymanagerespobjects, "show Name", {}, "", function(on)
	shownameobj = on
end, shownameobj)
shownameobj = menu.get_value(nametoggleobj)
missiontoggleobj = menu.toggle(Entitymanagerespobjects, "show Mission Entity", {}, "", function(on)
	showmissionobj = on
end, showmissionobj)
showmissionobj = menu.get_value(missiontoggleobj)
ownertoggleobj = menu.toggle(Entitymanagerespobjects, "show Owner", {}, "", function(on)
	showownerobj = on
end, showownerobj)
showownerobj = menu.get_value(ownertoggleobj)
attachtoobjtoggleobj = menu.toggle(Entitymanagerespobjects, "show Only Attachted Obj to Obj", {}, "", function(on)
	showattachtoobjobj = on
end, showattachtoobjobj)
showattachtoobjobj = menu.get_value(attachtoobjtoggleobj)
attachtopedtoggleobj = menu.toggle(Entitymanagerespobjects, "show Only Attachted Obj to Ped", {}, "", function(on)
	showattachtopedobj = on
end, showattachtopedobj)
showattachtopedobj = menu.get_value(attachtopedtoggleobj)
attachtovehtoggleobj = menu.toggle(Entitymanagerespobjects, "show Only Attachted Obj to Veh", {}, "", function(on)
	showattachtovehobj = on
end, showattachtovehobj)
showattachtovehobj = menu.get_value(attachtovehtoggleobj)

local enabledpickup, showonlymissionpickup = false, false
local xValuepickup, yValuepickup, scaleValuepickup = 0, 0, 35
local colorpickup = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
local maxDistancepickup = 1000
local showDistancepickup, shownamepickup, showmissionpickup, showownerpickup, showentitiygrouppickup, getonlyvisiblepickups = true, true, true, true, true, false

	local function renderESPpickup(givedata)
		if not enabledpickup then
	        return false
	    end
		if not util.is_session_started() or IS_PAUSE_MENU_ACTIVE() then
			return
		end
		local data = {}
		local gameX, gameY = memory.alloc(1), memory.alloc(1)
	    local myPed = players.user_ped()
	    local myPos = players.get_position(players.user())
	    for _, pickups in pairs(entities.get_all_pickups_as_pointers()) do
			local pickupshandle = entities.pointer_to_handle(pickups)
	        if not IS_ENTITY_ON_SCREEN(pickupshandle) and getonlyvisiblepickups then
	            goto continue
	        end
			local modelhash = entities.get_model_hash(pickups)
	        local pPos = entities.get_position(pickups)
	        local dist = myPos:distance(pPos)
			local ownerpickup = players.get_name(entities.get_owner(pickupshandle))
			local missionentitypickup = IS_ENTITY_A_MISSION_ENTITY(pickupshandle)
	        if (dist > maxDistancepickup) then
	            goto continue
	        end
			if (not missionentitypickup) and showonlymissionpickup then
				goto continue
			end
	        local posToUse = pPos
	        GET_SCREEN_COORD_FROM_WORLD_COORD(posToUse.x, posToUse.y, posToUse.z + 1, gameX, gameY)
	        local screenX, screenY = memory.read_float(gameX), memory.read_float(gameY)
	        local valuesToDisplay = {}
			if showentitiygrouppickup then
	            valuesToDisplay[#valuesToDisplay + 1] = "PICKUP"
	        end
			if showDistancepickup then
	            valuesToDisplay[#valuesToDisplay + 1] = math.floor(dist)
	        end
			if shownamepickup then
	            local textLine = ""
	            if shownamepickup then
	                textLine = getmodelnamebyhash(modelhash) .. " "
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
			if missionentitypickup and showmissionpickup then
				valuesToDisplay[#valuesToDisplay + 1] = "Mission Entity"
			end
			if showownerpickup then
				valuesToDisplay[#valuesToDisplay + 1] = "Owner: ".. ownerpickup
			end
	        local text = table.concat(valuesToDisplay, "\n")
			if not givedata then
	       		directx.draw_text(screenX + xValuepickup, screenY + yValuepickup, text, 5, scaleValuepickup, colorpickup, false)
			end
			if givedata then
				table.insert(data, pickupshandle)
			end
			::continue::
		end
		if givedata then
			return data
		end
	end
	
enabledTogglepickup = menu.toggle(Entitymanageresppickups, "Enable ESP Pickups", {"ESPpickup"}, "", function(on_toggle)
	if on_toggle then
		enabledpickup = true
		if deactivateother then
			menu.trigger_commands("ESPped off")
			menu.trigger_commands("ESPobject off")
			menu.trigger_commands("ESPveh off")
		end
		util.create_tick_handler(renderESPpickup)
	else
		enabledpickup = false
	end
end)

onlymissionTogglepickup = menu.toggle(Entitymanageresppickups, "Show Only Mission", {}, "", function(on)
	showonlymissionpickup = on
end, showonlymissionpickup)
showonlymissionpickup = menu.get_value(onlymissionTogglepickup)

local actionSubmenupickups = menu.list(Entitymanageresppickups, "Action", {}, "action für die auf dennen ESP drauf ist")
onlyvisibleTogglepickups = menu.toggle(actionSubmenupickups, "get only visible vehs", {}, "", function(on)
	getonlyvisiblepickups = on
end, getonlyvisiblepickups)
getonlyvisiblepickups = menu.get_value(onlyvisibleTogglepickups)
menu.action(actionSubmenupickups, "teleport to me", {}, "", function()
	local data = renderESPpickup(true)
	if data then
		pPos = players.get_position(players.user())
		for data as entity do
			if entities.request_control(entity, 150) then
				SET_ENTITY_COORDS(entity, pPos.x, pPos.y, pPos.z)
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)
menu.action(actionSubmenupickups, "Delete", {}, "", function()
	local data = renderESPpickup(true)
	if data then
		for data as entity do
			if entities.request_control(entity, 150) then
				entities.delete(entity)
			end
		end
	else
		util.toast("du musst zuerst das ESP an machen dafür")
	end
end)

local positionSubmenupickup = menu.list(Entitymanageresppickups, "position", {}, "")
xSliderpickup = menu.slider(positionSubmenupickup, "XPos", {}, "", -10, 10, xValuepickup, 1, function(val)
	xValuepickup = val / 200
end)
--xValue = menu.get_value(xSlider) / 100
ySliderpickup = menu.slider(positionSubmenupickup, "YPos", {}, "", -10, 10, yValuepickup, 1, function(val)
	yValuepickup = val / 200
end)
--yValue = menu.get_value(ySlider) / 100
scaleSliderpickup = menu.slider(positionSubmenupickup, "scale", {}, "", 1, 200, scaleValuepickup, 1, function(val)
	scaleValuepickup = val / 100
end)
scaleValuepickup = menu.get_value(scaleSliderpickup) / 100

colorRefpickup = menu.colour(Entitymanageresppickups, "color", {}, "", colorpickup, true, function(c)
	colorpickup = c
end)

maxDistSliderpickup = menu.slider(Entitymanageresppickups, "max Dist", {"setdispickup"}, "", 10, 10000, maxDistancepickup, 10, function(val)
	maxDistancepickup = val
end)
maxDistancepickup = menu.get_value(maxDistSliderpickup)

entitygroupTogglepickup = menu.toggle(Entitymanageresppickups, "show Entity Group", {}, "", function(on)
	showentitiygrouppickup = on
end, showentitiygrouppickup)
showentitiygrouppickup = menu.get_value(entitygroupTogglepickup)
distTogglepickup = menu.toggle(Entitymanageresppickups, "show Distance", {}, "", function(on)
	showDistancepickup = on
end, showDistancepickup)
showDistancepickup = menu.get_value(distTogglepickup)
nametogglepickup = menu.toggle(Entitymanageresppickups, "show Name", {}, "", function(on)
	shownamepickup = on
end, shownamepickup)
shownamepickup = menu.get_value(nametogglepickup)
missiontogglepickup = menu.toggle(Entitymanageresppickups, "show Mission Entity", {}, "", function(on)
	showmissionpickup = on
end, showmissionpickup)
showmissionpickup = menu.get_value(missiontogglepickup)
ownertogglepickup = menu.toggle(Entitymanageresppickups, "show Owner", {}, "", function(on)
	showownerpickup = on
end, showownerpickup)
showownerpickup = menu.get_value(ownertogglepickup)




local vehicledata = {}
local pedsdata = {}
local objectsdata = {}
local pickupdata = {}
local searchnearveh = ""
local searchnearpeds = ""
local searchnearobjects = ""
local searchnearpickups = ""
local Entitymanagernearvehiclevehicles = menu.list(Entitymanagernearvehicle, "vehicles", {}, "", function(on_click)
	menu.set_value(enabledToggnearvehicle, true)
end, function(on_back)
	menu.set_value(enabledToggnearvehicle, false)
end)
local Entitymanagernearvehiclepeds = menu.list(Entitymanagernearvehicle, "Peds", {}, "", function(on_click)
	menu.set_value(enabledToggnearpeds, true)
end, function(on_back)
	menu.set_value(enabledToggnearpeds, false)
end)
local Entitymanagernearvehicleobjects = menu.list(Entitymanagernearvehicle, "Objects", {}, "", function(on_click)
	menu.set_value(enabledToggnearobjects, true)
end, function(on_back)
	menu.set_value(enabledToggnearobjects, false)
end)
local Entitymanagernearvehiclepickup = menu.list(Entitymanagernearvehicle, "Pickups", {}, "", function(on_click)
	menu.set_value(enabledToggnearpickups, true)
end, function(on_back)
	menu.set_value(enabledToggnearpickups, false)
end)

menu.text_input(Entitymanagernearvehiclevehicles, "Search", {"Searchnearveh"}, "", function(input)
	searchnearveh = input
	if not searchnearveh ~= number then
		searchnearveh = searchnearveh:lower()
	end
end)
menu.text_input(Entitymanagernearvehiclepeds, "Search", {"Searchnearpeds"}, "", function(input)
	searchnearpeds = input
	if not searchnearpeds ~= number then
		searchnearpeds = searchnearpeds:lower()
	end
end)
menu.text_input(Entitymanagernearvehicleobjects, "Search", {"Searchnearobjects"}, "", function(input)
	searchnearobjects = input
	if not searchnearobjects ~= number then
		searchnearobjects = searchnearobjects:lower()
	end
end)
menu.text_input(Entitymanagernearvehiclepickup, "Search", {"Searchnearpickups"}, "", function(input)
	searchnearpickups = input
	if not searchnearpickups ~= number then
		searchnearpickups = searchnearpickups:lower()
	end
end)

local Entitymanagernearvehicleallveh = menu.list(Entitymanagernearvehiclevehicles, "Action for all Vehicle", {}, "")
menu.action(Entitymanagernearvehicleallveh, "Teleport to me", {}, "", function()
	for vehicledata as vehhandle do
		local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, 0)
		if getcontrole(vehhandle) then
			SET_ENTITY_AS_MISSION_ENTITY(vehhandle)
			SET_ENTITY_COORDS_NO_OFFSET(vehhandle, mypos.x, mypos.y, mypos.z, false, false, false)
			util.yield(10)
			FREEZE_ENTITY_POSITION(vehhandle, true)
			FREEZE_ENTITY_POSITION(vehhandle, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.divider(Entitymanagernearvehicleallveh, "Trolling")
menu.action(Entitymanagernearvehicleallveh, "Explode", {}, "", function()
	for vehicledata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			ADD_EXPLOSION(ePos.x, ePos.y, ePos.z, 2, 1, true, false, 0.0, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Delete", {}, "", function()
	for vehicledata as vehhandle do
			entities.delete(vehhandle)
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Freeze ON", {}, "", function()
	for vehicledata as vehhandle do
		if getcontrole(vehhandle) then
			FREEZE_ENTITY_POSITION(vehhandle, true)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Freeze OFF", {}, "", function()
	for vehicledata as vehhandle do
		if getcontrole(vehhandle) then
			FREEZE_ENTITY_POSITION(vehhandle, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Kick Peds of Vehicle", {}, "", function()
	for vehicledata as vehhandle do
		local pedsinveh = getpedsinvehicle(vehhandle)
		if pedsinveh != 0 then
			for pedsinveh as pedsinveh1 do
				if not IS_PED_A_PLAYER(pedsinveh1) then
					if getcontrole(pedsinveh1) and getcontrole(vehhandle) then
						TASK_LEAVE_VEHICLE(pedsinveh1, vehhandle, 16)
						CLEAR_PED_TASKS_IMMEDIATELY(pedsinveh1)
					end
				end
			end
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Delete Peds of Vehicle", {}, "", function()
	for vehicledata as vehhandle do
		local pedsinveh = getpedsinvehicle(vehhandle)
		if pedsinveh != 0 then
			for pedsinveh as pedsinveh1 do
				if not IS_PED_A_PLAYER(pedsinveh1) then
					entities.delete(pedsinveh1)
				end
			end
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Remove wheels", {}, "", function()
	for vehicledata as vehhandle do
		if getcontrole(vehhandle) then
			for i=0, 7 do
				SET_VEHICLE_TYRE_BURST(vehhandle, i, true, 0)
				entities.detach_wheel(vehhandle, i)
			end
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.divider(Entitymanagernearvehicleallveh, "Friendly")
menu.action(Entitymanagernearvehicleallveh, "Give Godmode", {}, "", function()
	for vehicledata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			SET_ENTITY_INVINCIBLE(vehhandle, true)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Remove Godmode", {}, "", function()
	for vehicledata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			SET_ENTITY_INVINCIBLE(vehhandle, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallveh, "Repair", {}, "", function()
	for vehicledata as vehhandle do
		if getcontrole(vehhandle) then
			STOP_ENTITY_FIRE(vehhandle)
			SET_VEHICLE_FIXED(vehhandle)
			SET_VEHICLE_DIRT_LEVEL(vehhandle, 0)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)

local Entitymanagernearvehicleallpeds = menu.list(Entitymanagernearvehiclepeds, "Action for all Peds", {}, "")
menu.action(Entitymanagernearvehicleallpeds, "Teleport to me", {}, "", function()
	for pedsdata as vehhandle do
		local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +2, 0)
		if getcontrole(vehhandle) then
			SET_ENTITY_AS_MISSION_ENTITY(vehhandle)
			SET_ENTITY_COORDS_NO_OFFSET(vehhandle, mypos.x, mypos.y, mypos.z, false, false, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.divider(Entitymanagernearvehicleallpeds, "Trolling")
menu.action(Entitymanagernearvehicleallpeds, "Delete", {}, "", function()
	for pedsdata as vehhandle do
			entities.delete(vehhandle)
	end
end)
menu.action(Entitymanagernearvehicleallpeds, "Explode", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			ADD_EXPLOSION(ePos.x, ePos.y, ePos.z, 2, 1, true, false, 0.0, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallpeds, "Kill", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			SET_ENTITY_HEALTH(vehhandle, 0, 0)
			FORCE_PED_MOTION_STATE(vehhandle, 0x0DBB071C, 0,0,0)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallpeds, "Freeze ON", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			FREEZE_ENTITY_POSITION(vehhandle, true)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallpeds, "Freeze OFF", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			FREEZE_ENTITY_POSITION(vehhandle, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.divider(Entitymanagernearvehicleallpeds, "Friendly")
menu.action(Entitymanagernearvehicleallpeds, "Heal/Revive", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		local ispeddead = IS_PED_DEAD_OR_DYING(vehhandle)
		if getcontrole(vehhandle) then
			maxhealth = GET_PED_MAX_HEALTH(vehhandle)
			SET_ENTITY_HEALTH(vehhandle, maxhealth, 0)
			STOP_ENTITY_FIRE(vehhandle)
			if ispeddead then
				CLEAR_PED_TASKS_IMMEDIATELY(vehhandle)
			end
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallpeds, "Give Godmode", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			SET_ENTITY_INVINCIBLE(vehhandle, true)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallpeds, "Remove Godmode", {}, "", function()
	for pedsdata as vehhandle do
		local vehpointer = entities.handle_to_pointer(vehhandle)
		local ePos = entities.get_position(vehpointer)
		if getcontrole(vehhandle) then
			SET_ENTITY_INVINCIBLE(vehhandle, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.divider(Entitymanagernearvehicleallpeds, "Misc")
menu.action(Entitymanagernearvehicleallpeds, "Clear Tasks", {}, "", function()
	for pedsdata as vehhandle do
		if getcontrole(vehhandle) then
			CLEAR_PED_TASKS_IMMEDIATELY(vehhandle)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)

local Entitymanagernearvehicleallobjects = menu.list(Entitymanagernearvehicleobjects, "Action for all Objects", {}, "")
menu.action(Entitymanagernearvehicleallobjects, "Teleport to me", {}, "", function()
	for objectsdata as vehhandle do
		local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +2, 0)
		if getcontrole(vehhandle) then
			SET_ENTITY_COORDS_NO_OFFSET(vehhandle, mypos.x, mypos.y, mypos.z, false, false, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallobjects, "Delete", {}, "", function()
	for objectsdata as vehhandle do
			entities.delete(vehhandle)
	end
end)

local Entitymanagernearvehicleallpickups = menu.list(Entitymanagernearvehiclepickup, "Action for all Pickups", {}, "")
menu.action(Entitymanagernearvehicleallpickups, "Teleport to me", {}, "", function()
	for pickupdata as vehhandle do
		local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +2, 0)
		if getcontrole(vehhandle) then
			SET_ENTITY_COORDS_NO_OFFSET(vehhandle, mypos.x, mypos.y, mypos.z, false, false, false)
		else
			util.toast("konnte keine kontrolle bekommen")
		end
	end
end)
menu.action(Entitymanagernearvehicleallpickups, "Delete", {}, "", function()
	for pickupdata as vehhandle do
			entities.delete(vehhandle)
	end
end)


local Entitymanagernearvehicleirgnore = menu.list(Entitymanagernearvehicle, "Igrnoriere das", {}, "die sachen werden dann geladen wenn du da drauf drückst also das brauchst du nicht")

local maxDistancenearentitys = 200
local onlymissionnearentitys, showplayersnearentitys, showonlyblibsnearentitys, switchsearchnearentitys, showdebugginfosnearentitys, showarsignalnearentitys = false, true, false, false, true, true
local seattable = {}
local seatzaehlerofseats = 0

local function getnearvehicle()
	if not enablednearvehicle then
		for vehicledata as vehhandle do
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.delete(veh[vehhandle])
			end
		end
		vehicledata = {}
		return false
	end
	if not menu.is_open() then
		return
	end
	if util.is_session_transition_active() then
		return
	end
	local allpointer = entities.get_all_vehicles_as_pointers()
	for _, vehpointer in pairs(allpointer) do
		local vehhandle = entities.pointer_to_handle(vehpointer)
		local modelhash = entities.get_model_hash(vehhandle)
		local pPos = players.get_position(players.user())
		local ePos = entities.get_position(vehpointer)
		local dist = math.floor(pPos:distance(ePos))
		local modelname = getmodelnamebyhash(modelhash)
		local infodist = pPos:distance(ePos)
		local ismissionentity = IS_ENTITY_A_MISSION_ENTITY(vehhandle)
		local vehicleclassbyhandle = classes[GET_VEHICLE_CLASS(vehhandle)]
		local textline = modelname.. "  [".. dist.. "]"
		local infotextline = modelname.. " {"..vehicleclassbyhandle.."}\nDist: ".. dist
		local createmenus = true
		if onlymissionnearentitys and not ismissionentity then
			goto continue
		end
		if infodist > maxDistancenearentitys then
			goto continue
		end
		if showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0) then
			goto continue
		end
		infotextline = infotextline.. "\nEngineHealth: ".. math.floor(GET_VEHICLE_ENGINE_HEALTH(vehhandle))
		infotextline = infotextline.. "\nVisible: ".. IS_ENTITY_VISIBLE(vehhandle)
		if not GET_ENTITY_CAN_BE_DAMAGED(vehhandle) then
			infotextline = infotextline..  "\nGOD: TRUE"
		else
			infotextline = infotextline.. "\nGOD: FALSE"
		end
		infotextline = infotextline.. "\nOwner: ".. players.get_name(entities.get_owner(vehhandle))
		local passangersinveh = ""
		if not IS_VEHICLE_SEAT_FREE(vehhandle, -1, false) then
			pedinveh = GET_PED_IN_VEHICLE_SEAT(vehhandle, -1, true)
			if IS_PED_A_PLAYER(pedinveh) then
				if showplayersnearentitys then
					local pidnameofp = players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(pedinveh))
					infotextline = infotextline.. "\nDriver: ".. pidnameofp
					textline = textline .. "  (PL ".. pidnameofp.. ")"
				else
					goto continue
				end
			end
		end
		if not IS_VEHICLE_SEAT_FREE(vehhandle, -1, false) or not IS_VEHICLE_SEAT_FREE(vehhandle, 0, false) or not IS_VEHICLE_SEAT_FREE(vehhandle, 1, false) then
			if IS_PED_A_PLAYER(GET_PED_IN_VEHICLE_SEAT(vehhandle, -1)) or IS_PED_A_PLAYER(GET_PED_IN_VEHICLE_SEAT(vehhandle, 0)) or IS_PED_A_PLAYER(GET_PED_IN_VEHICLE_SEAT(vehhandle, 1)) then
				local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehhandle)
				for i = 0, maxPassengers do
		 			if not IS_VEHICLE_SEAT_FREE(vehhandle, i, false) then
						local vehPed = GET_PED_IN_VEHICLE_SEAT(vehhandle, i)
						if IS_PED_A_PLAYER(vehPed) then
							passangersinveh = passangersinveh.. players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(vehPed)) .. ", "
						end
					end
	 			end
			end
		end
		if string.len(passangersinveh) > 0 then
			infotextline = infotextline.. "\nPassangers: ".. passangersinveh
		end
		if GET_VEHICLE_ENGINE_HEALTH(vehhandle) < 0 then
			textline = textline.. " {destroyed}"
		end
		if entities.get_user_personal_vehicle_as_handle() == vehhandle then
			textline = textline.. " personalveh"
		end
		if showdebugginfosnearentitys then
			infotextline = infotextline.. "\nModelhash: ".. modelhash.. "\nWorldPosition: " .. "X:" ..math.floor(ePos.x) .. " Y:" ..math.floor(ePos.y) .. " Z:" ..math.floor(ePos.z)
		end
		local textlinemain = textline
		textline = textline:lower()
		if switchsearchnearentitys then
			if string.match(string.replace(textline, "["..dist.."]", ""), searchnearveh) and string.len(searchnearveh) > 0 then
				createmenus = false
			end
		else
			if not string.match(string.replace(textline, "["..dist.."]", ""), searchnearveh) then
				createmenus = false
			end
		end
		if not table.contains(vehicledata, vehhandle) then
			if createmenus then
			table.insert(vehicledata, vehhandle)
			veh[vehhandle] = menu.list(Entitymanagernearvehiclevehicles, textlinemain, {"nearveh".. modelname}, infotextline )
			local numbertimercall = 0
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to Vehicle", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local entitypPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entityhandle, 0, 0, +2)
				local vehofpedm = GET_VEHICLE_PED_IS_IN(players.user_ped())
				SET_ENTITY_AS_MISSION_ENTITY(entityhandle)
				if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) and (GET_PED_IN_VEHICLE_SEAT(vehofpedm, -1, true) == players.user_ped()) then
					SET_ENTITY_COORDS_NO_OFFSET(vehofpedm, entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
				else
					SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport into (driver) Vehicle", {}, infotextline, function()
				local timer = 0
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local entitypPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entityhandle, -2, 0, 0)
				if IS_VEHICLE_SEAT_FREE(entityhandle, -1) then
					SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, -1)
				else
					local pedinseat = GET_PED_IN_VEHICLE_SEAT(entityhandle, -1)
					if IS_PED_A_PLAYER(pedinseat) then
						menu.trigger_commands("vehkick"..players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(pedinseat)))
						repeat
							util.yield()
							seatfree = IS_VEHICLE_SEAT_FREE(entityhandle, -1)
							if seatfree then
								util.yield(50)
								levideaktivate()
								SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, -1)
							end
							pedinseat1 = GET_PED_IN_VEHICLE_SEAT(entityhandle, -1)
							timer += 1
						until pedinseat1 == players.user_ped() or timer == 500
						if timer > 499 then
							util.toast("konnte ihn nicht aus dem auto kicken")
						end
					else
						entities.delete(pedinseat)
						repeat
							util.yield()
							seatfree = IS_VEHICLE_SEAT_FREE(entityhandle, -1)
							if seatfree then
								util.yield(50)
								levideaktivate()
								SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, -1)
							end
							pedinseat1 = GET_PED_IN_VEHICLE_SEAT(entityhandle, -1)
							timer += 1
						until seatfree or timer == 500
						if timer > 499 then
							util.toast("NPC konnte nicht gelöscht werden")
						end
					end
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport into (any free seat) Vehicle", {}, infotextline, function()
				local timer = 0
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local entitypPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entityhandle, -2, 0, 0)
				freeseat = getfreevehsteat(entityhandle)
				if freeseat ~= number then
					SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, freeseat)
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.list(veh[vehhandle], "select seat to Teleport you in", {}, infotextline, function(on_click)
				local timer = 0
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local seattextline = ""
				local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(entityhandle) -1
				for i=-1, maxPassengers do
				 	seattextline = getseatname[i]
					if not IS_VEHICLE_SEAT_FREE(entityhandle, i) then
						local pedinseat = GET_PED_IN_VEHICLE_SEAT(entityhandle, i, true)
						if IS_PED_A_PLAYER(pedinseat) then
							seattextline = seattextline.. "  [pl ".. players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(pedinseat)).. "]"
						else
							if DOES_ENTITY_EXIST(pedinseat) then
								seattextline = seattextline.. "  [NPC]"
							end
						end
					end
					seatzaehlerofseats += 1
					seattable[seatzaehlerofseats] = menu.action(vehinfotab[vehhandle.. 4], seattextline, {"seatsvehicle"..seatzaehlerofseats}, "Sachen hier dirn werden sich nicht aktualisieren wenn du eine aktuelle liste haben willst verlass diese und dann geh wieder ein", function()
						local entityhandle = entityhandle
						local entitypointer = entitypointer
						local pPos = players.get_position(players.user())
						local ePos = entities.get_position(vehpointer)
						local dist = pPos:distance(ePos)
						local entitypPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entityhandle, 0, 0, 0)
						local seat = i
						if not IS_VEHICLE_SEAT_FREE(entityhandle, seat) then
							if not IS_PED_A_PLAYER(GET_PED_IN_VEHICLE_SEAT(entityhandle, seat)) then
								entities.delete(GET_PED_IN_VEHICLE_SEAT(entityhandle, seat))
							else
								if GET_PED_IN_VEHICLE_SEAT(entityhandle, seat) == players.user_ped() then
									util.toast("Du hockst da schon drin")
									goto end
								end
								menu.trigger_commands("vehkick".. players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(GET_PED_IN_VEHICLE_SEAT(entityhandle, seat))))
								repeat
									util.yield()
									timer += 1
									inseatplayer = IS_PED_A_PLAYER(GET_PED_IN_VEHICLE_SEAT(entityhandle, seat))
								until not inseatplayer or timer > 300
								if timer > 300 then
									util.toast("konnte nicht aus dem auto gekickt werden")
									timer = 0
									goto end
								end
							end
						end
							--if dist > 150 then
								--SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
							--	util.yield(20)
							--end
							SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, seat)
					::end::
					end)
				end
			end, function(on_back)
				for i=1, seatzaehlerofseats do
					if menu.is_ref_valid(seattable[i]) then
						menu.delete(seattable[i])
					end
				end
				seatzaehlerofseats = 0
				seattable = {}
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to me", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, 0)
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					SET_ENTITY_COORDS_NO_OFFSET(entityhandle, mypos.x, mypos.y, mypos.z, false, false, false)
					util.yield(10)
					FREEZE_ENTITY_POSITION(vehhandle, true)
					FREEZE_ENTITY_POSITION(vehhandle, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			menu.divider(veh[vehhandle], "Trolling")
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Explode", {}, infotextline, function()
				local timer = 0
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, 0)
				local entitypPos = entities.get_position(entitypointer)
				local canbedamaged = GET_ENTITY_CAN_BE_DAMAGED(entityhandle)
				--if getcontrole(entityhandle) then
					ADD_EXPLOSION(entitypPos.x, entitypPos.y, entitypPos.z, 2, 1, true, false, 0.0, false)
					if GET_VEHICLE_ENGINE_HEALTH(entityhandle) > 0 and canbedamaged then
						repeat
							util.yield()
							ADD_EXPLOSION(entitypPos.x, entitypPos.y, entitypPos.z, 2, 1, true, false, 0.0, false)
							vehiclehealth = GET_VEHICLE_ENGINE_HEALTH(entityhandle)
							timer += 1
						until vehiclehealth < 0 or timer > 250
					end
				--else
				--	util.toast("konnte keine kontrolle bekommen")
				--end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Delete", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
					entities.delete(entityhandle)
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Freeze ON", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					FREEZE_ENTITY_POSITION(entityhandle, true)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Freeze OFF", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					FREEZE_ENTITY_POSITION(entityhandle, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Kick peds of vehicle", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				local pedsinveh = getpedsinvehicle(entityhandle)
				if pedsinveh != 0 then
					for pedsinveh as pedsinveh1 do
						if not IS_PED_A_PLAYER(pedsinveh1) then
							if getcontrole(pedsinveh1) and getcontrole(entityhandle) then
								TASK_LEAVE_VEHICLE(pedsinveh1, entityhandle, 16)
							end
						end
					end
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Delete peds of vehicle", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				local pedsinveh = getpedsinvehicle(entityhandle)
				if pedsinveh != 0 then
					for pedsinveh as pedsinveh1 do
						if not IS_PED_A_PLAYER(pedsinveh1) then
							entities.delete(pedsinveh1)
						end
					end
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Remove wheels", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				if getcontrole(entityhandle) then
					for i=0, 7 do
						SET_VEHICLE_TYRE_BURST(entityhandle, i, true, 0)
						entities.detach_wheel(entityhandle, i)
					end
				end
			end)
			menu.divider(veh[vehhandle], "Friendly")
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Give Godmode", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, 0)
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					SET_ENTITY_INVINCIBLE(entityhandle, true)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Remove Godmode", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, 0)
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					SET_ENTITY_INVINCIBLE(entityhandle, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Repair", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, 0)
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					STOP_ENTITY_FIRE(entityhandle)
					SET_VEHICLE_FIXED(entityhandle)
					SET_VEHICLE_DIRT_LEVEL(entityhandle, 0)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			menu.divider(veh[vehhandle], "Misc")
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Copy vehicle", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				local pedsinveh = getpedsinvehicle(entityhandle)
				local clonedvehicle = clonevehicle(entityhandle)
				SET_ENTITY_COORDS(clonedvehicle, mypos.x, mypos.y, mypos.z)
				SET_PED_INTO_VEHICLE(players.user_ped(), clonedvehicle, -1)
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.text_input(veh[vehhandle], "Save Vehicle", {"save"..modelname}, infotextline, function(input)
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				freeseat = getfreevehsteat(entityhandle)
				if freeseat ~= number then
					if IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
						local vehicleofped = GET_VEHICLE_PED_IS_IN(players.user_ped())
						local seatofplayer = getseatofplayer(vehicleofped)
						SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, freeseat)
						util.yield(20)
						menu.trigger_commands("savevehicle "..input)
						util.yield(20)
						if DOES_ENTITY_EXIST(vehicleofped) then
							if IS_VEHICLE_SEAT_FREE(vehicleofped, seatofplayer, false) then
								SET_PED_INTO_VEHICLE(players.user_ped(), vehicleofped, seatofplayer)
							else
								getfreesetincar = getfreevehsteat(vehicleofped)
								if getfreesetincar ~= number then
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleofped, getfreesetincar)
								else
									SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), mypos, false, false, false)
								end
							end
						end
					else
						SET_PED_INTO_VEHICLE(players.user_ped(), entityhandle, freeseat)
						util.yield(20)
						menu.trigger_commands("savevehicle "..input)
						util.yield(10)
						SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), mypos, false, false, false)
					end
				end
				menu.set_value(menu.ref_by_command_name("save"..modelname), "")
			end)
			end
		else
			if showarsignalnearentitys and menu.is_focused(veh[vehhandle]) then
				util.draw_ar_beacon(ePos)
			end
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.set_menu_name(veh[vehhandle], textlinemain)
				if menu.get_help_text(veh[vehhandle]) != infotextline and menu.is_focused(veh[vehhandle]) then
					menu.set_help_text(veh[vehhandle], infotextline)
				end
			end
			for i = 1, 17 do
				if menu.is_focused(vehinfotab[vehhandle.. i]) then
					if menu.is_ref_valid(vehinfotab[vehhandle.. i]) then
						if showarsignalnearentitys and menu.is_focused(vehinfotab[vehhandle.. i]) then
							util.draw_ar_beacon(ePos)
						end
						if menu.get_help_text(vehinfotab[vehhandle.. i]) != infotextline then
							menu.set_help_text(vehinfotab[vehhandle.. i], infotextline)
						end
					end
				end
			end
		end
		::continue::
	end
	for vehicledata as vehhandle do
		if DOES_ENTITY_EXIST(vehhandle) then
			local vehpointer = entities.handle_to_pointer(vehhandle)
			local pPos = players.get_position(players.user())
			local ePos = entities.get_position(vehpointer)
			local infodist = pPos:distance(ePos)
			local textline = menu.get_menu_name(veh[vehhandle])
			textline = textline:lower()
			local dist = string.strip(textline, "[]")
			if switchsearchnearentitys then
				stringmatcher = string.match(string.replace(textline, "["..dist.."]", ""), searchnearveh) and string.len(searchnearveh) > 0
			else
				stringmatcher = not string.match(string.replace(textline, "["..dist.."]", ""), searchnearveh)
			end
			if (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) or (infodist > maxDistancenearentitys) or (stringmatcher) or (showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0)) then
				if menu.is_ref_valid(veh[vehhandle]) then
					menu.delete(veh[vehhandle])
					for a, msg in ipairs(vehicledata) do
						if msg == vehhandle then
							table.remove(vehicledata, a)
						end
					end
				end
			end
		elseif not DOES_ENTITY_EXIST(vehhandle) or (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) then
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.delete(veh[vehhandle])
				for a, msg in ipairs(vehicledata) do
					if msg == vehhandle then
						table.remove(vehicledata, a)
					end
				end
			end
		end
	end
	::end::
end

local function getnearpeds()
	if not enablednearpeds then
		for pedsdata as vehhandle do
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.delete(veh[vehhandle])
			end
		end
		pedsdata = {}
		return false
	end
	if not menu.is_open() then
		return
	end
	if util.is_session_transition_active() then
		return
	end
	local allpointer = entities.get_all_peds_as_pointers()
	for _, vehpointer in pairs(allpointer) do
		local vehhandle = entities.pointer_to_handle(vehpointer)
		local modelhash = entities.get_model_hash(vehhandle)
		local pPos = players.get_position(players.user())
		local ePos = entities.get_position(vehpointer)
		local dist = math.floor(pPos:distance(ePos))
		local modelname = getmodelnamebyhash(modelhash)
		local infodist = pPos:distance(ePos)
		local ismissionentity = IS_ENTITY_A_MISSION_ENTITY(vehhandle)
		local textline = modelname.. "  [".. dist.. "]"
		local infotextline = modelname.. "\nDist: ".. dist
		local createmenus = true
		if onlymissionnearentitys and not ismissionentity then
			goto continue
		end
		if infodist > maxDistancenearentitys then
			goto continue
		end
		if vehhandle == players.user_ped() then
			goto continue
		end
		if showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0) then
			goto continue
		end
		if IS_PED_A_PLAYER(vehhandle) then
			if showplayersnearentitys then
				local pidnameofp = players.get_name(NETWORK_GET_PLAYER_INDEX_FROM_PED(vehhandle))
				textline = "(pl "..pidnameofp .. ")  [".. dist.. "]"
				infotextline = pidnameofp.. "\nDist: ".. dist
			else
				goto continue
			end
		end
		infotextline = infotextline.. "\nHealth: ".. GET_ENTITY_HEALTH(vehhandle)
		infotextline = infotextline.. "\nArmour: ".. GET_PED_ARMOUR(vehhandle)
		if IS_PED_ARMED(vehhandle ,7) then
			infotextline = infotextline.. "\nWeapon out?: True"
		else
			infotextline = infotextline.. "\nWeapon out?: False"
		end
		infotextline = infotextline.. "\nVisible: ".. IS_ENTITY_VISIBLE(vehhandle)
		if not GET_ENTITY_CAN_BE_DAMAGED(vehhandle) then
			infotextline = infotextline..  "\nGOD: TRUE"
		else
			infotextline = infotextline.. "\nGOD: FALSE"
		end
		if IS_PED_IN_ANY_VEHICLE(vehhandle, false) then
			textline = textline.. " {in veh}"
			infotextline = infotextline.. "\nVehicle: ".. getmodelnamebyhash(entities.get_model_hash(GET_VEHICLE_PED_IS_IN(vehhandle)))
		end
		if IS_PED_DEAD_OR_DYING(vehhandle) then
			textline = textline.. " {dead}"
		end
		if showdebugginfosnearentitys then
			infotextline = infotextline.. "\nModelhash: ".. modelhash.. "\nWorldPosition: " .. "X:" ..math.floor(ePos.x) .. " Y:" ..math.floor(ePos.y) .. " Z:" ..math.floor(ePos.z)
		end
		textlinemain = textline
		textline = textline:lower()
		if switchsearchnearentitys then
			if string.match(string.replace(textline, "["..dist.."]", ""), searchnearpeds) and string.len(searchnearpeds) > 0 then
				createmenus = false
			end
		else
			if not string.match(string.replace(textline, "["..dist.."]", ""), searchnearpeds) then
				createmenus = false
			end
		end
		if not table.contains(pedsdata, vehhandle) then
			if createmenus then
			table.insert(pedsdata, vehhandle)
			veh[vehhandle] = menu.list(Entitymanagernearvehiclepeds, textlinemain, {}, infotextline)
			local numbertimercall = 0
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to Ped", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local entitypPos = entities.get_position(entitypointer)
				local vehofpedm = GET_VEHICLE_PED_IS_IN(players.user_ped())
				SET_ENTITY_AS_MISSION_ENTITY(entityhandle)
				if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) and (GET_PED_IN_VEHICLE_SEAT(vehofpedm, -1, true) == players.user_ped()) then
					SET_ENTITY_COORDS_NO_OFFSET(vehofpedm, entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
				else
					SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to me", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +2, 0)
				mypos.z = get_ground_z(mypos) +1
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					SET_ENTITY_COORDS_NO_OFFSET(entityhandle, mypos.x, mypos.y, mypos.z, false, false, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			menu.divider(veh[vehhandle], "Trolling")
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Delete", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
					entities.delete(entityhandle)
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Explode", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				ADD_EXPLOSION(entitypPos.x, entitypPos.y, entitypPos.z, 2, 1, true, false, 0.0, false)
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Kill", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					SET_ENTITY_HEALTH(entityhandle, 0, 0)
					FORCE_PED_MOTION_STATE(entityhandle, 0x0DBB071C, 0,0,0)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Freeze ON", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					FREEZE_ENTITY_POSITION(entityhandle, true)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Freeze OFF", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					FREEZE_ENTITY_POSITION(entityhandle, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			menu.divider(veh[vehhandle], "Friendly")
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Give Godmode", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					SET_ENTITY_INVINCIBLE(entityhandle, true)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Remove Godmode", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					SET_ENTITY_INVINCIBLE(entityhandle, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Heal/Revive", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				local ispeddead = IS_PED_DEAD_OR_DYING(entityhandle)
				if getcontrole(entityhandle) then
					maxhealth = GET_PED_MAX_HEALTH(entityhandle)
					SET_ENTITY_HEALTH(entityhandle, maxhealth, 0)
					STOP_ENTITY_FIRE(entityhandle)
					if ispeddead then
						CLEAR_PED_TASKS_IMMEDIATELY(entityhandle)
					end
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			menu.divider(veh[vehhandle], "Misc")
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Clear Tasks", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					CLEAR_PED_TASKS_IMMEDIATELY(entityhandle)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Geld menge dabei", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
				if getcontrole(entityhandle) then
					util.toast(GET_PED_MONEY(entityhandle))
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			end
		else
			if showarsignalnearentitys and menu.is_focused(veh[vehhandle]) then
				util.draw_ar_beacon(ePos)
			end
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.set_menu_name(veh[vehhandle], textlinemain)
				if menu.get_help_text(veh[vehhandle]) != infotextline and menu.is_focused(veh[vehhandle]) then
					menu.set_help_text(veh[vehhandle], infotextline)
				end
			end
			for i = 1, 12 do
				if menu.is_focused(vehinfotab[vehhandle.. i]) then
					if menu.is_ref_valid(vehinfotab[vehhandle.. i]) then
						if showarsignalnearentitys and menu.is_focused(vehinfotab[vehhandle.. i]) then
							util.draw_ar_beacon(ePos)
						end
						if menu.get_help_text(vehinfotab[vehhandle.. i]) != infotextline then
							menu.set_help_text(vehinfotab[vehhandle.. i], infotextline)
						end
					end
				end
			end
		end
		::continue::
		--if not string.match(string.replace(textline, "["..dist.."]", ""), searchnearpeds) then
		--	if DOES_ENTITY_EXIST(vehhandle) then
		--		if veh[vehhandle] != nil and not veh[vehhandle] == number then
		--			if menu.is_ref_valid(veh[vehhandle]) then
		--				menu.set_menu_name(veh[vehhandle], textline)
		--			end
		--		end
		--	end
		--end
	end
	for pedsdata as vehhandle do
		if DOES_ENTITY_EXIST(vehhandle) then
			local vehpointer = entities.handle_to_pointer(vehhandle)
			local pPos = players.get_position(players.user())
			local ePos = entities.get_position(vehpointer)
			local infodist = pPos:distance(ePos)
			local textline = menu.get_menu_name(veh[vehhandle])
			textline = textline:lower()
			local dist = string.strip(textline, "[]")
			if switchsearchnearentitys then
				stringmatcher = string.match(string.replace(textline, "["..dist.."]", ""), searchnearpeds) and string.len(searchnearpeds) > 0
			else
				stringmatcher = not string.match(string.replace(textline, "["..dist.."]", ""), searchnearpeds)
			end
			if (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) or (infodist > maxDistancenearentitys) or (stringmatcher) or (showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0)) then
				if menu.is_ref_valid(veh[vehhandle]) then
					menu.delete(veh[vehhandle])
					for a, msg in ipairs(pedsdata) do
						if msg == vehhandle then
							table.remove(pedsdata, a)
						end
					end
				end
			end
		elseif not DOES_ENTITY_EXIST(vehhandle) or (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) then
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.delete(veh[vehhandle])
				for a, msg in ipairs(pedsdata) do
					if msg == vehhandle then
						table.remove(pedsdata, a)
					end
				end
			end
		end
	end
	::end::
end

local function getnearobjects()
	if not enablednearobjects then
		if not enablednearobjects then
			for objectsdata as vehhandle do
				if menu.is_ref_valid(veh[vehhandle]) then
					menu.delete(veh[vehhandle])
				end
			end
			objectsdata = {}
			return false
		end
	end
	if not menu.is_open() then
		return
	end
	if util.is_session_transition_active() then
		return
	end
	local allpointer = entities.get_all_objects_as_pointers()
	for _, vehpointer in pairs(allpointer) do
		local vehhandle = entities.pointer_to_handle(vehpointer)
		local modelhash = entities.get_model_hash(vehhandle)
		local pPos = players.get_position(players.user())
		local ePos = entities.get_position(vehpointer)
		local dist = math.floor(pPos:distance(ePos))
		local modelname = getmodelnamebyhash(modelhash)
		local infodist = pPos:distance(ePos)
		local ismissionentity = IS_ENTITY_A_MISSION_ENTITY(vehhandle)
		local textline = modelname.. "  [".. dist.. "]"
		local infotextline = modelname.. "\nDist: ".. dist
		local createmenus = true
		if onlymissionnearentitys and not ismissionentity then
			goto continue
		end
		if infodist > maxDistancenearentitys then
			goto continue
		end
		if modelname == "" then
			goto continue
		end
		if showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0) then
			goto continue
		end
		infotextline = infotextline.. "\nVisible: ".. IS_ENTITY_VISIBLE(vehhandle)
		if not GET_ENTITY_CAN_BE_DAMAGED(vehhandle) then
			infotextline = infotextline..  "\nGOD: TRUE"
		else
			infotextline = infotextline.. "\nGOD: FALSE"
		end
		if showdebugginfosnearentitys then
			infotextline = infotextline.. "\nModelhash: ".. modelhash.. "\nWorldPosition: " .. "X:" ..math.floor(ePos.x) .. " Y:" ..math.floor(ePos.y) .. " Z:" ..math.floor(ePos.z)
		end
		textlinemain = textline
		textline = textline:lower()
		if switchsearchnearentitys then
			if string.match(string.replace(textline, "["..dist.."]", ""), searchnearobjects) and string.len(searchnearobjects) > 0 then
				createmenus = false
			end
		else
			if not string.match(string.replace(textline, "["..dist.."]", ""), searchnearobjects) then
				createmenus = false
			end
		end
		if not table.contains(objectsdata, vehhandle) then
			if createmenus then
			table.insert(objectsdata, vehhandle)
			veh[vehhandle] = menu.list(Entitymanagernearvehicleobjects, textlinemain, {}, "")
			local numbertimercall = 0
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to Object", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local entitypPos = entities.get_position(entitypointer)
				SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to me", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +4, -1)
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					SET_ENTITY_COORDS_NO_OFFSET(entityhandle, mypos.x, mypos.y, mypos.z, false, false, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Delete", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
					entities.delete(entityhandle)
			end)
			end
		else
			if showarsignalnearentitys and menu.is_focused(veh[vehhandle]) then
				util.draw_ar_beacon(ePos)
			end
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.set_menu_name(veh[vehhandle], textlinemain)
				if menu.get_help_text(veh[vehhandle]) != infotextline and menu.is_focused(veh[vehhandle]) then
					menu.set_help_text(veh[vehhandle], infotextline)
				end
			end
			for i = 1, 3 do
				if menu.is_focused(vehinfotab[vehhandle.. i]) then
					if menu.is_ref_valid(vehinfotab[vehhandle.. i]) then
						if showarsignalnearentitys and menu.is_focused(vehinfotab[vehhandle.. i]) then
							util.draw_ar_beacon(ePos)
						end
						if menu.get_help_text(vehinfotab[vehhandle.. i]) != infotextline then
							menu.set_help_text(vehinfotab[vehhandle.. i], infotextline)
						end
					end
				end
			end
		end
		::continue::
		--if not string.match(string.replace(textline, "["..dist.."]", ""), "") and not string.match(string.replace(textline, "["..dist.."]", ""), searchnearobjects) then
		--	if DOES_ENTITY_EXIST(vehhandle) then
		--		if veh[vehhandle] != nil and not veh[vehhandle] == number then
		--			if menu.is_ref_valid(veh[vehhandle]) then
		--				menu.set_menu_name(veh[vehhandle], textline)
		--			end
		--		end
		--	end
		--end
	end
	for objectsdata as vehhandle do
		if DOES_ENTITY_EXIST(vehhandle) then
			local vehpointer = entities.handle_to_pointer(vehhandle)
			local pPos = players.get_position(players.user())
			local ePos = entities.get_position(vehpointer)
			local infodist = pPos:distance(ePos)
			local textline = menu.get_menu_name(veh[vehhandle])
			textline = textline:lower()
			local dist = string.strip(textline, "[]")
			if switchsearchnearentitys then
				stringmatcher = string.match(string.replace(textline, "["..dist.."]", ""), searchnearobjects) and string.len(searchnearobjects) > 0
			else
				stringmatcher = not string.match(string.replace(textline, "["..dist.."]", ""), searchnearobjects)
			end
			if (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) or (infodist > maxDistancenearentitys) or (stringmatcher) or (showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0)) then
				if menu.is_ref_valid(veh[vehhandle]) then
					menu.delete(veh[vehhandle])
					for a, msg in ipairs(objectsdata) do
						if msg == vehhandle then
							table.remove(objectsdata, a)
						end
					end
				end
			end
		elseif not DOES_ENTITY_EXIST(vehhandle) or (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) then
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.delete(veh[vehhandle])
				for a, msg in ipairs(objectsdata) do
					if msg == vehhandle then
						table.remove(objectsdata, a)
					end
				end
			end
		end
	end
	::end::
end

local function getnearpickup()
	if not enablednearpickups then
		if not enablednearpickups then
			for pickupdata as vehhandle do
				if menu.is_ref_valid(veh[vehhandle]) then
					menu.delete(veh[vehhandle])
				end
			end
			pickupdata = {}
			return false
		end
	end
	if not menu.is_open() then
		return
	end
	if util.is_session_transition_active() then
		return
	end
	local allpointer = entities.get_all_pickups_as_pointers()
	for _, vehpointer in pairs(allpointer) do
		local vehhandle = entities.pointer_to_handle(vehpointer)
		local modelhash = entities.get_model_hash(vehhandle)
		local pPos = players.get_position(players.user())
		local ePos = entities.get_position(vehpointer)
		local dist = math.floor(pPos:distance(ePos))
		local modelname = getmodelnamebyhash(modelhash)
		local infodist = pPos:distance(ePos)
		local ismissionentity = IS_ENTITY_A_MISSION_ENTITY(vehhandle)
		local textline = modelname.. "  [".. dist.. "]"
		local infotextline = modelname.. "\nDist: ".. dist
		local createmenus = true
		if onlymissionnearentitys and not ismissionentity then
			goto continue
		end
		if infodist > maxDistancenearentitys then
			goto continue
		end
		if showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0) then
			goto continue
		end
		infotextline = infotextline.. "\nVisible: ".. IS_ENTITY_VISIBLE(vehhandle)
		if not GET_ENTITY_CAN_BE_DAMAGED(vehhandle) then
			infotextline = infotextline..  "\nGOD: TRUE"
		else
			infotextline = infotextline.. "\nGOD: FALSE"
		end
		if showdebugginfosnearentitys then
			infotextline = infotextline.. "\nModelhash: ".. modelhash.. "\nWorldPosition: " .. "X:" ..math.floor(ePos.x) .. " Y:" ..math.floor(ePos.y) .. " Z:" ..math.floor(ePos.z)
		end
		textlinemain = textline
		textline = textline:lower()
		if switchsearchnearentitys then
			if string.match(string.replace(textline, "["..dist.."]", ""), searchnearpickups) and string.len(searchnearpickups) > 0 then
				createmenus = false
			end
		else
			if not string.match(string.replace(textline, "["..dist.."]", ""), searchnearpickups) then
				createmenus = false
			end
		end
		if not table.contains(pickupdata, vehhandle) then
			if createmenus then
			table.insert(pickupdata, vehhandle)
			veh[vehhandle] = menu.list(Entitymanagernearvehiclepickup, textlinemain, {}, "")
			local numbertimercall = 0
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to Pickup", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local entitypPos = entities.get_position(entitypointer)
				SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entitypPos.x, entitypPos.y, entitypPos.z, false, false, false)
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Teleport to me", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				if getcontrole(entityhandle) then
					SET_ENTITY_COORDS_NO_OFFSET(entityhandle, mypos.x, mypos.y, mypos.z, false, false, false)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end)
			numbertimercall += 1
			vehinfotab[vehhandle.. numbertimercall] = menu.action(veh[vehhandle], "Delete", {}, infotextline, function()
				local entityhandle = vehhandle
				local entitypointer = vehpointer
				local entityhash = modelhash
				local entitiyname = modelname
				local mypos = players.get_position(players.user())
				local entitypPos = entities.get_position(entitypointer)
				local dist = math.floor(mypos:distance(entitypPos))
					entities.delete(entityhandle)
			end)
			end
		else
			if showarsignalnearentitys and menu.is_focused(veh[vehhandle]) then
				util.draw_ar_beacon(ePos)
			end
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.set_menu_name(veh[vehhandle], textlinemain)
				if menu.get_help_text(veh[vehhandle]) != infotextline and menu.is_focused(veh[vehhandle]) then
					menu.set_help_text(veh[vehhandle], infotextline)
				end
			end
			for i = 1, 3 do
				if menu.is_focused(vehinfotab[vehhandle.. i]) then
					if menu.is_ref_valid(vehinfotab[vehhandle.. i]) then
						if showarsignalnearentitys and menu.is_focused(vehinfotab[vehhandle.. i]) then
							util.draw_ar_beacon(ePos)
						end
						if menu.get_help_text(vehinfotab[vehhandle.. i]) != infotextline then
							menu.set_help_text(vehinfotab[vehhandle.. i], infotextline)
						end
					end
				end
			end
		end
		::continue::
		--if not string.match(string.replace(textline, "["..dist.."]", ""), searchnearpickups) then
		--	if DOES_ENTITY_EXIST(vehhandle) then
		--		if veh[vehhandle] != nil and not veh[vehhandle] == number then
		--			if menu.is_ref_valid(veh[vehhandle]) then
		--				menu.set_menu_name(veh[vehhandle], textline)
		--			end
		--		end
		--	end
		--end
	end
	for pickupdata as vehhandle do
		if DOES_ENTITY_EXIST(vehhandle) then
			local vehpointer = entities.handle_to_pointer(vehhandle)
			local pPos = players.get_position(players.user())
			local ePos = entities.get_position(vehpointer)
			local infodist = pPos:distance(ePos)
			local textline = menu.get_menu_name(veh[vehhandle])
			textline = textline:lower()
			local dist = string.strip(textline, "[]")
			if switchsearchnearentitys then
				stringmatcher = string.match(string.replace(textline, "["..dist.."]", ""), searchnearpickups) and string.len(searchnearpickups) > 0
			else
				stringmatcher = not string.match(string.replace(textline, "["..dist.."]", ""), searchnearpickups)
			end
			if (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) or (infodist > maxDistancenearentitys) or (stringmatcher) or (showonlyblibsnearentitys and (GET_BLIP_FROM_ENTITY(vehhandle) == 0)) then
				if menu.is_ref_valid(veh[vehhandle]) then
					menu.delete(veh[vehhandle])
					for a, msg in ipairs(pickupdata) do
						if msg == vehhandle then
							table.remove(pickupdata, a)
						end
					end
				end
			end
		elseif not DOES_ENTITY_EXIST(vehhandle) or (onlymissionnearentitys and not IS_ENTITY_A_MISSION_ENTITY(vehhandle)) then
			if menu.is_ref_valid(veh[vehhandle]) then
				menu.delete(veh[vehhandle])
				for a, msg in ipairs(pickupdata) do
					if msg == vehhandle then
						table.remove(pickupdata, a)
					end
				end
			end
		end
	end
	::end::
end


--[[enabledToggnearall = menu.toggle(Entitymanagernearvehicle, "Enable get all", {}, "", function(on_toggle)
	if on_toggle then
		enablednearpickups  = true
		util.create_tick_handler(getnearpickup)
		enablednearobjects  = true
		util.create_tick_handler(getnearobjects)
		enablednearpeds  = true
		util.create_tick_handler(getnearpeds)
		enablednearvehicle  = true
		util.create_tick_handler(getnearvehicle)
	else
		enablednearpickups  = false
		enablednearobjects  = false
		enablednearpeds  = false
		enablednearvehicle  = false
	end
end)]]
enabledToggnearvehicle = menu.toggle(Entitymanagernearvehicleirgnore, "Enable get vehicles", {}, "", function(on_toggle)
	if on_toggle then
		enablednearvehicle  = true
		util.create_tick_handler(getnearvehicle)
	else
		enablednearvehicle  = false
	end
end)
enabledToggnearpeds = menu.toggle(Entitymanagernearvehicleirgnore, "Enable get Peds", {}, "", function(on_toggle)
	if on_toggle then
		enablednearpeds  = true
		util.create_tick_handler(getnearpeds)
	else
		enablednearpeds  = false
	end
end)
enabledToggnearobjects = menu.toggle(Entitymanagernearvehicleirgnore, "Enable get obj", {}, "", function(on_toggle)
	if on_toggle then
		enablednearobjects  = true
		util.create_tick_handler(getnearobjects)
	else
		enablednearobjects  = false
	end
end)
enabledToggnearpickups = menu.toggle(Entitymanagernearvehicleirgnore, "Enable get pickups", {}, "", function(on_toggle)
	if on_toggle then
		enablednearpickups  = true
		util.create_tick_handler(getnearpickup)
	else
		enablednearpickups  = false
	end
end)

menu.divider(Entitymanagernearvehicle, "Settings")
local maxDistnearentitys = menu.slider(Entitymanagernearvehicle, "max Dist", {"setdisnearenittys"}, "", 10, 10000, maxDistancenearentitys, 10, function(val)
	maxDistancenearentitys = val
end)
maxDistancenearentitys = menu.get_value(maxDistnearentitys)
switchsearchtoggleentitys = menu.toggle(Entitymanagernearvehicle, "umgekehrte suche", {}, "Entfernt das was du suchst", function(on)
	switchsearchnearentitys = on
end, switchsearchnearentitys)
switchsearchnearentitys = menu.get_value(switchsearchtoggleentitys)
onlymissiontoggleentitys = menu.toggle(Entitymanagernearvehicle, "Only Mission entitys", {}, "", function(on)
	onlymissionnearentitys = on
end, onlymissionnearentitys)
onlymissionnearentitys = menu.get_value(onlymissiontoggleentitys)
showplayerstoggleentitys = menu.toggle(Entitymanagernearvehicle, "Show players", {}, "", function(on)
	showplayersnearentitys = on
end, showplayersnearentitys)
showplayersnearentitys = menu.get_value(showplayerstoggleentitys)
onlyblibstoggleentitys = menu.toggle(Entitymanagernearvehicle, "Show only entitys with a blib", {}, "", function(on)
	showonlyblibsnearentitys = on
end, showonlyblibsnearentitys)
showonlyblibsnearentitys = menu.get_value(onlyblibstoggleentitys)
debugginfostoggleentitys = menu.toggle(Entitymanagernearvehicle, "Show Debug infos in help text", {}, "", function(on)
	showdebugginfosnearentitys = on
end, showdebugginfosnearentitys)
showdebugginfosnearentitys = menu.get_value(debugginfostoggleentitys)
drawarsignalstoggleentitys = menu.toggle(Entitymanagernearvehicle, "Show AR signal", {}, "", function(on)
	showarsignalnearentitys = on
end, showarsignalnearentitys)
showarsignalnearentitys = menu.get_value(drawarsignalstoggleentitys)


menu.action(Self, "Tp waypoint or mission point", {"tpwpob"}, "wenn ein waypoint gesetzt ist geht er da hin wenn keiner da ist geht er zu missions punkt", function()
	if IS_WAYPOINT_ACTIVE() then
		menu.trigger_commands("tpwp")
	else
		menu.trigger_commands("tpobjective")
	end
end)

--shoot gods
menu.toggle_loop(Self, 'Shoot gods', {}, 'Disables godmode for other players when aiming at them. Mostly works on trash menus.', function()
	for players.list_except(true) as pid do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
 		if IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), ped) and not players.is_in_interior(ped) then
			if players.is_godmode(pid) then
				util.trigger_script_event(1 << pid, {800157557, pid, 225624744, math.random(0, 9999)})
			end
		end
	end
end)


--IS_PLAYER_FREE_AIMING_AT_ENTITY(pid, players.user_ped()) or IS_PLAYER_FREE_AIMING_AT_ENTITY(pid, vehicleped)
menu.toggle_loop(Self, "Ghost Armed Players", {}, "macht godmode spieler zum geist für dich wenn sie auf dich ziehlen. \nwird nicht gehen wenn du godmode an hast weil du da ja eh unsterblich bist", function()
for players.list_except(true) as pid do
	local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
	local pedplayer = GET_PLAYER_PED_SCRIPT_INDEX(players.user())
	godmodeon = menu.get_value(menu.ref_by_path("Self>Immortality"))
	vehiclegodmode = menu.get_value(menu.ref_by_path("Vehicle>Indestructible"))
	local vehicleped = GET_VEHICLE_PED_IS_IN(players.user_ped())
	local pc = players.get_position(players.user())
	local cc = players.get_position(pid)
		if IS_PED_ARMED(ped, 7) and IS_PLAYER_FREE_AIMING(pid) and IS_PED_FACING_PED(ped, pedplayer, 10) or (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= 10) and (not players.is_in_interior(pid)) then
			if players.is_godmode(pid) and not godmodeon then
				SET_REMOTE_PLAYER_AS_GHOST(pid, true)
			end
		--elseif IS_PED_ARMED(ped, 7) and (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= 10) then
		--	if players.is_godmode(pid) and not godmodeon then
		--		SET_REMOTE_PLAYER_AS_GHOST(pid, true)
		--	end
		else
			SET_REMOTE_PLAYER_AS_GHOST(pid, false)
		end
end
end, function()
for players.list_except(true) as pid do
	SET_REMOTE_PLAYER_AS_GHOST(pid, false)
end
end)


--[[if IS_PED_IN_ANY_VEHICLE(ped,true) then
players.is_godmode(pid) and 
IS_PLAYER_FREE_AIMING_AT_ENTITY(pid, players.user_ped()) or 
	local vehicleped = players.get_vehicle_model(players.user())
	if IS_PED_ARMED(ped, 7) and IS_PLAYER_FREE_AIMING(pid) and IS_PLAYER_FREE_AIMING_AT_ENTITY(vehicleped, players.user_ped()) and not players.is_in_interior(pid) then
		if not vehiclegodmode then
			SET_REMOTE_PLAYER_AS_GHOST(pid, true)
		end
	else
		SET_REMOTE_PLAYER_AS_GHOST(pid, false)
	end
else]]
--or GET_IS_TASK_ACTIVE(ped, 199) or GET_IS_TASK_ACTIVE(ped, 128)  and not is_in_interior(pid) 

menu.toggle_loop(Self, "Script Host Addict", {}, "A faster version of script host kleptomaniac", function()
    if players.get_script_host() ~= players.user() and not util.is_session_transition_active(players.user) then
        menu.trigger_commands("scripthost")
    end
end)

menu.toggle_loop(Self, "Anti modder scripthost", {}, "gibt dir script host wenn ein spieler der modder ist script host ist/wird\nHat kein effekt auf freunde", function()
	local pid = players.get_script_host()
	local hdl = pid_to_handle(pid)
    if players.get_script_host() ~= players.user() and not util.is_session_transition_active(players.user) and not NETWORK_IS_FRIEND(hdl) then
		if players.is_marked_as_modder(pid) then
			util.toast("Script host wurde dir gegeben")
        	menu.trigger_commands("scripthost")
		end
    end
end)

menu.toggle_loop(Self, "Tempo anzeige nur im auto", {}, "macht die anzeige an wenn du im auto bist", function()
	if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
		menu.trigger_command(menu.ref_by_path("Vehicle>AR Speedometer>AR Speedometer"), true)
	else
		menu.trigger_command(menu.ref_by_path("Vehicle>AR Speedometer>AR Speedometer"), false)
	end
	on_stop = menu.trigger_command(menu.ref_by_path("Vehicle>AR Speedometer>AR Speedometer"), false)
end)

local timerforafk = 120
local timegerade = util.current_time_millis()
menu.toggle_loop(Self, "anti afk kill", {}, "", function()
	if not util.is_session_transition_active() then
		if isanykeypressed() then
			timegerade = util.current_time_millis()
			for players.list(false, true, true) as pid do
				SET_REMOTE_PLAYER_AS_GHOST(pid, false)
			end
		elseif not isanykeypressed() and not isMoving(players.user_ped()) then
			if (util.current_time_millis() - timegerade) >= (timerforafk * 1000) then
				for players.list(false, true, true) as pid do
					SET_REMOTE_PLAYER_AS_GHOST(pid, true)
				end
				util.draw_debug_text("[AFK] Spieler sind im Ghost")
			end
		end
	end
end)

menu.toggle_loop(Self, "anti idle cam", {}, "", function()
	local timer = 0
	if not isanykeypressed() then
		repeat
			util.yield()
			timer += 1
			if isanykeypressed() then
				break
			end
		until timer == 1000
		if timer >= 1000 then
			INVALIDATE_IDLE_CAM()
		end
	end
end)

menu.action(Self, "Test mist", {}, "", function()

end)

local auswahlauusmachen = menu.list(Zeugforjob, "selbst auswahl für aus machen", {}, "du kannst sagen was nicht aus gemacht werden soll weil das nicht gemacht werden muss. Ist aber würde ich sagen trz bei manchen missionen zu empfehlen")

menu.toggle(auswahlauusmachen, "lockweapons", {}, "achte darauf das man es nicht an aus macht während man :zeug für job aus machen: an hat / wenn es an ist dann wird es nicht aus gemacht", function(on_toggle)
	if on_toggle then
		lockweapons1 = true
	else
		lockweapons1 = false
	end
end)

menu.toggle(auswahlauusmachen, "Wantedlevel fixieren", {}, "achte darauf das man es nicht an aus macht während man :zeug für job aus machen: an hat / wenn es an ist dann wird es nicht aus gemacht", function(on_toggle)
	if on_toggle then
		wantedlevel1 = true
	else
		wantedlevel1 = false
	end
end)

menu.toggle(auswahlauusmachen, "alle waffen haben", {}, "achte darauf das man es nicht an aus macht während man :zeug für job aus machen: an hat / wenn es an ist dann wird es nicht aus gemacht", function(on_toggle)
	if on_toggle then
		allweapons1 = true
	else
		allweapons1 = false
	end
end)

menu.toggle(Zeugforjob, "Zeug für Job aus machen", {}, "Macht zeug aus damit in missionen weniger probleme kommen können", function(on_toggle)
	if on_toggle then
		Lockweapons = menu.get_value(menu.ref_by_path("Self>Weapons>Lock Weapons>Lock Weapons"))
		Regionsmatch = menu.get_value(menu.ref_by_path("Online>Transitions>Matchmaking>Region Override>Region Override"))
		poolOver = menu.get_value(menu.ref_by_path("Online>Transitions>Matchmaking>Pool Override>Pool Override"))
		seamlessswitch = menu.get_value(menu.ref_by_path("Online>Transitions>Seamless Session Switching>Seamless Session Switching"))
		permissionspawn = menu.get_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Ask For Permission To Spawn"))
		Lauchnermission = menu.get_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Mission Launcher"))
		Broadcastdata = menu.get_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Data Broadcast"))
		swoopdown = menu.get_value(menu.ref_by_path("Online>Transitions>Skip Swoop Down"))
		multiplierareas = menu.get_value(menu.ref_by_path("Online>Protections>Delete Modded Pop Multiplier Areas"))
		Entityspamzeug = menu.get_value(menu.ref_by_path("Online>Protections>Block Entity Spam>Block Entity Spam"))
		restrictedareas = menu.get_value(menu.ref_by_path("Game>Disables>Disable Restricted Areas"))
		wantedlevel = menu.get_value(menu.ref_by_path("Self>Lock Wanted Level"))
		hosttokenspoof = menu.get_value(menu.ref_by_path("Online>Spoofing>Host Token Spoofing>Host Token Spoofing"))
		allweapons = menu.get_value(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME..">Zeug für mich angepasst>alle waffen immer"))
		
		zeugforthejob = true
		if lockweapons1 then
		else
			menu.trigger_command(menu.ref_by_path("Self>Weapons>Lock Weapons>Lock Weapons"), false)
		end
		if wantedlevel1 then
		else
			menu.trigger_command(menu.ref_by_path("Self>Lock Wanted Level"), false)
		end
		if allweapons1 then
		else
			menu.trigger_command(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME..">Zeug für mich angepasst>alle waffen immer"), false)
		end
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Matchmaking>Region Override>Region Override"), false)
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Matchmaking>Pool Override>Pool Override"), false)
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Seamless Session Switching>Seamless Session Switching"), false)
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Data Broadcast"), false)
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Mission Launcher"), false)
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Speed Up>Don't Ask For Permission To Spawn"), false)
		menu.trigger_command(menu.ref_by_path("Online>Transitions>Skip Swoop Down"), false)
		menu.trigger_command(menu.ref_by_path("Online>Protections>Delete Modded Pop Multiplier Areas"), false)
		menu.trigger_command(menu.ref_by_path("Online>Protections>Block Entity Spam>Block Entity Spam"), false)
		menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Restricted Areas"), false)
		menu.trigger_command(menu.ref_by_path("Online>Spoofing>Host Token Spoofing>Host Token Spoofing"), false)
	else
		zeugforthejob = false
		if lockweapons1 then
		else
			menu.set_value(menu.ref_by_path("Self>Weapons>Lock Weapons>Lock Weapons"), Lockweapons)
		end
		if wantedlevel1 then
		else
			menu.trigger_command(menu.ref_by_path("Self>Lock Wanted Level"), wantedlevel)
		end
		if allweapons1 then
		else
			menu.trigger_command(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME..">Zeug für mich angepasst>alle waffen immer"), allweapons)
		end
		menu.set_value(menu.ref_by_path("Online>Transitions>Matchmaking>Region Override>Region Override"), Regionsmatch)
		menu.set_value(menu.ref_by_path("Online>Transitions>Matchmaking>Pool Override>Pool Override"), poolOver)
		menu.set_value(menu.ref_by_path("Online>Transitions>Seamless Session Switching>Seamless Session Switching"), seamlessswitch)
		menu.set_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Data Broadcast"), Broadcastdata)
		menu.set_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Mission Launcher"), Lauchnermission)
		menu.set_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Ask For Permission To Spawn"), permissionspawn)
		menu.set_value(menu.ref_by_path("Online>Transitions>Skip Swoop Down"), swoopdown)
		menu.set_value(menu.ref_by_path("Online>Protections>Delete Modded Pop Multiplier Areas"), multiplierareas)
		menu.set_value(menu.ref_by_path("Online>Protections>Block Entity Spam>Block Entity Spam"), Entityspamzeug)
		menu.set_value(menu.ref_by_path("Game>Disables>Disable Restricted Areas"), restrictedareas)
		menu.set_value(menu.ref_by_path("Online>Spoofing>Host Token Spoofing>Host Token Spoofing"), hosttokenspoof)
	end
end)

menu.action(Zeugforjob, "was deaktiviert wurde drück hier", {}, "zeigt was alles bei zeug für job aus machen aus gemacht wird", function()
	util.toast("Lock Weapons = false", TOAST_CONSOLE)
	util.toast("Region Override = false", TOAST_CONSOLE)
	util.toast("Pool Override = false", TOAST_CONSOLE)
	util.toast("Seamless Session Switching = false", TOAST_CONSOLE)
	util.toast("Don't Wait For Data Broadcast = false", TOAST_CONSOLE)
	util.toast("Don't Wait For Mission Launcher = false", TOAST_CONSOLE)
	util.toast("Don't Ask For Permission To Spawn = false", TOAST_CONSOLE)
	util.toast("Skip Swoop Down = false", TOAST_CONSOLE)
	util.toast("Delete Modded Pop Multiplier Areas = false", TOAST_CONSOLE)
	util.toast("Block Entity Spam>Block Entity Spam = false", TOAST_CONSOLE)
	util.toast("Join Group Override = Don't Override", TOAST_CONSOLE)
	util.toast("Disable Restricted Areas 0 false", TOAST_CONSOLE)
	util.toast("Lock Wanted Level = false", TOAST_CONSOLE)
	util.toast("Host Token Spoofing = false", TOAST_CONSOLE)
	util.toast("Guck in deine console da steht alles. wenn du keine hast fick dich")
end)

local function zeugwiederan()
	if zeugforthejob then
		menu.set_value(menu.ref_by_path("Self>Weapons>Lock Weapons>Lock Weapons"), Lockweapons)
		menu.set_value(menu.ref_by_path("Online>Transitions>Matchmaking>Region Override>Region Override"), Regionsmatch)
		menu.set_value(menu.ref_by_path("Online>Transitions>Matchmaking>Pool Override>Pool Override"), poolOver)
		menu.set_value(menu.ref_by_path("Online>Transitions>Seamless Session Switching>Seamless Session Switching"), seamlessswitch)
		menu.set_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Data Broadcast"), Broadcastdata)
		menu.set_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Wait For Mission Launcher"), Lauchnermission)
		menu.set_value(menu.ref_by_path("Online>Transitions>Speed Up>Don't Ask For Permission To Spawn"), permissionspawn)
		menu.set_value(menu.ref_by_path("Online>Transitions>Skip Swoop Down"), swoopdown)
		menu.set_value(menu.ref_by_path("Online>Protections>Delete Modded Pop Multiplier Areas"), multiplierareas)
		menu.set_value(menu.ref_by_path("Online>Protections>Block Entity Spam>Block Entity Spam"), Entityspamzeug)
		menu.set_value(menu.ref_by_path("Game>Disables>Disable Restricted Areas"), restrictedareas)
		menu.set_value(menu.ref_by_path("Self>Lock Wanted Level"), wantedlevel1)
		menu.set_value(menu.ref_by_path("Online>Spoofing>Host Token Spoofing>Host Token Spoofing"), hosttokenspoof)
		menu.set_value(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME..">Zeug für mich angepasst>alle waffen immer"), allweapons)
	end
end

util.on_stop(zeugwiederan)

menu.action(Zeugforjob, "Teleport Pickups To Me", {}, "teleportiert sachen zum aufheben zu dir", function()
    local counter = 0
    local pos = players.get_position(players.user())
    for entities.get_all_pickups_as_handles() as pickup do
		if getcontrole(pickup) then
        	SET_ENTITY_COORDS(pickup, pos, false, false, false, false)
        	counter += 1
        	util.yield()
		else
			util.toast("cant get control")
		end
    end
    if counter == 0 then
        util.toast("No Pickups Found. :/")
    else
        util.toast("Teleported ".. tostring(counter) .." Pickups.")
    end
end)

function request_anim_dict(dict)
    request_time = os.time()
    if not DOES_ANIM_DICT_EXIST(dict) then
        return
    end
    REQUEST_ANIM_DICT(dict)
    while not HAS_ANIM_DICT_LOADED(dict) do
        if os.time() - request_time >= 10 then
            break
        end
        util.yield()
    end
end

menu.action(Zeugforjob, "Spawn object", {}, "spawned das object mit dem hash bei has number", function()
	local playeroffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +0.5, -1)
	local fireowrkpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +0.5, +1)
	if hashnumber == nill or hashnumber != number then
	else
		util.toast(hashnumber)
		entities.create_object(hashnumber, playeroffset)
	end
	if nameofobject != nill then
		local hashofobj = util.joaat("ind_prop_firework_04")
		entities.create_object(hashofobj, playeroffset)
	end
end)

menu.text_input(Zeugforjob, "name of obj", {"nameofobj"}, "", function(input)
	nameofobject = input
end, '')

menu.text_input(Zeugforjob, "hash number", {"hashnumber"}, "", function(input)
	hashnumber = input
end, '')

menu.text_input(Self, "Claim auto", {"claimautoinput"}, "Schreib die zahl rein von dem auto das spawnen soll.\nsiehst du wenn du den command pvs benutzt dann kannst dein auto suchen und als befehlt steht dann welche zahl da ist", function(input)
	name = input
end, '')

menu.action(Self, "Claim all vehicles", {"claimallvehicles"}, "Claims all vehicles destroyed from Mors Mutual.\nEs werden einfach alle autos durch stand angefordert und das letzte was angefordert wurde steht dann halt als persönliches auto da", function ()
	reclaimVehicles()
	if name ~= number then
		menu.trigger_commands("pv".. name .."request")
	end
end)

menu.toggle_loop(Entitymanager, "Entity aim Controle", {}, "", function()
	local entpointer = memory.alloc()
	local aimeintity = GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(players.user(), entpointer)
	local handle = memory.read_int(entpointer)
	local lightattack = menu.get_value(menu.ref_by_path("Game>Disables>Disable Game Inputs>MELEE_ATTACK_LIGHT"))
	local grenade = menu.get_value(menu.ref_by_path("Game>Disables>Disable Game Inputs>THROW_GRENADE"))
	local vehexit = menu.get_value(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"))
	local vehenter = menu.get_value(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"))
	if schwerkraftan then
		if is_key_just_down('VK_E') and IS_PLAYER_FREE_AIMING(players.user()) then
			menu.trigger_command(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun"), false)
		end
	end
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>MELEE_ATTACK_LIGHT"), true)
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>THROW_GRENADE"), true)
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
	if GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(players.user(), entpointer) then
		if GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(players.user(), entpointer) and IS_ENTITY_A_VEHICLE(handle) or IS_PED_IN_ANY_VEHICLE(handle,true) then
			menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), true)
			menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), true)
		end
	local godmodeentity = GET_ENTITY_CAN_BE_DAMAGED(handle) if godmodeentity then godmodeentity1 = false else godmodeentity1 = true end
	local visibleentitiy = IS_ENTITY_VISIBLE(handle)
	local deadentity = IS_ENTITY_DEAD(handle)
	local missionentity = IS_ENTITY_A_MISSION_ENTITY(handle)
	local speedentity = GET_ENTITY_SPEED(handle) * 3.6
	speedentity1 = roundDecimals(speedentity, 1)
	local modelhashentity = GET_ENTITY_MODEL(handle)
	local modelname = getmodelnamebyhash(modelhashentity)
	local healthentity = GET_ENTITY_HEALTH(handle)
	local ownerentity = entities.get_owner(handle)
	local namefromplayer = players.get_name(ownerentity)
	x = 0.55
	y = 0.5
	y1 = 0.52
	y2 = 0.54
	y3 = 0.56
	y4 = 0.58
	y5 = 0.6
	y6 = 0.62
	y7 = 0.64
	y8 = 0.66
	y9 = 0.68
	y10 = 0.90 --info fenster unten
	schwerkraftan = menu.get_value(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun"))
		if IS_ENTITY_A_PED(handle) then
			if IS_PED_IN_ANY_VEHICLE(handle,true) and not IS_PED_A_PLAYER(handle) then
				local vehicleding = GET_VEHICLE_PED_IS_IN(handle)
				local healthentity1 = GET_ENTITY_HEALTH(vehicleding)
				local godmodeentity2 = GET_ENTITY_CAN_BE_DAMAGED(vehicleding) if godmodeentity2 then godmodeentity3 = false else godmodeentity3 = true end
				local visibleentitiy1 = IS_ENTITY_VISIBLE(vehicleding)
				local deadentity1 = IS_ENTITY_DEAD(vehicleding)
				local missionentity1 = IS_ENTITY_A_MISSION_ENTITY(vehicleding)
				local speedentity2 = GET_ENTITY_SPEED(vehicleding) * 3.6
				speedentity3 = roundDecimals(speedentity, 1)
				local modelhashentity1 = GET_ENTITY_MODEL(vehicleding)
				local vehiclemodelentity1 = getmodelnamebyhash(modelhashentity1)
				local ownerentity1 = entities.get_owner(vehicleding)
				local namefromplayer1 = players.get_name(ownerentity1)
				--npc in einem auto
				if not informationpedveh then
					directx.draw_text(x, y, "VEHICLE: ".. vehiclemodelentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y1, "GOD: ".. godmodeentity3, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					--directx.draw_text(x, y2, "VISIBLE: ".. visibleentitiy1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y2, "FOR MISSION: ".. missionentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y3, "SPEED: ".. speedentity3, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y4, "HEALTH: ".. healthentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y5, "OWNERVEH: ".. namefromplayer1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				else
					directx.draw_text(x, y, "PED: ".. modelname, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y1, "VEHICLE: ".. vehiclemodelentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y2, "GOD: ".. godmodeentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					--directx.draw_text(x, y3, "VISIBLE: ".. visibleentitiy, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y3, "DEAD: ".. deadentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y4, "FOR MISSION: ".. missionentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y5, "SPEED: ".. speedentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y6, "HEALTH: ".. healthentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y7, "OWNERPED: ".. namefromplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				end
				--directx.draw_text(x, y6, "MODEL HASH: ".. modelhashentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(0.5, y10, "R = Delete  /  E = GRAVITY GUN  /  F = ENTER VEH  /  G = EXPLODE", 5, 0.8, {r=1,g=1,b=1,a=1}, true)
				if is_key_just_down("VK_F") and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
					if not vehenterstealnpc then
						if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
							menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
							entities.delete(handle)
							SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, -1)
						else
							entities.delete(handle)
							SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, -1)
						end
					else
						if ARE_ANY_VEHICLE_SEATS_FREE(vehicleding) then
							if IS_VEHICLE_SEAT_FREE(vehicleding, 0) then
								if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
									menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 0)
								else
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 0)
								end
							elseif  IS_VEHICLE_SEAT_FREE(vehicleding, 1) then
								if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
									menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 1)
								else
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 1)
								end
							elseif  IS_VEHICLE_SEAT_FREE(vehicleding, 2) then
								if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
									menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 2)
								else
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 2)
								end
							elseif  IS_VEHICLE_SEAT_FREE(vehicleding, 3) then
								if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
									menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 3)
								else
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 3)
								end
							elseif  IS_VEHICLE_SEAT_FREE(vehicleding, 4) then
								if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
									menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 4)
								else
									SET_PED_INTO_VEHICLE(players.user_ped(), vehicleding, 4)
								end
							else
								util.toast("konnte dich in keinen sitz setzen")
							end
						else
							util.toast("Fahrzeug ist voll")
						end
					end
				end
				if controlepedcar then
					if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						entities.delete(handle)
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 0) then
							local vehicleseat0 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 0)
							entities.delete(vehicleseat0)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 1) then
							local vehicleseat1 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 1)
							entities.delete(vehicleseat1)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 2) then
							local vehicleseat2 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 2)
							entities.delete(vehicleseat2)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 3) then
							local vehicleseat3 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 3)
							entities.delete(vehicleseat3)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 4) then
							local vehicleseat4 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 4)
							entities.delete(vehicleseat4)
						end
							entities.delete(vehicleding)
					end
				elseif deletevehicle then
					if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						entities.delete(vehicleding)
					end
				else
					if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 0) then
							local vehicleseat0 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 0)
							entities.delete(vehicleseat0)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 1) then
							local vehicleseat1 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 1)
							entities.delete(vehicleseat1)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 2) then
							local vehicleseat2 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 2)
							entities.delete(vehicleseat2)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 3) then
							local vehicleseat3 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 3)
							entities.delete(vehicleseat3)
						end
						if not IS_VEHICLE_SEAT_FREE(vehicleding, 4) then
							local vehicleseat4 = GET_PED_IN_VEHICLE_SEAT(vehicleding, 4)
							entities.delete(vehicleseat4)
						end
						entities.delete(handle)
					end
				end
				if is_key_just_down('VK_G') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
					NETWORK_EXPLODE_VEHICLE(vehicleding, 1, 0, 0)
				end
				if not schwerkraftan then
					if is_key_just_down('VK_E') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						menu.trigger_command(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun"), true)
					end
				end
			elseif IS_PED_A_PLAYER(handle) then
				local nearestplayer = GET_NEAREST_PLAYER_TO_ENTITY(handle)
				local nameplayer = players.get_name(nearestplayer)
				local tagsofplayer = players.get_tags_string(nearestplayer)
				local vehmodel = players.get_vehicle_model(nearestplayer)
				if IS_PED_IN_ANY_VEHICLE(handle,true) then
					directx.draw_text(0.5, y10, "R = Delete  /  E = GRAVITY GUN  /  F = ENTER VEH  /  C = KICKEN  /  B = PLAYER WINDOW  /  G = EXPLODE", 5, 0.8, {r=1,g=1,b=1,a=1}, true)
					local vehicleplayer1 = getmodelnamebyhash(vehmodel)
					local vehicleplayer = GET_VEHICLE_PED_IS_IN(handle)
					local ownerentity2 = entities.get_owner(vehicleplayer)
					local namefromplayer2 = players.get_name(ownerentity2)
					directx.draw_text(x, y, "PLAYER: ".. nameplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y1, "VEHICLE: ".. vehicleplayer1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y2, "GOD: ".. godmodeentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y3, "VISIBLE: ".. visibleentitiy, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y4, "SPEED: ".. speedentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y5, "HEALTH: ".. healthentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y6, "OWNERVEH: ".. namefromplayer2, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y7, "TAGS: ".. tagsofplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					if is_key_just_down("VK_F") and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						if vehentersteal then
							menu.trigger_commands("vehkick"..nameplayer)
							vehtimer = 0
							repeat
								vehtimer += 1
								if vehtimer > 100 then
									util.toast("er konnte nicht aus dem auto geworfen werden")
									vehtimer = 0
									break
								end
								util.yield()
							until not IS_PED_IN_ANY_VEHICLE(handle,true)
							if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
								menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
								SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, -1)
							else
								SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, -1)
							end
						else
							if ARE_ANY_VEHICLE_SEATS_FREE(vehicleplayer) then
								if IS_VEHICLE_SEAT_FREE(vehicleplayer, 0) then
									if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
										menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 0)
									else
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 0)
									end
								elseif  IS_VEHICLE_SEAT_FREE(vehicleplayer, 1) then
									if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
										menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 1)
									else
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 1)
									end
								elseif  IS_VEHICLE_SEAT_FREE(vehicleplayer, 2) then
									if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
										menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 2)
									else
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 2)
									end
								elseif  IS_VEHICLE_SEAT_FREE(vehicleplayer, 3) then
									if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
										menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 3)
									else
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 3)
									end
								elseif  IS_VEHICLE_SEAT_FREE(vehicleplayer, 4) then
									if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
										menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 4)
									else
										SET_PED_INTO_VEHICLE(players.user_ped(), vehicleplayer, 4)
									end
								else
									util.toast("konnte dich in keinen sitz setzen")
								end
							else
								util.toast("es sind keine sitze frei")
							end
						end
					end
					if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						entities.delete(vehicleplayer)
					end
					if is_key_just_down('VK_C') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						menu.trigger_commands("kick ".. nameplayer)
					end
					if is_key_just_down('VK_B') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						menu.trigger_commands("p ".. nameplayer)
					end
					if not schwerkraftan then
						if is_key_just_down('VK_E') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
							menu.trigger_command(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun"), true)
						end
					end
					if is_key_just_down('VK_G') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						if getcontrole(vehicleplayer) then
							NETWORK_EXPLODE_VEHICLE(vehicleplayer, 1, 0, 0)
						else
							util.toast("konnte keine kontrolle bekommen")
						end
					end
				else
					if tagsofplayer == "" then
						freezeonoroff = menu.get_value(menu.ref_by_path("Players>".. nameplayer ..">Trolling>Freeze"))
					else
						freezeonoroff = menu.get_value(menu.ref_by_path("Players>".. nameplayer .. " [" ..tagsofplayer .."]>Trolling>Freeze"))
					end
					directx.draw_text(0.5, y10, "C = KICKEN  /  R = Freeze  /  B = PLAYER WINDOW", 5, 0.8, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y, "PLAYER: ".. nameplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y1, "GOD: ".. godmodeentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					--directx.draw_text(x, y2, "VISIBLE: ".. visibleentitiy, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y2, "SPEED: ".. speedentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y3, "HEALTH: ".. healthentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y4, "Freeze: ".. freezeonoroff, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					directx.draw_text(x, y5, "TAGS: ".. tagsofplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
					if is_key_just_down('VK_C') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						menu.trigger_commands("kick ".. nameplayer)
					end
					if is_key_just_down('VK_B') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						menu.trigger_commands("p ".. nameplayer)
					end
					if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
						if tagsofplayer == "" then
							if freezeonoroff then
								menu.trigger_command(menu.ref_by_path("Players>".. nameplayer ..">Trolling>Freeze"), false)
							else 
								menu.trigger_command(menu.ref_by_path("Players>".. nameplayer ..">Trolling>Freeze"), true)
							end
						else
							if freezeonoroff then
								menu.trigger_command(menu.ref_by_path("Players>".. nameplayer .. " [" ..tagsofplayer .."]>Trolling>Freeze"), false)
							else 
								menu.trigger_command(menu.ref_by_path("Players>".. nameplayer .. " [" ..tagsofplayer .."]>Trolling>Freeze"), true)
							end
						end
					end
				end
			else
				directx.draw_text(0.5, y10, "R = Delete  /  C = CLEAR TASKS ", 5, 0.8, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y, "PED: ".. modelname, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y1, "GOD: ".. godmodeentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				--directx.draw_text(x, y2, "VISIBLE: ".. visibleentitiy, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y2, "DEAD: ".. deadentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y3, "FOR MISSION: ".. missionentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y4, "SPEED: ".. speedentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y5, "HEALTH: ".. healthentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				directx.draw_text(x, y6, "OWNERPED: ".. namefromplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				--directx.draw_text(x, y7, "MODEL HASH: ".. modelhashentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
				if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
					entities.delete(handle)
				end
				if is_key_just_down('VK_C') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
					if getcontrole(handle) then
						CLEAR_PED_TASKS(handle)
					else
						util.toast("konnte keine kontrolle bekommen")
					end
				end
			end
		elseif IS_ENTITY_A_VEHICLE(handle) then
			directx.draw_text(0.5, y10, "R = Delete  /  E = GRAVITY GUN  /  F = ENTER VEH  /  G = EXPLODE", 5, 0.8, {r=1,g=1,b=1,a=1}, true)
			local vehiclemodelentity3 = getmodelnamebyhash(modelhashentity)
			directx.draw_text(x, y, "VEHICLE: ".. vehiclemodelentity3, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y1, "GOD: ".. godmodeentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			--directx.draw_text(x, y2, "VISIBLE: ".. visibleentitiy, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y2, "FOR MISSION: ".. missionentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y3, "SPEED: ".. speedentity1, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y4, "HEALTH: ".. healthentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y5, "OWNERVEH: ".. namefromplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			--directx.draw_text(x, y6, "MODEL HASH: ".. modelhashentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
				entities.delete(handle)
			end
			if is_key_just_down("VK_F") and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
				if menu.get_value(menu.ref_by_path("Self>Movement>Levitation>Levitation")) then
					menu.trigger_command(menu.ref_by_path("Self>Movement>Levitation>Levitation"), false)
					SET_PED_INTO_VEHICLE(players.user_ped(), handle, -1)
				else
					SET_PED_INTO_VEHICLE(players.user_ped(), handle, -1)
				end
			end
			if is_key_just_down('VK_G') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
				if getcontrole(handle) then
					NETWORK_EXPLODE_VEHICLE(handle, 1, 0, 0)
				else
					util.toast("konnte keine kontrolle bekommen")
				end
			end
			if not schwerkraftan then
				if is_key_just_down('VK_E') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
					menu.trigger_command(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun"), true)
				end
			end
		elseif IS_ENTITY_AN_OBJECT(handle) then
			directx.draw_text(0.5, y10, "R = Delete  /  E = GRAVITY GUN  /  C = COPY HASH", 5, 0.8, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y, "OBJECT: ".. modelname, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y1, "VISIBLE: ".. visibleentitiy, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y2, "FOR MISSION: ".. missionentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y3, "MODEL HASH: ".. modelhashentity, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			directx.draw_text(x, y4, "OWNEROBJECT: ".. namefromplayer, 5, 0.5, {r=1,g=1,b=1,a=1}, true)
			if is_key_just_down('VK_R') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
				entities.delete(handle)
			end
			if is_key_just_down('VK_C') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
				util.copy_to_clipboard(modelhashentity, true)
			end
			if not schwerkraftan then
				if is_key_just_down('VK_E') and IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), handle) then
					menu.trigger_command(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun"), true)
				end
			end
		end
	end
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>THROW_GRENADE"), grenade)
	on_stop = menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>MELEE_ATTACK_LIGHT"), lightattack)
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
	menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
	if menu.get_value(menu.ref_by_path("Self>Weapons>Gravity Gun>Gravity Gun")) then
		util.draw_debug_text("Gravity Gun ist AN")
	end
end)

CLEAR_AREA_RANGE = 100
local function clearAreaOfEntities(entitie, range)
    local rangesq = range*range
    local pc = players.get_position(players.user())
		if entitie == "ped" then
			for _, ped in pairs(entities.get_all_peds_as_handles()) do
				local cc = GET_ENTITY_COORDS(ped)
	            if (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= rangesq) and not IS_PED_A_PLAYER(ped) then
	                entities.delete(ped)
				end
			end
		end
		if entitie == "veh" then
			local currentVehicle = entities.get_user_vehicle_as_handle(true)
			local persoveh = entities.get_user_personal_vehicle_as_handle()
	        for _, vehicle in pairs(entities.get_all_vehicles_as_handles()) do
				local cc = GET_ENTITY_COORDS(vehicle)
	            if not (currentVehicle == vehicle) and (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= rangesq) then
	                local vehData = getTargetVehicleData(vehicle)
	                if vehData.player == -1 and not (vehicle == currentVehicle) and not (vehicle == persoveh) then
	                    entities.delete(vehicle)
	                end
	            end
	        end
		end
		if entitie == "obj" then
			for _, object in pairs(entities.get_all_objects_as_handles()) do
				local cc = GET_ENTITY_COORDS(object)
	            if (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= rangesq) then
	                entities.delete(object)
	            end
	        end
		end
		if entitie == "pickup" then
			for _, pickups in pairs(entities.get_all_pickups_as_handles()) do
				local cc = GET_ENTITY_COORDS(pickups)
	            if (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= rangesq) then
	                entities.delete(pickups)
	            end
	        end
		end
end

--[[local function clearAreaOfEntities(tbl, range)
    local rangesq = range*range
    local pc = GET_ENTITY_COORDS(players.user_ped())
    for _, v in pairs(tbl) do
        local cc = entities.get_position(v)
        if (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= rangesq) then
            local h = entities.pointer_to_handle(v)
			local x = entities.get_model_hash(h)
			local playervehicle = entities.get_user_vehicle_as_handle(true)
            if IS_ENTITY_AN_OBJECT(h) then
               	for i = 0, 20 do NETWORK_REQUEST_CONTROL_OF_ENTITY(h) end
                entities.delete_by_handle(h)
			elseif (IS_ENTITY_A_PED(h) and not IS_PED_A_PLAYER(h)) or (not IS_ENTITY_A_PED(h)) and not (playervehicle == h) then
				for i = 0, 20 do NETWORK_REQUEST_CONTROL_OF_ENTITY(h) end
                entities.delete_by_handle(h)
            end
        end
    end
end]]
local function getAreaOfEntities(tbl, range)
    local rangesq = range*range
    local pc = GET_ENTITY_COORDS(players.user_ped())
    for _, v in pairs(tbl) do
        local cc = entities.get_position(v)
        if (VDIST2(pc.x, pc.y, pc.z, cc.x, cc.y, cc.z) <= rangesq) then
            local h = entities.pointer_to_handle(v)
			local playervehicle = entities.get_user_vehicle_as_handle(true)
            if IS_ENTITY_AN_OBJECT(h) then
				if IS_OBJECT_A_PICKUP(h) then
               		return h
				else
					return h
				end
			elseif IS_ENTITY_A_PED(h) and not IS_PED_A_PLAYER(h) then
				return h
			elseif IS_ENTITY_A_VEHICLE(h) and not (playervehicle == h) then
				return h
			else 
				return nil
            end
        end
    end
end

--local x = entities.get_model_hash(h)
menu.toggle_loop(Entitymanagercleararea, "Clear Area of Peds", {"clearpeds"}, "", function ()
	clearAreaOfEntities("ped", CLEAR_AREA_RANGE)
end)
menu.toggle_loop(Entitymanagercleararea, "Clear Area of Vehicles", {"clearvehs"}, "", function ()
    clearAreaOfEntities("veh", CLEAR_AREA_RANGE)
end)
menu.toggle_loop(Entitymanagercleararea, "Clear Area of Objects", {"clearobjs"}, "", function ()
    clearAreaOfEntities("obj", CLEAR_AREA_RANGE)
end)
menu.action(Entitymanagercleararea, "Clear Area of Pickups", {"clearpickups"}, "", function ()
    clearAreaOfEntities("pickup", CLEAR_AREA_RANGE)
end)
menu.toggle_loop(Entitymanagercleararea, "Delete all", {"deleteall"}, "", function ()
    clearAreaOfEntities("ped",CLEAR_AREA_RANGE)
	clearAreaOfEntities("veh", CLEAR_AREA_RANGE)
	clearAreaOfEntities("obj", CLEAR_AREA_RANGE)
	clearAreaOfEntities("pickup", CLEAR_AREA_RANGE)
end)
menu.action(Entitymanagercleararea, "Clear ALL Ropes", {"clearropes"}, "", function()
    for i = 0, 100 do
        DELETE_CHILD_ROPE(i)
    end
end)
menu.slider(Entitymanagercleararea, "Clear Area Range", {"cleararearange"}, "", 0, 10000, 100, 50, function (value)
    CLEAR_AREA_RANGE = value
end)

menu.toggle(player_zeug, "player join nachricht", {}, "", function(on_toggle)
	if on_toggle then
		player_join = true
	else 
		player_join = false
	end
end)

menu.toggle(player_zeug, "Kick leute mit host token spoof", {}, "geht nur auf leute die nach dir in eine sitzung joinen und nicht auf leute wo du gerade rein joinst", function(on_toggle)
	if on_toggle then
		kickhosttokenspoof = true
	else 
		kickhosttokenspoof = false
	end
end)

local anti_russen_zeug = menu.list(player_zeug, "Anti Länder zeug", {}, "")
local leanderauswahl = menu.list(anti_russen_zeug, "länder auswahl", {}, "")
local ESP = menu.list(player_zeug, "ESP", {}, "")
local antivehicleaction = menu.list(player_zeug, "Anti vehicle action", {}, "")


local enabled, enableOnAim = false, false
local xValue, yValue, scaleValue, fovset = 0, 0, 35, 10
local color = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
local maxDistance = 400
local showDistance, showWanted, showRank, showLanguage, showName, showTags, showHealth, showArmor, showKD, showMoney, showWeapon, showInMyVehicle, showVehicle, showSpeed,
	hideInterior, showBounty, showorgandowner, showorgmembers, showVehicleidname = true, false, false, false, true, true, false, false, false, false, true, true, true, false, false, false, false, false, false

	local function getName(pid, inVehicle)
	    local value = ""
	    if showName or inVehicle then
	        value = players.get_name(pid)
	    end
	    local tags = ""
	    if showTags then
	        tags = players.get_tags_string(pid)
	    end
	    if (showTags or inVehicle) and tags:len() > 0 then
	        value = value .. " [" .. tags .. "]"
	    end
	    local preName = ""
	    if not inVehicle then
	        if showWanted then
	            local wanted = GET_PLAYER_WANTED_LEVEL(pid)
	            if wanted > 0 then
	                preName = wanted .. "* "
	            end
	        end
	        if showRank then
	            preName = preName .. "(" .. players.get_rank(pid) .. ") "
	        end
	    end
	    if showLanguage then
	        preName = preName .. "[" .. getLanguage(pid) .. "] "
	    end
	    return preName .. value
	end

	local function renderESP()
		if not enabled then
	        return false
	    end
	    if not util.is_session_started() or IS_PAUSE_MENU_ACTIVE() then
	        return
	    end
	    if enableOnAim and not IS_PLAYER_FREE_AIMING(players.user()) then
	        return
	    end
		local gameX, gameY = memory.alloc(1), memory.alloc(1)
	    local myPed = players.user_ped()
	    local myPos = getPlayerPosition()
	    for _, pid in players.list(false) do
	        local ped = GET_PLAYER_PED(pid)
			if deactivateOnAim and IS_PLAYER_FREE_AIMING(players.user()) then
				if IS_PED_FACING_PED(myPed, ped, fovset) then
					goto continue
				end
			end
	        if IS_PLAYER_DEAD(pid) and not IS_ENTITY_ON_SCREEN(ped) or
	            (hideInterior and getInterior(pid) and not table.contains({"cayoPerico", "ussLex"}, getInterior(pid))) then
	            goto continue
	        end
	        local pPos = getPlayerPosition(pid)
	        local dist = myPos:distance(pPos)
	        if dist > maxDistance then
	            goto continue
	        end
	        local vehicle = getVehicle(ped)
	        local isMyVehicle = false
	        if vehicle then
	            local driver = GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
	            if driver ~= ped and driver ~= myPed and IS_PED_A_PLAYER(driver) then
	                goto continue
	            elseif driver == myPed then
	                if not showInMyVehicle then
	                    goto continue
	                end
	                isMyVehicle = true
	            end
	        end
	        local posToUse = pPos
	        if vehicle and not isMyVehicle then
	            posToUse = GET_ENTITY_COORDS(vehicle)
	        end
	        GET_SCREEN_COORD_FROM_WORLD_COORD(posToUse.x, posToUse.y, posToUse.z + 1, gameX, gameY)
	        local screenX, screenY = memory.read_float(gameX), memory.read_float(gameY)
	        local valuesToDisplay = {}
	        local playersInVehicle = ""
			local vehidname = util.reverse_joaat(players.get_vehicle_model(pid))
	        if vehicle and not isMyVehicle then
	            local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
	            for i = 0, maxPassengers do
	                if not IS_VEHICLE_SEAT_FREE(vehicle, i, false) then
	                    local vehPed = GET_PED_IN_VEHICLE_SEAT(vehicle, i)
	                    if IS_PED_A_PLAYER(vehPed) then
	                        playersInVehicle = playersInVehicle .. getName(NETWORK_GET_PLAYER_INDEX_FROM_PED(vehPed), true) .. ", "
	                    end
	                end
	            end
	        end
	        if showDistance then
	            valuesToDisplay[#valuesToDisplay + 1] = math.floor(dist)
	        end
	        local nameLine = getName(pid)
	        if nameLine:len() > 0 then
	            valuesToDisplay[#valuesToDisplay + 1] = nameLine
	        end
	        if playersInVehicle:len() > 0 then
	            valuesToDisplay[#valuesToDisplay + 1] = "in Vehicle" .. ": " .. playersInVehicle:gsub(", $", "")
	        end
			local orgowner = players.get_boss(pid)
			if showorgandowner then
				if orgowner != -1 then
					local orgtype = getorgtype(orgowner)
					if orgtype != "false" then
						if orgowner == pid then
							valuesToDisplay[#valuesToDisplay + 1] = orgtype.. " [OWNER]"
						else
							valuesToDisplay[#valuesToDisplay + 1] = orgtype.. " [".. players.get_name(orgowner).. "]"
						end
					end
				end
			end
			local orgmembers = ""
			if showorgmembers then
				if orgowner != -1 then
					local orgmem = getorganisationplayers(pid)
					if orgmem != {} then
						for orgmem as orgmember do
							if orgmember != orgowner then
								nameoforgmembers = players.get_name(orgmember)
								orgmembers = orgmembers .. nameoforgmembers .. ","
							end
						end
					end
				end
			end
			if orgmembers:len() > 0 then
				valuesToDisplay[#valuesToDisplay + 1] = "Orgmembers: ".. orgmembers:gsub(", $", "")
			end
	        local hpData = getHealth(ped)
	        if showHealth or showArmor then
	            local textLine = ""
	            if showHealth then
	                textLine = "H: " .. hpData.health .. "/" .. hpData.maxHealth .. " "
	            end
	            if showArmor then
	                textLine = textLine .. "A: " .. hpData.armor .. "/50"
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        if showBounty and players.get_bounty(pid) then
	            valuesToDisplay[#valuesToDisplay + 1] = "$$" .. players.get_bounty(pid)
	        end
	        if showMoney or showKD then
	            local textLine = ""
	            if showKD then
	                textLine = "KD " .. getKD(pid) .. " "
	            end
	            if showMoney then
	                textLine = textLine .. "$" .. getMoney(pid, true)
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        if showWeapon then
	            local weapon = getWeapon(ped)
	            if weapon then
	                valuesToDisplay[#valuesToDisplay + 1] = weapon
	            end
	        end
	        if (showVehicle or showSpeed or showVehicleidname) and vehicle then
	            local textLine = ""
	            if showVehicle then
	                textLine = getmodelnamebyhash(players.get_vehicle_model(pid)) .. " "
	            end
				if showVehicleidname then
					textLine = textLine .. "["..vehidname.."]" .. " "
				end
	            if showSpeed and getSpeed(vehicle, true) > 0 then
	                textLine = textLine .. getSpeed(vehicle)
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        local text = table.concat(valuesToDisplay, "\n")
	        directx.draw_text(screenX + xValue, screenY + yValue, text, 5, scaleValue, color, false)
	        ::continue::
	    end
	end
	
enabledToggle = menu.toggle(ESP, "Enable ESP Player", {"ESP"}, "", function(on_toggle)
	if on_toggle then
		enabled = true
		util.create_tick_handler(renderESP)
	else
		enabled = false
	end
end)
local ESPSettings = menu.list(ESP, "Settings", {}, "")

enableOnAimToggle = menu.toggle(ESPSettings, "enableOnAimOnly", {}, "", function(on)
	enableOnAim = on
end, enableOnAim)
enableOnAim = menu.get_value(enableOnAimToggle)
deactivateOnAimToggle = menu.toggle(ESPSettings, "DeactivateOnAim", {}, "", function(on)
	deactivateOnAim = on
end, deactivateOnAim)
deactivateOnAim = menu.get_value(deactivateOnAimToggle)
fovslider = menu.slider(ESPSettings, "FOV", {}, "", 1, 30, fovset, 1, function(val)
	fovset = val
end)
hideInteriorToggle = menu.toggle(ESPSettings, "hideInterior", {}, "", function(on)
	hideInterior = on
end, hideInterior)
hideInterior = menu.get_value(hideInteriorToggle)
local positionSubmenu = menu.list(ESPSettings, "position", {}, "")
xSlider = menu.slider(positionSubmenu, "XPos", {}, "", -10, 10, xValue, 1, function(val)
	xValue = val / 200
end)
--xValue = menu.get_value(xSlider) / 100
ySlider = menu.slider(positionSubmenu, "YPos", {}, "", -10, 10, yValue, 1, function(val)
	yValue = val / 200
end)
--yValue = menu.get_value(ySlider) / 100
scaleSlider = menu.slider(positionSubmenu, "scale", {}, "", 1, 200, scaleValue, 1, function(val)
	scaleValue = val / 100
end)
scaleValue = menu.get_value(scaleSlider) / 100
colorRef = menu.colour(ESPSettings, "color", {}, "", color, true, function(c)
	color = c
end)
maxDistSlider = menu.slider(ESPSettings, "maxDist", {"setespdist"}, "", 10, 10000, maxDistance, 10, function(val)
	maxDistance = val
end)
maxDistance = menu.get_value(maxDistSlider)

distToggle = menu.toggle(ESP, "showDistance", {}, "", function(on)
	showDistance = on
end, showDistance)
showDistance = menu.get_value(distToggle)
wantedToggle = menu.toggle(ESP, "showWanted", {}, "", function(on)
	showWanted = on
end, showWanted)
showWanted = menu.get_value(wantedToggle)
rankToggle = menu.toggle(ESP, "showRank", {}, "", function(on)
	showRank = on
end, showRank)
showRank = menu.get_value(rankToggle)
langToggle = menu.toggle(ESP, "showLanguage", {}, "", function(on)
	showLanguage = on
end, showLanguage)
showLanguage = menu.get_value(langToggle)
nameToggle = menu.toggle(ESP, "showName", {}, "", function(on)
	showName = on
end, showName)
showName = menu.get_value(nameToggle)
tagsToggle = menu.toggle(ESP, "showTags", {}, "", function(on)
	showTags = on
end, showTags)
showTags = menu.get_value(tagsToggle)
organdownerToggle = menu.toggle(ESP, "showorgandorgOwner", {}, "", function(on)
	showorgandowner = on
end, showorgandowner)
showorgandowner = menu.get_value(organdownerToggle)
orgmembersToggle = menu.toggle(ESP, "showorgmembers", {}, "", function(on)
	showorgmembers = on
end, showorgmembers)
showorgmembers = menu.get_value(orgmembersToggle)
hpToggle = menu.toggle(ESP, "showHealth", {}, "", function(on)
	showHealth = on
end, showHealth)
showHealth = menu.get_value(hpToggle)
armorToggle = menu.toggle(ESP, "showArmor", {}, "", function(on)
	showArmor = on
end, showArmor)
showArmor = menu.get_value(armorToggle)
kdToggle = menu.toggle(ESP, "showKD", {}, "", function(on)
	showKD = on
end, showKD)
showKD = menu.get_value(kdToggle)
bountyToggle = menu.toggle(ESP, "showBounty", {}, "", function(on)
	showBounty = on
end, showBounty)
showBounty = menu.get_value(bountyToggle)
moneyToggle = menu.toggle(ESP, "showMoney", {}, "", function(on)
	showMoney = on
end, showMoney)
showMoney = menu.get_value(moneyToggle)
weaponToggle = menu.toggle(ESP, "showWeapon", {}, "", function(on)
	showWeapon = on
end, showWeapon)
showWeapon = menu.get_value(weaponToggle)
myVehicleToggle = menu.toggle(ESP, "showInMyVehicle", {}, "", function(on)
		showInMyVehicle = on
	end, showInMyVehicle)
showInMyVehicle = menu.get_value(myVehicleToggle)
vehicleToggle = menu.toggle(ESP, "showVehicle", {}, "", function(on)
	showVehicle = on
end, showVehicle)
showVehicle = menu.get_value(vehicleToggle)
vehicleidnameToggle = menu.toggle(ESP, "showVehicle ID name", {}, "", function(on)
	showVehicleidname = on
end, showVehicleidname)
showVehicleidname = menu.get_value(vehicleidnameToggle)
speedToggle = menu.toggle(ESP, "showSpeed", {}, "", function(on)
	showSpeed = on
end, showSpeed)
showSpeed = menu.get_value(speedToggle)

local function getplayertokick(pid)
	if Russian_Federation then
		if pidlanguage(pid) == "Russian Federation" then
			return pid
		end
	end
	if Ukraine then
		if pidlanguage(pid) == "Ukraine" then
			return pid
		end
	end
	if Poland then
		if pidlanguage(pid) == "Poland" then
			return pid
		end
	end
	if France then
		if pidlanguage(pid) == "France" then
			return pid
		end
	end
	if Italy then
		if pidlanguage(pid) == "Italy" then
			return pid
		end
	end
	if Romania then
		if pidlanguage(pid) == "Romania" then
			return pid
		end
	end
	if Czech_Republic then
		if pidlanguage(pid) == "Czech_Republic" then
			return pid
		end
	end
	if Germany then
		if pidlanguage(pid) == "Germany" then
			return pid
		end
	end
	if Austria then
		if pidlanguage(pid) == "Austria" then
			return pid
		end
	end
	return "false"
end

--[[russentimer = 1
local function russenkick(pid)
	if kickrussen then
		if not util.is_session_transition_active() then
			local pidtokick = getplayertokick(pid)
			if pidtokick == "false" then
			else
				if PlayerisFriend(pidtokick) then
				else
					local playername = players.get_name(pidtokick)
					menu.trigger_commands("kick".. playername)
					menu.trigger_commands("kick".. playername)
					--util.toast(playername .."test2", TOAST_ALL)
					repeat
						util.yield()
						russentimer += 1
					until (players.exists(pidtokick) == false) or (russentimer == 3000)
					russentimer = 1
					util.toast(playername.. " wurde gekickt grund: Russe ", TOAST_ALL)
				end
			end
		end
	end
end

players.on_join(russenkick)]]

menu.toggle(leanderauswahl, "Russian Federation", {}, "", function(on_toggle)
	if on_toggle then
		Russian_Federation = true
	else 
		Russian_Federation = false
	end
end)
menu.toggle(leanderauswahl, "Ukraine", {}, "", function(on_toggle)
	if on_toggle then
		Ukraine = true
	else 
		Ukraine = false
	end
end)
menu.toggle(leanderauswahl, "Poland", {}, "", function(on_toggle)
	if on_toggle then
		Poland = true
	else 
		Poland = false
	end
end)
menu.toggle(leanderauswahl, "France", {}, "", function(on_toggle)
	if on_toggle then
		France = true
	else 
		France = false
	end
end)
menu.toggle(leanderauswahl, "Italy", {}, "", function(on_toggle)
	if on_toggle then
		Italy = true
	else 
		Italy = false
	end
end)
menu.toggle(leanderauswahl, "Romania", {}, "", function(on_toggle)
	if on_toggle then
		Romania = true
	else 
		Romania = false
	end
end)
menu.toggle(leanderauswahl, "Czech Republic", {}, "", function(on_toggle)
	if on_toggle then
		Czech_Republic = true
	else 
		Czech_Republic = false
	end
end)
menu.toggle(leanderauswahl, "Germany", {}, "", function(on_toggle)
	if on_toggle then
		Germany = true
	else 
		Germany = false
	end
end)
menu.toggle(leanderauswahl, "Austria", {}, "", function(on_toggle)
	if on_toggle then
		Austria = true
	else 
		Austria = false
	end
end)

menu.toggle(anti_russen_zeug, "Kick Länder", {}, "kickt Länder die nachjoinen", function(on_toggle)
	if on_toggle then
		kickrussen = true
	else 
		kickrussen = false
	end
end)

menu.action(anti_russen_zeug, "Länder aus lobby kicken", {}, "kickt aus deiner lobby jeden der ausgewählten länder", function()
	if (not Czech_Republic) and (not Romania) and (not Italy) and (not France) and (not Poland) and (not Ukraine) and (not Russian_Federation) and (not Germany)and (not Austria) then
		util.toast("keine länder ausgewählt")
		goto end
	end
	for players.list(false, false, true) as pid do
		local pidtokick = getplayertokick(pid)
		if pidtokick == "false" then
		else
			if PlayerisFriend(pidtokick) then
			else
				playername = players.get_name(pidtokick)
				menu.trigger_commands("kick".. playername)
				menu.trigger_commands("kick".. playername)
				util.toast(playername.. " wird gekickt grund: einer der ausgewählten länder", TOAST_ALL)
			end
		end
	end
	::end::
end)

menu.action(anti_russen_zeug, "ausgewählte länder in der lobby", {}, "sagt wie viele spieler von den ausgewählten ländern in der lobby sind", function()
	local russencounter, ukrainecounter, polandcounter, francecounter, italycounter, romaniacounter, czechcounter, germanycoutner, Austriacoutner = 0, 0, 0, 0, 0, 0, 0, 0, 0
	local textline = ""
	local notselectet = false
	local hostpid = players.get_host()
	for players.list(false, false, true) as pid do
			if pidlanguage(pid) == "Russian Federation" then
				russencounter += 1
			end
			if pidlanguage(pid) == "Ukraine" then
				ukrainecounter += 1
			end
			if pidlanguage(pid) == "Poland" then
				polandcounter += 1
			end
			if pidlanguage(pid) == "France" then
				francecounter += 1
			end
			if pidlanguage(pid) == "Italy" then
				italycounter += 1
			end
			if pidlanguage(pid) == "Romania" then
				romaniacounter += 1
			end
			if pidlanguage(pid) == "Czech_Republic" then
				czechcounter += 1
			end
			if pidlanguage(pid) == "Germany" then
				germanycoutner += 1
			end
			if pidlanguage(pid) == "Austria" then
				Austriacoutner += 1
			end
	end
	if (not Czech_Republic) and (not Romania) and (not Italy) and (not France) and (not Poland) and (not Ukraine) and (not Russian_Federation) and (not Germany)and (not Austria) then
		notselectet = true
		util.toast("keine länder ausgewählt")
	end
	if Russian_Federation then
		textline = "\n" ..tostring(russencounter).. " Russian"
	end
	if Ukraine then
		textline = textline.. "\n" ..tostring(ukrainecounter).. " Ukraine"
	end
	if Poland then
		textline = textline.. "\n" ..tostring(polandcounter).. " Poland"
	end
	if France then
		textline = textline.. "\n" ..tostring(francecounter).. " France"
	end
	if Italy then
		textline = textline.. "\n" ..tostring(italycounter).. " Italy"
	end
	if Romania then
		textline = textline.. "\n" ..tostring(romaniacounter).. " Romania"
	end
	if Czech_Republic then
		textline = textline.. "\n" ..tostring(czechcounter).. " Czech_Republic"
	end
	if Germany then
		textline = textline.. "\n" ..tostring(germanycoutner).. " Germany"
	end
	if Austria then
		textline = textline.. "\n" ..tostring(Austriacoutner).. " Austria"
	end
	if textline != "" then
		textline = string.replace(textline, "\n", "", 1)
		util.toast(textline)
	end
end)

timer6 = 1
local function kickhosttoken(pid)
	if kickhosttokenspoof then
	if not util.is_session_transition_active() then
		util.yield(5)
		local hostqueue = players.get_host_queue_position(pid)
		if hostkickfriends then
			local pidname = players.get_name(pid)
			--util.toast(pidname.. " test 2 ".. hostqueue)
			timer6 = 1
			if hostqueue == 1 then
				if players.is_marked_as_modder(pid) then
					menu.trigger_commands("kick ".. pidname)
					menu.trigger_commands("kick ".. pidname)
					util.toast(pidname.. " wurde gekicked Grund: Host Token Spoof", TOAST_ALL)
				end
			end
		else
			if not PlayerisFriend(pid) then
				local pidname = players.get_name(pid)
				--util.toast(pidname.. " test 2 ".. hostqueue)
				timer6 = 1
				if hostqueue == 1 then
					if players.is_marked_as_modder(pid) then
						menu.trigger_commands("kick ".. pidname)
						menu.trigger_commands("kick ".. pidname)
						menu.trigger_commands("kick ".. pidname)
						menu.trigger_commands("kick ".. pidname)
						menu.trigger_commands("kick ".. pidname)
						util.toast(pidname.. " wurde gekicked Grund: Host Token Spoof", TOAST_ALL)
					end
				end
			end
		end
	end
	end
end

players.on_join(kickhosttoken)
players.on_join(playerjoinmassge)

local vehicletablefotactions = {}
local function sortKeys(a, b)
	local ta, tb = type(a), type(b)
 
 
	if ta == tb and (ta == 'string' or ta == 'number') then
	   return (a) < (b)
	end
 
	local dta = defaultTypeOrders[ta] or 100
	local dtb = defaultTypeOrders[tb] or 100
 
 
	return dta == dtb and ta < tb or dta < dtb
 end

 function vehicle_spawn_list(root)
    local general_list = root
    local all_vehicles = util.get_vehicles()

    local vehicles = util.get_vehicles()
    table.sort(all_vehicles, function(a, b)
        if a.class != b.class then
            return lang.get_string(a.class) < lang.get_string(b.class)
        end
        return a.name < b.name
    end)
    
    local current_class
    local current_class_list
    for all_vehicles as vehicle do
        if current_class != vehicle.class then
            current_class = vehicle.class
            current_class_list = general_list:list(vehicle.class)
        end

		--(util.get_label_text(vehicle.name)
        local vehicle_name = util.get_label_text(vehicle.name)
        if vehicle_name == "NULL" then
			vehicle_name = getmodelnamebyhash(util.joaat(vehicle.name))
            --continue
       	end
		local vehhash1 = util.joaat(vehicle.name)

        local action = current_class_list:toggle(vehicle_name, {"antivehicle"..vehhash1}, "", function(on_toggle)
			local vehname = vehicle.name
			local realvehname = util.get_label_text(vehname)
			local vehhash = util.joaat(vehicle.name)
			if on_toggle then
				local vehhash = menu.action(vehiclesactivate,realvehname, {"antivehicleactivate"..vehhash}, "drück einfach drauf wenn du es raus nehmen willst", function()
					menu.trigger_commands("antivehicle"..vehhash)
				end)
				table.insert(vehicletablefotactions, vehname)
			else
				if menu.is_ref_valid(menu.ref_by_command_name("antivehicleactivate"..vehhash)) then
					menu.delete(menu.ref_by_command_name("antivehicleactivate"..vehhash))
				end
				for a, vehhashtable in ipairs(vehicletablefotactions) do
					if vehhashtable == vehname then
						table.remove(vehicletablefotactions, a)
					end
				end
			end
        end)
    end
end

antiactionvehicles = menu.list(antivehicleaction, "vehicles auswahl", {}, "commands einfach ignorieren sind nur eine hilfe für mich")
vehiclesactivate = menu.list(antiactionvehicles, "aktivierte vehicle", {}, "")
antivehiclesettings = menu.list(antivehicleaction, "Settings", {}, "")

local maxDistanceantiaction = 1000
local antiactionfriends, antiactionnotify, antiactionsearchclear = false, true, true

maxDistSliderantiaction = menu.slider(antivehiclesettings, "Dist", {"setactiondist"}, "random fahrzeuge können erst von dir ab ~ 800 gesehen werden\nfahrzeuge wie z.b. oppressor MKII wird auf der karte angezeigt als besonderes fahrzeug das geht von überall (meistens)", 10, 10000, maxDistanceantiaction, 10, function(val)
	maxDistanceantiaction = val
end)
maxDistanceantiaction = menu.get_value(maxDistSliderantiaction)
friendsToggle = menu.toggle(antivehiclesettings, "Freunde auch", {}, "", function(on)
	antiactionfriends = on
end, antiactionfriends)
antiactionfriends = menu.get_value(friendsToggle)
notifyactionToggle = menu.toggle(antivehiclesettings, "Notify bekommen", {}, "", function(on)
	antiactionnotify = on
end, antiactionnotify)
antiactionnotify = menu.get_value(notifyactionToggle)

menu.text_input(antiactionvehicles, "addveh", {"addtoantiveh"}, "WICHITG!!!!!!\ndort muss der id name vom auto rein.\num zu schauen wie der id name ist geh zum spawn menu von stand und gib das fahrzeug ein was du willst dann steht dort als befehl der id name\nich habe bei meinem esp ein anzeige gemacht wo man sehen kann was der name ist (id name)", function(input)
	local hash = util.joaat(input)
	for util.get_vehicles() as vehicles do
		local hashveh = util.joaat(vehicles.name)
		if hash == hashveh then
			if menu.is_ref_valid(menu.ref_by_command_name("antivehicle"..hash)) then
				menu.trigger_commands("antivehicle"..hash.. " on")
				util.toast(getmodelnamebyhash(hash).. " wurde zur liste hinzugefügt")
			else
				util.toast("["..input.. "] gibt es nicht in dieser liste")
			end
		end
	end
	menu.set_value(menu.ref_by_command_name("addtoantiveh"), "")
end)
local searchvehciletable = {}
local function clearsearchlist()
	for searchvehciletable as vehicle do
		local hash = util.joaat(vehicle)
		local valid = menu.is_ref_valid(menu.ref_by_command_name("antivehiclesearchactivate"..hash))
			if valid then
				menu.delete(menu.ref_by_command_name("antivehiclesearchactivate"..hash))
				util.yield()
			end
	end
	searchvehciletable = {}
end

antivehiclessearch = menu.list(antiactionvehicles, "Search", {}, "")

searchclreaactionToggle = menu.toggle(antivehiclessearch, "Auto clear search", {}, "", function(on)
	antiactionsearchclear = on
end, antiactionsearchclear)
antiactionsearchclear = menu.get_value(searchclreaactionToggle)

menu.action(antivehiclessearch, "Clear list", {}, "", function()
	for searchvehciletable as vehicle do
		local hash = util.joaat(vehicle)
		local valid = menu.is_ref_valid(menu.ref_by_command_name("antivehiclesearchactivate"..hash))
			if valid then
				menu.delete(menu.ref_by_command_name("antivehiclesearchactivate"..hash))
				util.yield()
			end
	end
	searchvehciletable = {}
end)
menu.text_input(antivehiclessearch, "Search", {"searchofvehicles"}, "such nicht während es gerade die aktuelle suche läd = mega läg vlt auch fehler", function(input)
	if antiactionsearchclear then
		clearsearchlist()
	end
	if input == "" then
		goto end
	end
	for util.get_vehicles() as vehicle do
		local hash = util.joaat(vehicle.name)
		local vehiclename =	getmodelnamebyhash(hash)
		local stringsetting = vehiclename.. " ".. vehicle.name
		stringsetting = stringsetting:lower()
		input = input:lower()
		if string.match(stringsetting, input) then --or string.match(vehicle.name, input) then
			table.insert(searchvehciletable, vehicle.name)
			local hash = menu.action(antivehiclessearch,vehiclename .."  [".. vehicle.name.."]" , {"antivehiclesearchactivate"..hash}, "drück einfach drauf", function()
				local hash1 = hash
				local vehiclena = vehiclename
					local getvalue = menu.get_value(menu.ref_by_command_name("antivehicle"..hash))
				if getvalue then
					menu.trigger_commands("antivehicle"..hash1.. " off")
					util.toast(vehiclena.." Wurde aus liste entfernt")
				else
					menu.trigger_commands("antivehicle"..hash1.. " on")
					util.toast(vehiclena.." Wurde zur liste hinzugefügt")
				end
			end)
		end
	end
	::end::
end)

menu.toggle_loop(antivehicleaction, "kick of vehicle", {}, "dadurch kann er das fahrzeug meistens nicht mehr benutzen und muss es neu rufen", function()
	local timer = 0
	for players.list(false, true, true) as pid do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if IS_PED_IN_ANY_VEHICLE(ped) then
			local vehicle = GET_VEHICLE_PED_IS_USING(ped)
			local vehicleofpid = players.get_vehicle_model(pid)
			local pidname = players.get_name(pid)
			local myPos = players.get_position(players.user())
			local pPos = getPlayerPosition(pid)
	        local dist = myPos:distance(pPos)
			local fullvehname = getmodelnamebyhash(vehicleofpid)
			if PlayerisFriend(pid) and not antiactionfriends then
				goto continue
			end
			--local modelhash = entities.get_model_hash(vehicle)
			if vehicletablefotactions != {} and vehicleofpid != 0 then
				for vehicletablefotactions as vehname do
					local hash = util.joaat(vehname)
					if hash == vehicleofpid then
						if dist < maxDistanceantiaction then
							SET_VEHICLE_EXCLUSIVE_DRIVER(vehicle, players.user_ped(), 0)
							repeat
								util.yield()
								timer += 1
								vehicleofpid = players.get_vehicle_model(pid)
							until vehicleofpid == 0 or timer == 200
							if timer == 200 then
								if antiactionnotify then
									util.toast(pidname.."  Konnte ihn nicht aus dem fahrzeug kicken")
								end
							else
								if antiactionnotify then
									util.toast(pidname.. " wurde aus dem ".. fullvehname .." gekickt")
								end
							end
							timer = 0
						end
					end
				end
			end
		end
		::continue::
	end
end)
menu.toggle_loop(antivehicleaction, "kick of vehicle V2", {}, "benutzt stand sein player vehicle kick\nwürde ich nicht so empfehlen spamt dann halt gut benachrichtigungen", function()
	local timer = 0
	for players.list(false, true, true) as pid do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if IS_PED_IN_ANY_VEHICLE(ped) then
			local vehicle = GET_VEHICLE_PED_IS_USING(ped)
			local vehicleofpid = players.get_vehicle_model(pid)
			local pidname = players.get_name(pid)
			local myPos = players.get_position(players.user())
			local pPos = getPlayerPosition(pid)
	        local dist = myPos:distance(pPos)
			local fullvehname = getmodelnamebyhash(vehicleofpid)
			if PlayerisFriend(pid) and not antiactionfriends then
				goto continue
			end
			--local modelhash = entities.get_model_hash(vehicle)
			if vehicletablefotactions != {} and vehicleofpid != 0 then
				for vehicletablefotactions as vehname do
					local hash = util.joaat(vehname)
					if hash == vehicleofpid then
						if dist < maxDistanceantiaction then
							menu.trigger_commands("vehkick"..pidname)
							repeat
								util.yield()
								timer += 1
								vehicleofpid = players.get_vehicle_model(pid)
							until vehicleofpid == 0 or timer == 200
							if timer == 200 then
								if antiactionnotify then
									util.toast(pidname.."  Konnte ihn nicht aus dem fahrzeug kicken")
								end
							else
								if antiactionnotify then
									util.toast(pidname.. " wurde aus dem ".. fullvehname .." gekickt")
								end
							end
							timer = 0
						end
					end
				end
			end
		end
		::continue::
	end
end)
menu.toggle_loop(antivehicleaction, "EMP vehicle", {}, "", function()
	local timer = 0
	for players.list(false, true, true) as pid do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if IS_PED_IN_ANY_VEHICLE(ped) then
			local vehicle = GET_VEHICLE_PED_IS_USING(ped)
			local vehicleofpid = players.get_vehicle_model(pid)
			local pidname = players.get_name(pid)
			local disvehbyemp = GET_IS_VEHICLE_DISABLED_BY_EMP(vehicle)
			local myPos = players.get_position(players.user())
			local pPos = getPlayerPosition(pid)
	        local dist = myPos:distance(pPos)
			local fullvehname = getmodelnamebyhash(vehicleofpid)
			if PlayerisFriend(pid) and not antiactionfriends then
				goto continue
			end
			if disvehbyemp then
				goto continue
			end
			--local modelhash = entities.get_model_hash(vehicle)
			if vehicletablefotactions != {} and vehicleofpid != 0 then
				for vehicletablefotactions as vehname do
					local hash = util.joaat(vehname)
					if hash == vehicleofpid then
						if dist < maxDistanceantiaction then
							--menu.trigger_commands("delveh"..pidname)
							if getcontrole(vehicle) then
								repeat
									util.yield()
									timer += 1
									menu.trigger_commands("empveh"..pidname)
									disvehbyemp = GET_IS_VEHICLE_DISABLED_BY_EMP(vehicle)
								until disvehbyemp or timer == 150
								if timer == 150 then
									if antiactionnotify then
										util.toast(pidname.."  Sein fahrzeug konnte nicht mit EMP versetzt werden")
									end
								elseif disvehbyemp then
									if antiactionnotify then
										util.toast(pidname.. "  wurde sein ".. fullvehname .." mit EMP versetzt")
									end
								end
								timer = 0
							else
								if antiactionnotify then
									util.toast(pidname.. "  konnte keine kontrolle bekommen")
								end
							end
						end
					end
				end
			end
		end
		::continue::
	end
end)
menu.toggle_loop(antivehicleaction, "Delete vehicle", {}, "", function()
	local timer = 0
	for players.list(false, true, true) as pid do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if IS_PED_IN_ANY_VEHICLE(ped) then
			local vehicle = GET_VEHICLE_PED_IS_USING(ped)
			local vehicleofpid = players.get_vehicle_model(pid)
			local pidname = players.get_name(pid)
			local myPos = players.get_position(players.user())
			local pPos = getPlayerPosition(pid)
	        local dist = myPos:distance(pPos)
			local fullvehname = getmodelnamebyhash(vehicleofpid)
			if PlayerisFriend(pid) and not antiactionfriends then
				goto continue
			end
			--local modelhash = entities.get_model_hash(vehicle)
			if vehicletablefotactions != {} and vehicleofpid != 0 then
				for vehicletablefotactions as vehname do
					local hash = util.joaat(vehname)
					if hash == vehicleofpid then
						if dist < maxDistanceantiaction then
							--menu.trigger_commands("delveh"..pidname)
							if getcontrole(vehicle) then
								entities.delete(vehicle)
								repeat
									util.yield()
									timer += 1
									vehicleofpid = players.get_vehicle_model(pid)
								until vehicleofpid == 0 or timer == 200 or (not isinveh)
								if timer == 200 then
									if antiactionnotify then
										util.toast(pidname.."  Sein fahrzeug konnte nicht gelöscht werden")
									end
								else
									if antiactionnotify then
										util.toast(pidname.. "  wurde sein ".. fullvehname .." gelöscht")
									end
								end
								timer = 0
							else
								if antiactionnotify then
									util.toast(pidname.. "  konnte keine kontrolle bekommen")
								end
							end
						end
					end
				end
			end
		end
		::continue::
	end
end)
menu.toggle_loop(antivehicleaction, "Explode vehicle", {}, "", function()
	local timer = 0
	for players.list(false, true, true) as pid do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if IS_PED_IN_ANY_VEHICLE(ped) then
			local vehicle = GET_VEHICLE_PED_IS_USING(ped)
			local vehicleofpid = players.get_vehicle_model(pid)
			local health = GET_VEHICLE_ENGINE_HEALTH(vehicle)
			local pidname = players.get_name(pid)
			local myPos = players.get_position(players.user())
			local pidtags = players.get_tags_string(pid)
			local pPos = getPlayerPosition(pid)
	        local dist = myPos:distance(pPos)
			local fullvehname = getmodelnamebyhash(vehicleofpid)
			if PlayerisFriend(pid) and not antiactionfriends then
				goto continue
			end
			if players.is_godmode(pid) then
				goto continue
			end
			--local modelhash = entities.get_model_hash(vehicle)
			if vehicletablefotactions != {} and vehicleofpid != 0 then
				for vehicletablefotactions as vehname do
					local hash = util.joaat(vehname)
					if hash == vehicleofpid then
						if dist < maxDistanceantiaction then
							if GET_ENTITY_CAN_BE_DAMAGED(vehicle) then
								if health > 0 and not IS_PED_DEAD_OR_DYING(ped, 1) then
									repeat
										util.yield()
										timer += 1
										health = GET_VEHICLE_ENGINE_HEALTH(vehicle)
										pPos = getPlayerPosition(pid)
										ADD_EXPLOSION(pPos.x, pPos.y, pPos.z, 6, 1, true, false, 0.0, false)
									until (health < 0) or (timer > 200)
									if timer > 200 then
										if antiactionnotify then
											util.toast(pidname.."  Konnte ihn nicht Töten/fahrzeug zerstören")
										end
									elseif health < 0 then
										if antiactionnotify then
											util.toast(pidname.. " Sein ".. fullvehname .." ist zerstört")
										end
									end
									timer = 0
								end
							end
						end
					end
				end
			end
		end
		::continue::
	end
end)

local actionen = menu.list(custselc, "actionen", {}, "")
local friendly = menu.list(actionen, "Friendly stuff", {}, "")
local kicken = menu.list(actionen, "Kick/crash stuff", {}, "")
local tp = menu.list(actionen, "TP", {}, "")
local trolling = menu.list(actionen, "Trolling", {}, "")
removeexclude = menu.divider(actionen, "Remove player from list")
-- custon selection begin
menu.toggle(custselc, "Exclude Selected", {"Excludeselected"}, "", function(on_toggle)
	if on_toggle then
		excludeselected = true
		excludeselected1 = menu.action(friendly, "!!!Exclude Selected ist AN!!!", {}, "drück drauf um nicht mehr Exclude selected an zu haben", function()
			menu.trigger_commands("excludeselected off")
		end)
		excludeselected2 = menu.action(kicken, "!!!Exclude Selected ist AN!!!", {}, "drück drauf um nicht mehr Exclude selected an zu haben", function()
			menu.trigger_commands("excludeselected off")
		end)
		excludeselected3 = menu.action(tp, "!!!Exclude Selected ist AN!!!", {}, "drück drauf um nicht mehr Exclude selected an zu haben", function()
			menu.trigger_commands("excludeselected off")
		end)
		excludeselected4 = menu.action(trolling, "!!!Exclude Selected ist AN!!!", {}, "drück drauf um nicht mehr Exclude selected an zu haben", function()
			menu.trigger_commands("excludeselected off")
		end)
		excludeselected5 = menu.action(actionen, "!!!Exclude Selected ist AN!!!", {}, "drück drauf um nicht mehr Exclude selected an zu haben", function()
			menu.trigger_commands("excludeselected off")
		end)
	else
		excludeselected = false
		menu.delete(excludeselected1)
		menu.delete(excludeselected2)
		menu.delete(excludeselected3)
		menu.delete(excludeselected4)
		menu.delete(excludeselected5)
	end
end)

menu.action(custselc, "seite reseten", {}, "passiert das bei mission ein fehler kommt einfach die seite hier mit reseten dann easy", function(pids)
	for pids = 0, 31 do
		if players.exists(pids) then
		if menu.is_ref_valid(menu.ref_by_command_name("selected" ..pids)) then
			menu.delete(cmd_id[pids])
			util.yield(10)
			if players.exists(pids) then
				cmd_id[pids] = menu.toggle(custselc, tostring(players.get_name(pids)), {"selected" .. pids}, "PID - ".. pids, function(on_toggle)
					if on_toggle then
						selectedplayer[pids] = true
						listfriendly[pids] = menu.action(friendly, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
							if players.user() and players.exists(pids) then
								menu.trigger_commands("selected" .. pids .. " " .. "off")
							else
								menu.delete(listfriendly[pids])
								menu.delete(listkicken[pids])
								menu.delete(listtp[pids])
								menu.delete(listtrolling[pids])
								menu.delete(listgenerel[pids])
							end
						end)
						listkicken[pids] = menu.action(kicken, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
							if players.user() and players.exists(pids) then
								menu.trigger_commands("selected" .. pids .. " " .. "off")
							else
								menu.delete(listfriendly[pids])
								menu.delete(listkicken[pids])
								menu.delete(listtp[pids])
								menu.delete(listtrolling[pids])
								menu.delete(listgenerel[pids])
							end
						end)
						listtp[pids] = menu.action(tp, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
							if players.user() and players.exists(pids) then
								menu.trigger_commands("selected" .. pids .. " " .. "off")
							else
								menu.delete(listfriendly[pids])
								menu.delete(listkicken[pids])
								menu.delete(listtp[pids])
								menu.delete(listtrolling[pids])
								menu.delete(listgenerel[pids])
							end
						end)
						listtrolling[pids] = menu.action(trolling, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
							if players.user() and players.exists(pids) then
								menu.trigger_commands("selected" .. pids .. " " .. "off")
							else
								menu.delete(listfriendly[pids])
								menu.delete(listkicken[pids])
								menu.delete(listtp[pids])
								menu.delete(listtrolling[pids])
								menu.delete(listgenerel[pids])
							end
						end)
						listgenerel[pids] = menu.action(actionen, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
							if players.user() and players.exists(pids) then
								menu.trigger_commands("selected" .. pids .. " " .. "off")
							else
								menu.delete(listfriendly[pids])
								menu.delete(listkicken[pids])
								menu.delete(listtp[pids])
								menu.delete(listtrolling[pids])
								menu.delete(listgenerel[pids])
							end
						end)
					else
						selectedplayer[pids] = false
						menu.delete(listfriendly[pids])	
						menu.delete(listkicken[pids])
						menu.delete(listtp[pids])
						menu.delete(listtrolling[pids])
						menu.delete(listgenerel[pids])
					end
				end)
			end
		end
		end
	end
end)
menu.divider(custselc, "Players")

menu.action(friendly, "automatisches healen ON", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("autoheal " .. GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("autoheal " .. GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "automatisches healen OFF", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("autoheal " .. GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("autoheal " .. GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Nie Gefahndet ON", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("bail " .. GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("bail " .. GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Nie Gefahndet OFF", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("bail " .. GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("bail " .. GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Vom Rader Verschwinde ON", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("giveotr " .. GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("giveotr " .. GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Vom Rader Verschwinde OFF", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("giveotr " .. GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("giveotr " .. GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		end
	end
end)


menu.action(kicken, "modder kicken", {}, "kicked alle die eine modder flag haben", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) and players.is_marked_as_modder(pids) then
				if not PlayerisFriend(pids) then
						  menu.trigger_commands("kick " .. GET_PLAYER_NAME(pids))
					util.yield()
				end
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) and players.is_marked_as_modder(pids) then
				if not PlayerisFriend(pids) then
						   menu.trigger_commands("kick " .. GET_PLAYER_NAME(pids))
							util.yield()
				end
			end
		end
	end
end)


menu.action(kicken, "Kick", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
							menu.trigger_commands("kick " .. GET_PLAYER_NAME(pids))
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("kick " .. GET_PLAYER_NAME(pids))
				util.yield()
			end
		end
	end
end)


menu.action(kicken, "Crash", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				util.toast("SE Crash has been sent to " .. GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. GET_PLAYER_NAME(pids))
				util.toast("SE Crash has been sent to " .. GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		end
	end
end)

menu.action(tp, "Richtiges Teleportiren", {}, "Teleportiert die zu dir", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
				pos = players.get_position(players.user())
				ppos = players.get_position(pids)
				vehin = IS_PED_IN_ANY_VEHICLE(ped, true)
				menu.trigger_commands("summon"..GET_PLAYER_NAME(pids))
				if (VDIST2(pos.x,pos.y,pos.z,ppos.x,ppos.y,ppos.z) >= 1000000) then
					util.yield(3500)
					util.toast("TP " .. GET_PLAYER_NAME(pids))
				else
					util.toast("TP " .. GET_PLAYER_NAME(pids))
					util.yield(2000)
				end
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
				pos = players.get_position(players.user())
				ppos = players.get_position(pids)
				vehin = IS_PED_IN_ANY_VEHICLE(ped, true)
				menu.trigger_commands("summon"..GET_PLAYER_NAME(pids))
				if (VDIST2(pos.x,pos.y,pos.z,ppos.x,ppos.y,ppos.z) >= 1000000) then
					util.yield(3500)
					util.toast("TP " .. GET_PLAYER_NAME(pids))
				else
					util.toast("TP " .. GET_PLAYER_NAME(pids))
					util.yield(2000)
				end
			end
		end
	end
end)

menu.action(tp, "apr Teleportiren", {}, "Teleportiert die in die nähe von dir in ein apartment", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				local ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("aptme" .. GET_PLAYER_NAME(pids))
				util.toast("TP " .. GET_PLAYER_NAME(pids))
				util.yield(2000)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				local ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("aptme" .. GET_PLAYER_NAME(pids))
				util.toast("TP " .. GET_PLAYER_NAME(pids))
				util.yield(2000)
			end
		end
	end
end)

menu.toggle(tp, "Apartments anzeigen", {}, "Die werden mit Zahlen angezeigt", function(on_toggle)
	if on_toggle then
		menu.trigger_commands("showapartments " .. "on")
	else
		menu.trigger_commands("showapartments " .. "off")
	end
end)


menu.action(tp, "auto Teleportiren", {}, "TP nur leute die in einem auto sitzen sonst nicht", function()
	for pids = 0, 31 do
		local ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					if IS_PED_IN_ANY_VEHICLE(ped,true) then
						menu.trigger_commands("demigodmode " .. "on")
						menu.trigger_commands("summon " .. GET_PLAYER_NAME(pids))
						util.toast("auto TP " .. GET_PLAYER_NAME(pids))
						util.yield(2000)
						menu.trigger_commands("demigodmode " .. "off")
					else
						menu.trigger_commands("spectate" .. GET_PLAYER_NAME(pids) .. " on")
						util.yield(3000)
						if IS_PED_IN_ANY_VEHICLE(ped,true) then
							menu.trigger_commands("demigodmode " .. "on")
							menu.trigger_commands("summon " .. GET_PLAYER_NAME(pids))
							menu.trigger_commands("spectate" .. GET_PLAYER_NAME(pids) .. " off")
							util.toast("auto TP " .. GET_PLAYER_NAME(pids))
							util.yield(2000)
							menu.trigger_commands("demigodmode " .. "off")
						else
							menu.trigger_commands("spectate" .. GET_PLAYER_NAME(pids) .. " off")
							util.toast("ist nicht im auto " .. GET_PLAYER_NAME(pids))
							util.yield(2000)
						end
					end
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					if IS_PED_IN_ANY_VEHICLE(ped,true) then
						menu.trigger_commands("demigodmode " .. "on")
						menu.trigger_commands("summon " .. GET_PLAYER_NAME(pids))
						util.toast("auto TP " .. GET_PLAYER_NAME(pids))
						util.yield(2000)
						menu.trigger_commands("demigodmode " .. "off")
					else
						menu.trigger_commands("spectate" .. GET_PLAYER_NAME(pids) .. " on")
						util.yield(3000)
						if IS_PED_IN_ANY_VEHICLE(ped,true) then
							menu.trigger_commands("demigodmode " .. "on")
							menu.trigger_commands("summon " .. GET_PLAYER_NAME(pids))
							menu.trigger_commands("spectate" .. GET_PLAYER_NAME(pids) .. " off")
							util.toast("auto TP " .. GET_PLAYER_NAME(pids))
							util.yield(2000)
							menu.trigger_commands("demigodmode " .. "off")
						else
							menu.trigger_commands("spectate" .. GET_PLAYER_NAME(pids) .. " off")
							util.toast("ist nicht im auto " .. GET_PLAYER_NAME(pids))
							util.yield(2000)
						end
					end
			end
		end
	end
end)


menu.action(trolling, "Vehicle Kick", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				local ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("vehkick" .. GET_PLAYER_NAME(pids))
				util.toast("Vehicle Kick has been sent to " .. GET_PLAYER_NAME(pids))
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				local ped = GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("vehkick" .. GET_PLAYER_NAME(pids))
				util.toast("Vehicle Kick has been sent to " .. GET_PLAYER_NAME(pids))
			end
		end
	end
end)


menu.action(trolling, "Freeze on", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. GET_PLAYER_NAME(pids) .. " " .. "on")
				util.toast("Freeze ist jetzt an " .. GET_PLAYER_NAME(pids))
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. GET_PLAYER_NAME(pids) .. " " .. "on")
				util.toast("Freeze ist jetzt an " .. GET_PLAYER_NAME(pids))
			end
		end
	end
end)


menu.action(trolling, "Freeze off", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. GET_PLAYER_NAME(pids) .. " " .. "off")
				util.toast("Freeze ist jetzt aus für " .. GET_PLAYER_NAME(pids))
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. GET_PLAYER_NAME(pids) .. " " .. "off")
				util.toast("Freeze ist jetzt aus für " .. GET_PLAYER_NAME(pids))
			end
		end
	end
end)

menu.divider(friendly, "Selected Players")
menu.divider(kicken, "Selected Players")
menu.divider(tp, "Selected Players")
menu.divider(trolling, "Selected Players")

for pids = 0, 31 do
	if players.exists(pids) then
		cmd_id[pids] = menu.toggle(custselc, tostring(players.get_name(pids)), {"selected" .. pids}, "PID - ".. pids, function(on_toggle)
			if on_toggle then
				selectedplayer[pids] = true
				listfriendly[pids] = menu.action(friendly, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
					if players.user() and players.exists(pids) then
						menu.trigger_commands("selected" .. pids .. " " .. "off")
					else
						menu.delete(listfriendly[pids])
						menu.delete(listkicken[pids])
						menu.delete(listtp[pids])
						menu.delete(listtrolling[pids])
						menu.delete(listgenerel[pids])
					end
				end)
				listkicken[pids] = menu.action(kicken, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
					if players.user() and players.exists(pids) then
						menu.trigger_commands("selected" .. pids .. " " .. "off")
					else
						menu.delete(listfriendly[pids])
						menu.delete(listkicken[pids])
						menu.delete(listtp[pids])
						menu.delete(listtrolling[pids])
						menu.delete(listgenerel[pids])
					end
				end)
				listtp[pids] = menu.action(tp, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
					if players.user() and players.exists(pids) then
						menu.trigger_commands("selected" .. pids .. " " .. "off")
					else
						menu.delete(listfriendly[pids])
						menu.delete(listkicken[pids])
						menu.delete(listtp[pids])
						menu.delete(listtrolling[pids])
						menu.delete(listgenerel[pids])
					end
				end)
				listtrolling[pids] = menu.action(trolling, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
					if players.user() and players.exists(pids) then
						menu.trigger_commands("selected" .. pids .. " " .. "off")
					else
						menu.delete(listfriendly[pids])
						menu.delete(listkicken[pids])
						menu.delete(listtp[pids])
						menu.delete(listtrolling[pids])
						menu.delete(listgenerel[pids])
					end
				end)
				listgenerel[pids] = menu.action(actionen, tostring(players.get_name(pids)), {}, "PID - ".. pids, function()
					if players.user() and players.exists(pids) then
						menu.trigger_commands("selected" .. pids .. " " .. "off")
					else
						menu.delete(listfriendly[pids])
						menu.delete(listkicken[pids])
						menu.delete(listtp[pids])
						menu.delete(listtrolling[pids])
						menu.delete(listgenerel[pids])
					end
				end)
			else
				selectedplayer[pids] = false
				menu.delete(listfriendly[pids])	
				menu.delete(listkicken[pids])
				menu.delete(listtp[pids])
				menu.delete(listtrolling[pids])
				menu.delete(listgenerel[pids])
			end
		end)
	end
end

local function update_join(pid)
	util.yield(300)
local name = players.get_name(pid)
cmd_id[pid] = menu.toggle(custselc, name, {"selected" .. pid}, "PID - ".. pid, function(on_toggle)
	if on_toggle then
		selectedplayer[pid] = true
		listfriendly[pid] = menu.action(friendly, tostring(players.get_name(pid)), {}, "PID - ".. pid, function()
			if players.user() and players.exists(pid) then
				menu.trigger_commands("selected" .. pid .. " " .. "off")
			else
				menu.delete(listfriendly[pid])
				menu.delete(listkicken[pid])
				menu.delete(listtp[pid])
				menu.delete(listtrolling[pid])
				menu.delete(listgenerel[pid])
			end
		end)
		listkicken[pid] = menu.action(kicken, tostring(players.get_name(pid)), {}, "PID - ".. pid, function()
			if players.user() and players.exists(pid) then
				menu.trigger_commands("selected" .. pid .. " " .. "off")
			else
				menu.delete(listfriendly[pid])
				menu.delete(listkicken[pid])
				menu.delete(listtp[pid])
				menu.delete(listtrolling[pid])
				menu.delete(listgenerel[pid])
			end
		end)
		listtp[pid] = menu.action(tp, tostring(players.get_name(pid)), {}, "PID - ".. pid, function()
			if players.user() and players.exists(pid) then
				menu.trigger_commands("selected" .. pid .. " " .. "off")
			else
				menu.delete(listfriendly[pid])
				menu.delete(listkicken[pid])
				menu.delete(listtp[pid])
				menu.delete(listtrolling[pid])
				menu.delete(listgenerel[pid])
			end
		end)
		listtrolling[pid] = menu.action(trolling, tostring(players.get_name(pid)), {}, "PID - ".. pid, function()
			if players.user() and players.exists(pid) then
				menu.trigger_commands("selected" .. pid .. " " .. "off")
			else
				menu.delete(listfriendly[pid])
				menu.delete(listkicken[pid])
				menu.delete(listtp[pid])
				menu.delete(listtrolling[pid])
				menu.delete(listgenerel[pid])
			end
		end)
		listgenerel[pid] = menu.action(actionen, tostring(players.get_name(pid)), {}, "PID - ".. pid, function()
			if players.user() and players.exists(pid) then
				menu.trigger_commands("selected" .. pid .. " " .. "off")
			else
				menu.delete(listfriendly[pid])
				menu.delete(listkicken[pid])
				menu.delete(listtp[pid])
				menu.delete(listtrolling[pid])
				menu.delete(listgenerel[pid])
			end
		end)
	else
				selectedplayer[pid] = false
				menu.delete(listfriendly[pid])	
				menu.delete(listkicken[pid])
				menu.delete(listtp[pid])
				menu.delete(listtrolling[pid])
				menu.delete(listgenerel[pid])
	end
end)
end

GenerateFeatures = function(pid)
cage = util.joaat("prop_gascage01")
ladder = 1888301071
ground = -1951226014
attach = 1
veh_to_attach = 1

function v3_2(x, y, z)
	if x == nil then
		x = 0
	end
	if y == nil then
		y = 0
	end
	if z == nil then
		z = 0
	end
end
end

local InitialPlayersList = players.list(true, true, true)
for i = 1, #InitialPlayersList do
GenerateFeatures(InitialPlayersList[i])
end

players.on_join(GenerateFeatures)
players.on_join(update_join)

menu.action(misc, "Firework test", {}, "", function()
	local playeroffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +0.5, -1)
	local fireowrkpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +0.5, +1)
	local hashofobj = util.joaat("ind_prop_firework_04")
	request_anim_dict("anim@mp_fireworks")
	TASK_PLAY_ANIM(players.user_ped(), "anim@mp_fireworks", "place_firework_1_rocket", 8.0, 8.0, -1, 0, 0.0, false, false, false)
	util.yield(1000)
	entities.create_object(hashofobj, playeroffset)
	--util.yield(600)
	--repeat
	--	util.yield()
	--	keypress = isanykeypressed()
	--until keypress
	while IS_ENTITY_PLAYING_ANIM(players.user_ped(), "anim@mp_fireworks", "place_firework_1_rocket", 3) do 
		util.yield()
		if isanykeypressed() then
			break
		end
	end
	CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
	ADD_EXPLOSION(fireowrkpos.x, fireowrkpos.y, fireowrkpos.z, 39, 100, true, false, 0.0, false)
end)
menu.action(misc, "animation", {}, "", function()
	request_anim_dict("anim@mp_fireworks")
	TASK_PLAY_ANIM(players.user_ped(), "anim@mp_fireworks", "place_firework_1_rocket", 8.0, 8.0, -1, 0, 0.0, false, false, false)
	util.yield(1000)
	repeat
		util.yield()
		keypress = isanykeypressed()
	until keypress
	CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
end)


--[[  {
    "DictionaryName": "anim@mp_fireworks",
    "Animations": [
      "place_firework_1_rocket",
      "place_firework_2_cylinder",
      "place_firework_box2",
      "place_firework_3_box",
      "place_firework_4_cone"
    ]
  },]]

-- settings

local Zeug_für_mich = menu.list(menu.my_root(), "Zeug für mich angepasst", {}, "muss dich nicht jucken macht zeug an was nicht so einfach mit nur einem hotkey gemacht werden kann \nwie es da steht zeug für mich selbst")

menu.toggle(Zeug_für_mich, "godmode zeug an", {}, "", function(on_toggle)
	if on_toggle then
		menu.trigger_command(menu.ref_by_path("Self>Immortality"), true)
		menu.trigger_command(menu.ref_by_path("Self>Auto Heal"), true)
		menu.trigger_command(menu.ref_by_path("Self>Gracefulness"), true)
		menu.trigger_command(menu.ref_by_path("Self>Glued To Seats"), true)
		menu.trigger_command(menu.ref_by_path("Self>Respawn Delay"), "0.50")
		menu.trigger_command(menu.ref_by_path("Self>Weapons>Skip Reloading"), true)
		menu.trigger_command(menu.ref_by_path("Self>Weapons>No Spread"), true)
		menu.trigger_command(menu.ref_by_path("Self>Weapons>No Recoil"), true)
		menu.trigger_command(menu.ref_by_path("Self>Weapons>No Spooling"), true)
		menu.trigger_command(menu.ref_by_path("Self>Movement>Graceful Landing"), true)
		menu.trigger_command(menu.ref_by_path("Self>Appearance>No Blood"), true)
		menu.trigger_command(menu.ref_by_path("Self>Appearance>Lock Wetness"), true)
		util.toast("Immortality = ON\nAuto Heal = ON\nGracefulness = ON\nGlued To Seats = ON\nSkip Reloading = ON\nNo Spread = ON\nNo Recoil = ON\nNo Spooling = ON\nGraceful Landing = ON\nNo Blood = ON\nLock Wetness = ON", TOAST_CONSOLE)
	else
		menu.trigger_command(menu.ref_by_path("Self>Immortality"), false)
		menu.trigger_command(menu.ref_by_path("Self>Auto Heal"), false)
		menu.trigger_command(menu.ref_by_path("Self>Gracefulness"), false)
		menu.trigger_command(menu.ref_by_path("Self>Glued To Seats"), false)
		menu.trigger_command(menu.ref_by_path("Self>Respawn Delay"), "0")
		menu.trigger_command(menu.ref_by_path("Self>Weapons>Skip Reloading"), false)
		menu.trigger_command(menu.ref_by_path("Self>Weapons>No Spread"), false)
		menu.trigger_command(menu.ref_by_path("Self>Weapons>No Recoil"), false)
		menu.trigger_command(menu.ref_by_path("Self>Weapons>No Spooling"), false)
		menu.trigger_command(menu.ref_by_path("Self>Movement>Graceful Landing"), false)
		menu.trigger_command(menu.ref_by_path("Self>Appearance>No Blood"), false)
		menu.trigger_command(menu.ref_by_path("Self>Appearance>Lock Wetness"), false)
		util.toast("Immortality = OFF\nAuto Heal = OFF\nGracefulness = OFF\nGlued To Seats = OFF\nSkip Reloading = OFF\nNo Spread = OFF\nNo Recoil = OFF\nNo Spooling = OFF\nGraceful Landing = OFF\nNo Blood = OFF\nLock Wetness = OFF", TOAST_CONSOLE)
	end
end)

menu.toggle(Zeug_für_mich, "schnell laufen", {}, "", function(on_toggle)
	if on_toggle then
		godmodean = menu.get_value(menu.ref_by_path("Self>Immortality"))
		anmutan = menu.get_value(menu.ref_by_path("Self>Gracefulness"))
		menu.trigger_command(menu.ref_by_path("Self>Immortality"), true)
		menu.trigger_command(menu.ref_by_path("Self>Gracefulness"), true)
		menu.trigger_command(menu.ref_by_path("Self>Movement>Super Run"), "2")
	else
		menu.trigger_command(menu.ref_by_path("Self>Movement>Super Run"), "0")
		menu.trigger_command(menu.ref_by_path("Self>Movement>Freeze"), true)
		menu.trigger_command(menu.ref_by_path("Self>Movement>Freeze"), false)
		menu.trigger_command(menu.ref_by_path("Self>Immortality"), godmodean)
		menu.trigger_command(menu.ref_by_path("Self>Gracefulness"), anmutan)
	end
end)

menu.toggle_loop(Zeug_für_mich, "Ist Unsichtbarkeit an", {}, "", function()
	if menu.get_value(menu.ref_by_path("Self>Appearance>Invisibility")) == 1 then
		util.draw_debug_text("Unsichtbarkeit ist an")
	end
end)

menu.toggle(Zeug_für_mich, "Unsichitbarkeit an/aus", {}, "", function(on_toggle)
	if on_toggle then
		menu.set_value(menu.ref_by_path("Self>Appearance>Invisibility"), 1)
	else
		menu.set_value(menu.ref_by_path("Self>Appearance>Invisibility"), 0)
	end
end)

menu.toggle_loop(vehicle, "Schnell fahren V2 (besser)", {}, "", function()
	keyCode = getKeyCode('VK_W')
	keyCode1 = getKeyCode('VK_S')
	vehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
	currentSpeed = GET_ENTITY_SPEED(vehicle)
	umrechnung = a / 10
	if util.is_key_down(keyCode) and IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
		APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, umrechnung, 0.0, true, true, true, true)
	elseif util.is_key_down(keyCode1) and IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
		APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, -umrechnung, 0.0, true, true, true, true)
	end
end)

menu.slider(vehicle, "Schnell fahren boost einstellen V2", {"selfspeedboost"}, "[0 - 50]\ngib die kmh an auf die es boosten soll", 1,50, 1, 1, function(boost)
	a = boost
end)

menu.toggle_loop(vehicle, "Stick to ground kake", {}, "", function()
	vehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
	pPos = players.get_position(players.user())
	getground = get_ground_z(pPos)
	if getground ~= number then
		if pPos.z >= (getground + 1) then
			APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, 0.0, -20, true, true, true, true)
		end
	end
end)

menu.click_slider(vehicle, "speed boost", {"selfboostsset"}, "[50 - 10000]\ngib die kmh an auf die es boosten soll", 50 ,10000, 0, 50, function(s)
	speed = s
	speedset = s / 3.6
	vehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
	if IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
		MODIFY_VEHICLE_TOP_SPEED(vehicle, 100000)
		SET_VEHICLE_FORWARD_SPEED(vehicle, speedset)
	end
end)

menu.action(vehicle, "sofort anhalten", {}, "", function()
	vehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
	if IS_PED_IN_ANY_VEHICLE(players.user_ped(),true) then
		FREEZE_ENTITY_POSITION(vehicle, true)
		FREEZE_ENTITY_POSITION(vehicle, false)
	else
		menu.trigger_command(menu.ref_by_path("Self>Movement>Freeze"), true)
		menu.trigger_command(menu.ref_by_path("Self>Movement>Freeze"), false)
	end
end)

menu.action(vehicle,"Auto Reparieren", {}, "", function()
		vehicle = entities.get_user_vehicle_as_handle(players.user(), true)
		currentSpeed = GET_ENTITY_SPEED(vehicle)
		seatplayer = GET_PED_IN_VEHICLE_SEAT(vehicle, -1, true)
		pid = GET_NEAREST_PLAYER_TO_ENTITY(seatplayer)
		playername = players.get_name(pid)
		if seatplayer == players.user_ped() or seatplayer == 0 then
			SET_VEHICLE_FIXED(vehicle)
			SET_VEHICLE_DIRT_LEVEL(vehicle, 0)
			--SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
			if currentSpeed >= 80 then
				SET_VEHICLE_FORWARD_SPEED(vehicle, currentSpeed)
			end
		else
			menu.trigger_commands("repairveh".. playername)
		end
end)

timer2 = 0
menu.toggle_loop(vehicle, "instant veh enter/exit", {}, "halte F gedrückt dann setzt du dich in das auto was dir am nächsten ist in den settings kann man auswählen wie lange man drücken soll", function()
if not util.is_session_transition_active() then
	local keyCode = getKeyCode("VK_F")
	playernameself = players.get_name(players.user())
	myposition = players.get_position(players.user())
	mypositionvehicle = getClosestVehicle(myposition)
	if not mypositionvehicle then
		goto stop
	else
		vehhash = entities.get_model_hash(mypositionvehicle)
		vehiclename = getmodelnamebyhash(vehhash)
	end
	ped = GET_PED_IN_VEHICLE_SEAT(mypositionvehicle, -1, true)
	missionped = IS_ENTITY_A_MISSION_ENTITY(ped)
	speedofvehicle = GET_ENTITY_SPEED(mypositionvehicle)
	flyingvehicle = IS_PED_IN_FLYING_VEHICLE(players.user_ped())
	--doorindex = GET_ENTITY_BONE_INDEX_BY_NAME(mypositionvehicle, "handle_dside_f")
	--doorindex2 = GET_ENTITY_BONE_INDEX_BY_NAME(mypositionvehicle, "handle_dside_r")
	--doorindex3 = GET_ENTITY_BONE_INDEX_BY_NAME(mypositionvehicle, "handle_pside_f")
	--doorindex4 = GET_ENTITY_BONE_INDEX_BY_NAME(mypositionvehicle, "handle_pside_r")
	positionoffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(mypositionvehicle, -2, 0, 0)
	--doorpositionleftfront = GET_ENTITY_BONE_POSTION(mypositionvehicle, doorindex)
	--doorpositionleftback = GET_ENTITY_BONE_POSTION(mypositionvehicle, doorindex2)
	--doorpositionrightfront = GET_ENTITY_BONE_POSTION(mypositionvehicle, doorindex3)
	--doorpositionrightback = GET_ENTITY_BONE_POSTION(mypositionvehicle, doorindex4)
	local seatofplayer = getseatofplayer(mypositionvehicle)
	local personalveh = entities.get_user_personal_vehicle_as_handle(players.user())
	timer1 = 0
	if not IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then --and not (GET_IS_TASK_ACTIVE(ped, 160)) then
		if infoofveh then
			util.draw_debug_text(vehiclename)
			util.draw_debug_text(getvehtype(vehhash))
			if personalveh == mypositionvehicle then
				util.draw_debug_text("PERSONALVEHICLE")
			end
		end
	while util.is_key_down(keyCode) do
		if infoofveh then
			util.draw_debug_text(vehiclename)
			util.draw_debug_text(getvehtype(vehhash))
			if personalveh == mypositionvehicle then
				util.draw_debug_text("PERSONALVEHICLE")
			end
		end
		timer1 += 1
		if timer1 == abb and util.is_key_down(keyCode) then
			util.toast("enter vehicle")
			menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), true)
			menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), true)
			timer1 = 0
		if IS_PED_A_PLAYER(ped) and not (ped == players.user_ped()) then
			pid = GET_NEAREST_PLAYER_TO_ENTITY(ped)
			local getplayername = players.get_name(pid)
			if not ifplayerincar then
				if ARE_ANY_VEHICLE_SEATS_FREE(mypositionvehicle) then
					if IS_VEHICLE_SEAT_FREE(mypositionvehicle, 0) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 0)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 1) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 1)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 2) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 2)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 3) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 3)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 4) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 4)
						levideaktivate()
					else
						util.toast("konnte dich in keinen sitz setzen")
						repeat
							util.yield()
						until not util.is_key_down(keyCode)
						menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
						menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
						break
					end
					repeat
						util.yield()
					until not util.is_key_down(keyCode)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
					break
				else
					util.toast("es sind keine sitze frei")
					repeat
						util.yield()
					until not util.is_key_down(keyCode)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
					break
				end
			else
				menu.trigger_commands("vehkick ".. getplayername)
					if not IS_VEHICLE_SEAT_FREE(mypositionvehicle, -1) then
						repeat
							util.yield()
							timer2 +=1
								if timer2 == 100 then
									util.toast("er konnte nicht aus dem auto gekickt werden")
									timer2 = 0
									menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
									menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
									break
								end
						until IS_VEHICLE_SEAT_FREE(mypositionvehicle, -1)
							SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, -1)
							levideaktivate()
							repeat
								util.yield()
							until not util.is_key_down(keyCode)
							menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
							menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
							break
						end
					end
		else
			if not ifnpcincar then
				if not (ped == 0) and not (players.user_ped() == ped) then
					if missionnpc then
						if missionped then
							SET_ENTITY_COORDS_NO_OFFSET(ped, doorpositionleftfront, false, false, false)
							pedpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, -3, 0, 0)
							SET_ENTITY_COORDS_NO_OFFSET(ped, pedpos.x, pedpos.y, pedpos.z, false, false, false)
						else
		   					entities.delete_by_handle(ped)
						end
					end
					SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, -1)
					levideaktivate()
				else
					SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, -1)
					levideaktivate()
					SET_VEHICLE_ENGINE_ON(mypositionvehicle, true, true, true)
				end
				repeat
					util.yield()
				until not util.is_key_down(keyCode)
				menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
				menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
				break
			else
				if ARE_ANY_VEHICLE_SEATS_FREE(mypositionvehicle) then
					if IS_VEHICLE_SEAT_FREE(mypositionvehicle, -1) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, -1)
						levideaktivate()
					elseif IS_VEHICLE_SEAT_FREE(mypositionvehicle, 0) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 0)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 1) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 1)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 2) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 2)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 3) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 3)
						levideaktivate()
					elseif  IS_VEHICLE_SEAT_FREE(mypositionvehicle, 4) then
						SET_PED_INTO_VEHICLE(players.user_ped(), mypositionvehicle, 4)
						levideaktivate()
					else
						util.toast("konnte dich in keinen sitz setzen")
						repeat
							util.yield()
						until not util.is_key_down(keyCode)
						menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
						menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
						break
					end
					repeat
						util.yield()
					until not util.is_key_down(keyCode)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
					break
				else
					util.toast("es sind keine sitze frei")
					repeat
						util.yield()
					until not util.is_key_down(keyCode)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
					menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
					break
				end
			end
		end
		end
		util.yield()
	end
	else
		timer1 = 0
		while util.is_key_down(keyCode) do
			timer1 += 1
			util.yield()
			if timer1 == bba and util.is_key_down(keyCode) then
				menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), true)
				menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), true)
				util.toast("exit vehicle")
				--util.toast(doorindex .."        /     "..doorindex2.. "  /   "..doorindex3.."  /   "..doorindex4.."   /  "..seatofplayer)
				if not engineoff then
					SET_VEHICLE_ENGINE_ON(mypositionvehicle, false, true, true)
				end
				if stoponexit and not flyingvehicle then
					BRING_VEHICLE_TO_HALT(mypositionvehicle, 0, 1, false)
				end
				local seatofplayers = getseatofplayer(mypositionvehicle)
				local entryposition
				if seatofplayers != -2 then
					entryposition = GET_ENTRY_POINT_POSITION(mypositionvehicle, seatofplayers + 1)
				end
				--util.toast(entryposition.x.. "  "..entryposition.y.. "  "..entryposition.z.. "  ".. seatofplayers)
				if not checkexitpoint then
					if entryposition.x != 0.0 and entryposition.y != 0.0 and entryposition.z != 0.0 then
						if groundspawn then
							entryposition.z = get_ground_z(entryposition) + 1
						end
						SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entryposition.x, entryposition.y, entryposition.z, false, false, false)
					else
						util.toast("Solltest du diese benachichtigung bekommen ist was falsch gelaufen beim suchen der sitz position bitte sag mir bescheid wenn du das hier bekommst und welches fahrzeug benutzt wurde dabei")
					end
				else
					if IS_ENTRY_POINT_FOR_SEAT_CLEAR(players.user_ped(), mypositionvehicle, seatofplayers, false, false) or IS_ENTRY_POINT_FOR_SEAT_CLEAR(players.user_ped(), mypositionvehicle, seatofplayers, true, false) then
						if entryposition.x != 0.0 and entryposition.y != 0.0 and entryposition.z != 0.0 then
							if groundspawn then
								entryposition.z = get_ground_z(entryposition) + 1
							end
							SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entryposition.x, entryposition.y, entryposition.z, false, false, false)
						else
							util.toast("Solltest du diese benachichtigung bekommen ist was falsch gelaufen beim suchen der sitz position bitte sag mir bescheid wenn du das hier bekommst und welches fahrzeug benutzt wurde dabei")
						end
					else
						local maxPassengers = GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(mypositionvehicle)
						local freeseat = false
						for i=-1, maxPassengers do
							if IS_ENTRY_POINT_FOR_SEAT_CLEAR(players.user_ped(), mypositionvehicle, i, false, false) then
								freeseat = i
								break
							end
						end
							if freeseat != false then
								local entryposition = GET_ENTRY_POINT_POSITION(mypositionvehicle, freeseat + 1)
								if entryposition.x != 0.0 and entryposition.y != 0.0 and entryposition.z != 0.0 then
									if groundspawn then
										entryposition.z = get_ground_z(entryposition) + 1
									end
									SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), entryposition.x, entryposition.y, entryposition.z, false, false, false)
								else
									util.toast("Solltest du diese benachichtigung bekommen ist was falsch gelaufen beim suchen der sitz position bitte sag mir bescheid wenn du das hier bekommst und welches fahrzeug benutzt wurde dabei")
								end
							else
								local playersposition = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, +3, 0)
								if groundspawn then
									playersposition.z = get_ground_z(playersposition) + 1
								end
								SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), playersposition.x, playersposition.y, playersposition.z, false, false, false)
							end
					end
				end
				repeat
					util.yield()
				until not util.is_key_down(keyCode)
				menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>VEH_EXIT"), false)
				menu.trigger_command(menu.ref_by_path("Game>Disables>Disable Game Inputs>ENTER"), false)
				break
				--TASK_LEAVE_VEHICLE(players.user_ped(), mypositionvehicle, 16)
			end
		end
	end
	::stop::
end
end)

--[[menu.slider(Zeug_für_mich, "Schnell fahren boost einstellen", {"selfspeedboost"}, "[0 - 20]\ngib die kmh an auf die es boosten soll", 0 ,20, 0, 1, function(a)
	boost = a
end)]]

menu.toggle_loop(vehicle, "radio immer aus", {}, "", function()
	if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
		SET_RADIO_TO_STATION_NAME("OFF")
	end
end)

menu.toggle_loop(Zeug_für_mich, "nach loaden auto spawnen", {}, "", function()
	if util.is_session_transition_active() then
		repeat 
			util.yield()
		until not util.is_session_transition_active()
		util.yield(3000)
		persoveh = entities.get_user_personal_vehicle_as_handle()
		if persoveh == -1 then
			menu.trigger_commands("claimallvehicles")
		end
	end
end)

menu.toggle_loop(Zeug_für_mich, "alle waffen immer", {}, "", function()
	if not util.is_session_transition_active() then
		util.yield(5000)
		if not HAS_PED_GOT_WEAPON(players.user_ped(),911657153,false) then
			util.toast("alle waffen wurden gegeben")
			menu.trigger_commands("allguns")
		end
	end
end)

timer5 = 1
menu.toggle_loop(Zeug_für_mich, "legit wanted level remove", {}, "", function()
	if IS_PLAYER_WANTED_LEVEL_GREATER(players.user(), 0) then
		repeat
			util.yield()
			if not IS_PLAYER_WANTED_LEVEL_GREATER(players.user(), 0) then
				timer5 = 1
				break
			end
			timer5 += 1
		until timer5 == 300
			timer5 = 1
			players.set_wanted_level(players.user(), 0)
			util.toast("Die Fahndungslevel wurden entfernt")
	end
end)

--[[menu.toggle_loop(vehicle, "immer persönliches auto da", {}, "", function()
	local persoveh = entities.get_user_personal_vehicle_as_handle()
	local interioding = GET_INTERIOR_FROM_ENTITY(players.user_ped())
	if persoveh == -1 and interioding == 0 and not IS_CUTSCENE_ACTIVE() then
		util.yield(10000)
		local persoveh = entities.get_user_personal_vehicle_as_handle()
		if persoveh == -1 and interioding == 0 and not IS_CUTSCENE_ACTIVE() then
			menu.trigger_command(menu.ref_by_path("Stand>Lua Scripts>".. SCRIPT_NAME ..">Self zeug>Claim all vehicles"))
			util.toast("fahrzeug wird geliefert")
			util.yield(5000)
		end
	end
end)

--[[(JSkey.is_key_just_down('VK_R') or JSkey.is_control_just_pressed(0, 'INPUT_COVER'))

]]
local settings = menu.list(menu.my_root(), "Settings", {}, "", function(); end)
	
menu.action(settings, "update suchen", {}, "", function()
	util.restart_script()
end)

local entitymanagersettings = menu.list(settings, "Entity manager settings", {}, "", function(); end)
local enterexitsettings = menu.list(settings, "Fast enter/exit settings", {}, "", function(); end)
local miscs = menu.list(settings, "Misc", {}, "", function(); end)

menu.toggle(miscs, "host kick freunde", {}, "AN = kickt auch freunde\nAUS = kickt keine freunde", function(on_toggle)
	if on_toggle then
		hostkickfriends = true
	else
		hostkickfriends = false
	end
end)

menu.action(miscs, "alle sachen bei spielern ausssachlten", {}, "wenn du bei dem org ding was angemacht hast und es bei allen spieler wieder aus machen willst drück einfach hier", function()
	for players.list(false, true, true) as pid do
		playername = players.get_name(pid)
		menu.trigger_commands("givevehgod".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("ceopay".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("figurines".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("cards".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("autoheal".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("bail".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("giveotr".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("snack".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("disarm".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("freeze".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("confuse".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("ragdoll".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("shakecam".. playername.. " off")
		util.yield(20)
		menu.trigger_commands("notifyspam".. playername.. " off")
		util.yield(20)
	end
	util.toast("es wurde alles aus gemacht")
end)

sliderforaktimer = menu.slider(miscs, "anti afk kill timer", {"enterafktimer"}, "sekunden", 10, 300, timerforafk, 10, function(value)
	timerforafk = value
end)

menu.divider(enterexitsettings, "ON Enter")
menu.toggle(enterexitsettings, "npc auto klauen oder beifahrer", {}, "AN = beifahrer\nAUS = klauen", function(on_toggle)
	if on_toggle then
		ifnpcincar = true
	else
		ifnpcincar = false
	end
end)

menu.toggle(enterexitsettings, "spieler auto klauen oder beifahrer", {}, "AUS = beifahrer\nAN = klauen", function(on_toggle)
	if on_toggle then
		ifplayerincar = true
	else
		ifplayerincar = false
	end
end)

menu.toggle(enterexitsettings, "Missions npc nicht löschen", {}, "AUS = mission npc wird gelöscht\nAN = mission npc wird nicht gelöscht", function(on_toggle)
	if on_toggle then
		missionnpc = true
	else
		missionnpc = false
	end
end)

menu.divider(enterexitsettings, "ON Exit")

menu.toggle(enterexitsettings, "Motor bei austeigen an lassen", {}, "AUS = beim austeigen geht der motor normal aus\nAN = beim verlassen bleibt der motor an", function(on_toggle)
	if on_toggle then
		engineoff = true
	else
		engineoff = false
	end
end)

menu.toggle(enterexitsettings, "Stop on exit", {}, "AUS = auto fährt weiter\nAN = auto bleibt stehen nach dem austeigen\nFliege fahrzeug sind davon ausgeschlosen weil sie dich sonst meistens killen", function(on_toggle)
	if on_toggle then
		stoponexit = true
	else
		stoponexit = false
	end
end)

menu.toggle(enterexitsettings, "immer am boden aussteigen", {}, "AUS = spawned dich neben der tür\nAN = spawned dich auf den boden", function(on_toggle)
	if on_toggle then
		groundspawn = true
	else
		groundspawn = false
	end
end)

menu.toggle(enterexitsettings, "Checke exit position", {}, "AUS = schmeißt dich einfach direkt aus dem auto raus egal ob platz ist oder nicht\nAN = checkt ob platz ist zum aussteigen wenn nicht sucht es eine besser position für dich", function(on_toggle)
	if on_toggle then
		checkexitpoint = true
	else
		checkexitpoint = false
	end
end)

menu.divider(enterexitsettings, "Misc")

menu.toggle(enterexitsettings, "Veh info as debug", {}, "AUS = keine infos\nAN = rechts oben infos über das veh", function(on_toggle)
	if on_toggle then
		infoofveh = true
	else
		infoofveh = false
	end
end)

menu.slider(enterexitsettings, "auto einsteigen settings", {"entertimer"}, "[5 - 100]\nwie lang es warten soll bis du einsteigst", 5,100, 10, 5, function(boost1)
	abb = boost1
end)

menu.slider(enterexitsettings, "auto aussteigen settings", {"exittimer"}, "[5 - 100]\nwie lang es warten soll bis du aussteigst", 5,100, 10, 5, function(boost2)
	bba = boost2
end)

menu.toggle(entitymanagersettings, "Fahrzeug mit Ped löschen", {}, "wenn es an ist wird das fahrzeug mit dem ped gelöscht\nwenn beides aus dann löscht es zu erst das ped dann muss man nochmal drücken um das auto zu löschen", function(on_toggle)
	if on_toggle then
		controlepedcar = true
	else
		controlepedcar = false
	end
end)

menu.toggle(entitymanagersettings, "nur auto löschen ped bleibt da", {}, "wenn es an ist wird das fahrzeug gelöscht aber das ped bleibt dann ohne auto da\nwenn beides aus dann löscht es zu erst das ped dann muss man nochmal drücken um das auto zu löschen", function(on_toggle)
	if on_toggle then
		deletevehicle = true
	else
		deletevehicle = false
	end
end)

menu.divider(entitymanagersettings, "------------")

menu.toggle(entitymanagersettings, "Information von PED oder VEHICLE", {}, "welche informationen sollen angezeigt werden von dem ped das im auto sitzt oder dem fahrezug\nwenn aus dann wird es vom fahrezug angezeigt", function(on_toggle)
	if on_toggle then
		informationpedveh = true
	else
		informationpedveh = false
	end
end)

menu.divider(entitymanagersettings, "------------")

menu.toggle(entitymanagersettings, "platz klauen oder dazu setzen SPIELER", {}, "wenn an klaust du dem spieler sein fahrzeug beim F = ENTER", function(on_toggle)
	if on_toggle then
		vehentersteal = true
	else
		vehentersteal = false
	end
end)

menu.toggle(entitymanagersettings, "platz klauen oder dazu setzen NPC", {}, "wenn an wirst du dich irgendwo im fahrezug hin setzen F = ENTER", function(on_toggle)
	if on_toggle then
		vehenterstealnpc = true
	else
		vehenterstealnpc = false
	end
end)

loadthings = menu.action(settings, "loaded sachen ", {"loadstuff"}, "", function()
	if not menu.is_ref_valid(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME ..">Player zeug>Anti vehicle action>vehicles>Boats")) then
		vehicle_spawn_list(antiactionvehicles)
	end
end)

menu.trigger_commands("loadstuff")

util.keep_running()
