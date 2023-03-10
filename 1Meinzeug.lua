util.require_natives("natives-1672190175-uno")
local response = false
local localVer = 0.18
local currentVer
async_http.init("raw.githubusercontent.com", "/TheaterChaos/Mein-zeug/main/Meinzeugversion", function(output)
    currentVer = tonumber(output)
    response = true
    if localVer ~= currentVer then
        util.toast("Neue version ist verfügbar lad sie dir mit Update lua runter.")
        menu.action(menu.my_root(), "Update Lua", {}, "wenn update lua immer noch angezeigt wird dann einfach 2-3 minuten warten dann noch einmal probieren", function()
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
					util.toast("ACJSTables.lua failed to download. Please try again later. If this continues to happen then manually update via github.")
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


require ('resources/Alltabels')


local resource_dir = filesystem.resources_dir()
if not filesystem.exists(resource_dir) then
	util.toast("resource directory not found. notification system will be less of a bruh")
else
	util.register_file(resource_dir .. "bruhzowski.ytd")
end

-- Functions and infos
local function get_transition_state(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 230))
end

local int_min = -2147483647
local int_max = 2147483647

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

function Streamptfx(lib)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(lib)
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(lib) do
        util.yield()
    end
    GRAPHICS.USE_PARTICLE_FX_ASSET(lib)
end

function is_user_a_stand_user(pid)
    if pid == players.user() then
        return true
    end
    if players.exists(pid) then
        for _, cmd in ipairs(menu.player_root(pid):getChildren()) do
            if cmd:getType() == COMMAND_LIST_CUSTOM_SPECIAL_MEANING and (cmd:refByRelPath("Stand User"):isValid() or cmd:refByRelPath("Stand User (Co-Loading)"):isValid() or cmd:refByRelPath("Stand Nutzer"):isValid() or cmd:refByRelPath("Stand Nutzer (Mit Co-Load)"):isValid()) then
                return true
            end
        end
    end
    return false
end

local function v3(x, y, z)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
end

local function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
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

-- player options

local function player(pid)
    menu.divider(menu.player_root(pid), "Selfmade")
	local main = menu.list(menu.player_root(pid), "Selfmade", {"PlMein"}, "")
    local bozo = menu.list(main, "Notizen", {"Notizen"}, "")
	local anderes = menu.list(main, "anderes zeug", {"anderes"}, "")
	local spam = menu.list(main, "spam zeug", {"spamzeug"}, "")

	menu.toggle(spam, "alle loops", {}, "auto spam besser selber an machen sonst kaka", function(on_toggle)
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
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
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
	end)

	menu.toggle_loop(anderes, "Remove Player Godmode", {}, "Blocked by most menus.", function()
		util.trigger_script_event(1 << pid, {-1428749433, pid, 448051697, math.random(0, 9999)})
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
end

players.on_join(player)
players.dispatch_on_join()

--local parents
local Self = menu.list(menu.my_root(), "Self zeug", {}, "")
local player_zeug = menu.list(menu.my_root(), "Player zeug", {}, "")
local streamer = menu.list(player_zeug, "Streamer zeug", {}, "")
local custselc = menu.list(menu.my_root(), "Custom Selection", {}, "", function(); end)
local frendlist = menu.list(menu.my_root(), "friend list", {"fl"}, "", function(); end)
local players_list = menu.list(menu.my_root(), "Players", {}, "")

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


menu.action(Self, "Tp waypoint or mission point", {"tpwpob"}, "wenn ein waypoint gesetzt ist geht er da hin wenn keiner da ist geht er zu missions punkt", function()
	if HUD.IS_WAYPOINT_ACTIVE() then
		menu.trigger_commands("tpwp")
	else
		menu.trigger_commands("tpobjective")
	end
end)

--auto stand user marker
menu.action(player_zeug, "Mark Stand user self", {}, "Nicht möglich bei leuten die du schonmal anders gesehen hast", function()
	for _, pid in players.list(false, true, true) do
		if is_user_a_stand_user(pid) or pid == players.user() and not util.is_session_transition_active(players.user) then
			if menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			end
		end
	end
end)


menu.toggle(player_zeug, "Mark Stand user auto", {}, "Nicht möglich bei leuten die du schonmal anders gesehen hast", function()
	for _, pid in players.list(false, true, true) do
		if is_user_a_stand_user(pid) or pid == players.user() and not util.is_session_transition_active(players.user) then
			if menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
			end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note")) then
				if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note")) == "" then
					menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note"), "Stand user")
					util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
			end
		end
	end
end)

local function standuser()
	util.yield(10000)
	if menu.get_value(menu.ref_by_path("Stand>Lua Scripts>" ..SCRIPT_NAME.. ">Player zeug>Mark Stand user auto")) == true then
		for _, pid in players.list(false, true, true) do
			if is_user_a_stand_user(pid) or pid == players.user() and not util.is_session_transition_active(players.user) then
				if menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. ">Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
				end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Solo]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invite]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Friend]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Closed Crew]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Crew]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Public]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Invalid]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Story Mode]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note")) then
					if menu.get_value(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note")) == "" then
						menu.trigger_command(menu.ref_by_path("Online>Player History>" ..players.get_name(pid).. " [Offline]>Note"), "Stand user")
						util.toast(players.get_name(pid).. " Wurde als Stand user Makiert", TOAST_ALL)
					end
				end
			end
		end
	end
end

players.on_join(standuser)

--shoot gods
menu.toggle_loop(Self, 'Shoot gods', {}, 'Disables godmode for other players when aiming at them. Mostly works on trash menus.', function()
	local playerList = getNonWhitelistedPlayers(whitelistListTable, whitelistGroups, whitelistedName)
	for k, playerPid in ipairs(playerList) do
 local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerPid)
 if (PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), playerPed) or PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(players.user(), playerPed)) and players.is_godmode(playerPid) and notplayers.is_in_interior(playerped) then
	 util.trigger_script_event(1 << playerPid, {-1428749433, playerPid, 448051697, math.random(0, 9999)})
		end	   
end
end)

menu.toggle_loop(Self, "Script Host Addict", {}, "A faster version of script host kleptomaniac", function()
    if players.get_script_host() ~= players.user() and not util.is_session_transition_active(players.user) then
        menu.trigger_commands("scripthost")
    end
end)

menu.text_input(streamer, "streamer", {"plstream"}, "streamer eingeben", function(input)
	streamer = input
end, '')

menu.action(streamer, "add streamer (join)", {}, "streamer adden mit direkt join", function()
		menu.trigger_commands("historyadd " .. tostring(streamer))
		util.yield(800)
		menu.trigger_commands("historynote " .. tostring(streamer) .. " Streamer")
		util.yield(500)
		menu.trigger_commands("join " .. tostring(streamer))
end)

menu.action(streamer, "add streamer", {}, "streamer adden und öffnen in liste", function()
		menu.trigger_commands("historyadd " .. tostring(streamer))
		util.yield(800)
		menu.trigger_commands("historynote " .. tostring(streamer) .. " Streamer")
		util.yield(500)
		menu.trigger_commands("findplayer " .. tostring(streamer))
end)

-- custon selection begin
menu.toggle(custselc, "Exclude Selected", {}, "", function(on_toggle)
	if on_toggle then
		excludeselected = true
	else
		excludeselected = false
	end
end)

menu.divider(custselc, "Actions")
local actionen = menu.list(custselc, "actionen", {}, "")
local friendly = menu.list(actionen, "Friendly stuff", {}, "")
local kicken = menu.list(actionen, "Kick/crash stuff", {}, "")
local tp = menu.list(actionen, "TP", {}, "")
local trolling = menu.list(actionen, "Trolling", {}, "")
menu.action(custselc, "seite reseten", {}, "passiert das bei mission ein fehler kommt einfach die seite hier mit reseten dann easy (wichtig pid 1 und 2 müssen existieren sonst geht es nicht)", function(pids)
	for pids = 0, 31 do
		if players.exists(pids) then
		if menu.is_ref_valid(menu.ref_by_command_name("selected" ..pids)) then
			menu.delete(cmd_id[pids])
			util.yield(50)
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

menu.action(friendly, "automatisches healen ON", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("autoheal " .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("autoheal " .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "automatisches healen OFF", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("autoheal " .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("autoheal " .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Nie Gefahndet ON", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("bail " .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("bail " .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Nie Gefahndet OFF", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("bail " .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("bail " .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Vom Rader Verschwinde ON", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("giveotr " .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("giveotr " .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
				util.yield()
			end
		end
	end
end)

menu.action(friendly, "Vom Rader Verschwinde OFF", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
						  menu.trigger_commands("giveotr " .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("giveotr " .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
				util.yield()
			end
		end
	end
end)


menu.action(kicken, "modder kicken", {}, "kicked alle die eine modder flag haben", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) and players.is_marked_as_modder(pids) then
						  menu.trigger_commands("kick " .. PLAYER.GET_PLAYER_NAME(pids))
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) and players.is_marked_as_modder(pids) then
						   menu.trigger_commands("kick " .. PLAYER.GET_PLAYER_NAME(pids))
				util.yield()
			end
		end
	end
end)


menu.action(kicken, "Kick", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
							menu.trigger_commands("kick " .. PLAYER.GET_PLAYER_NAME(pids))
				util.yield()
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
						   menu.trigger_commands("kick " .. PLAYER.GET_PLAYER_NAME(pids))
				util.yield()
			end
		end
	end
end)


menu.action(kicken, "Crash", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				util.toast("SE Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
				util.toast("SE Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		end
	end
end)


menu.action(tp, "Teleportiren", {}, "Teleportiert die in die nähe von dir in ein apartment", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("aptme" .. PLAYER.GET_PLAYER_NAME(pids))
				util.toast("TP " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
				util.yield(2000)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("aptme" .. PLAYER.GET_PLAYER_NAME(pids))
				util.toast("TP " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
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
		local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
						menu.trigger_commands("demigodmode " .. "on")
						menu.trigger_commands("summon " .. PLAYER.GET_PLAYER_NAME(pids))
						util.toast("auto TP " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
						util.yield(2000)
						menu.trigger_commands("demigodmode " .. "off")
					else
						menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
						util.yield(3000)
						if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
							menu.trigger_commands("demigodmode " .. "on")
							menu.trigger_commands("summon " .. PLAYER.GET_PLAYER_NAME(pids))
							menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
							util.toast("auto TP " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
							util.yield(2000)
							menu.trigger_commands("demigodmode " .. "off")
						else
							menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
							util.toast("ist nicht im auto " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
							util.yield(2000)
						end
					end
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
						menu.trigger_commands("demigodmode " .. "on")
						menu.trigger_commands("summon " .. PLAYER.GET_PLAYER_NAME(pids))
						util.toast("auto TP " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
						util.yield(2000)
						menu.trigger_commands("demigodmode " .. "off")
					else
						menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pids) .. " on")
						util.yield(3000)
						if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
							menu.trigger_commands("demigodmode " .. "on")
							menu.trigger_commands("summon " .. PLAYER.GET_PLAYER_NAME(pids))
							menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
							util.toast("auto TP " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
							util.yield(2000)
							menu.trigger_commands("demigodmode " .. "off")
						else
							menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pids) .. " off")
							util.toast("ist nicht im auto " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
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
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
				util.toast("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
				menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
				util.toast("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		end
	end
end)


menu.action(trolling, "Freeze on", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "on")
				menu.trigger_commands("hardfreeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "on")
				util.toast("Freeze ist jetzt an " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "on")
				menu.trigger_commands("hardfreeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "on")
				util.toast("Freeze ist jetzt an " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		end
	end
end)


menu.action(trolling, "Freeze off", {}, "", function()
	for pids = 0, 31 do
		if excludeselected then
			if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "off")
				menu.trigger_commands("hardfreeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "off")
				util.toast("Freeze ist jetzt aus für " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		else
			if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
				menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "off")
				menu.trigger_commands("hardfreeze" .. PLAYER.GET_PLAYER_NAME(pids) .. " " .. "off")
				util.toast("Freeze ist jetzt aus für " .. PLAYER.GET_PLAYER_NAME(pids), TOAST_ALL)
			end
		end
	end
end)

menu.divider(friendly, "Selected Players")
menu.divider(kicken, "Selected Players")
menu.divider(tp, "Selected Players")
menu.divider(trolling, "Selected Players")
menu.divider(actionen, "Remove player from list")
menu.divider(custselc, "Players")


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

local function update_leave(pid)
	if menu.get_value(menu.ref_by_command_name("selected" ..pid)) == true then
		menu.trigger_commands("selected" .. pid .. " " .. "off")
		util.toast("test", TOAST_ALL)
		util.yield(200)
		menu.delete(cmd_id[pid])
	else
		menu.delete(cmd_id[pid])
	end
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
players.on_leave(update_leave)
players.on_join(update_join)

-- namen kick und crash
Permakick = menu.list(player_zeug, "Perma kick", {}, "", function(); end)

	menu.text_input(Permakick, "player", {"Kickname"}, "", function(input)
		name = input
	end, '')

	timetokick = 10000
	menu.slider(Permakick, "Zeit bis kick", {}, "10000 = 10 sekunden, 600000 = 10 mintuten, 120000 = 2 Minuten", 10000, 600000, 10000, 10000, function(s)
    	    timetokick = s
  	 end)

	menu.action(Permakick, "Spieler suchen", {}, "", function()
		menu.trigger_commands("findplayer " .. tostring(name))
	end)

	menu.toggle(Permakick, "auto check if offline", {}, "das wird dein menu öffnen und nach dem spieler suchen ob er online ist (sehr nervig) manchmal weiß aber nicht einmal stand ob er online ist", function()
	end)

	menu.toggle_loop(Permakick, "kicken", {"permakicktoggle"}, "es gibt ein kleinen ruckler wenn er den kick macht", function()
	if menu.get_value(menu.ref_by_path("Stand>Lua Scripts>" ..SCRIPT_NAME.. ">Player zeug>Perma kick>auto check if offline")) == true then
		menu.trigger_commands("findplayer " .. tostring(name))
		util.yield(6000)
		if menu.is_ref_valid(menu.ref_by_path("Players>" ..name.. ">Kick>Smart")) then
			menu.trigger_command(menu.ref_by_path("Players>" ..name.. ">Kick>Smart"))
			util.toast(name.. " Wurde aus deiner lobby gekickt", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= keine", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Solo", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Invite", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Closed Friend", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Closed Crew", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Crew", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Public", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= invalid", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Story Mode", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Offline", TOAST_ALL)
		end
		util.yield(tostring(timetokick))
	else
		if menu.is_ref_valid(menu.ref_by_path("Players>" ..name.. ">Kick>Smart")) then
			menu.trigger_command(menu.ref_by_path("Players>" ..name.. ">Kick>Smart"))
			util.toast(name.. " Wurde aus deiner lobby gekickt", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. ">Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= keinen", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Solo]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Solo", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invite]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Invite", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Friend]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Clesed Friend", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Closed Crew]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Clesed Crew", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Crew]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Crew", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Public]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Public", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Invalid]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Invalid", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Story Mode]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Story Mode", TOAST_ALL)
		elseif menu.is_ref_valid(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup")) then
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup"))
			menu.trigger_command(menu.ref_by_path("Online>Player History>" ..name.. " [Offline]>Blind-Fire Kick>Breakup"))
			util.toast(name.. " Wurde aus seiner lobby gekickt Anzeige= Offline", TOAST_ALL)
		end
		util.yield(tostring(timetokick))
	end
	end)

-- settings
local settings = menu.list(menu.my_root(), "Settings", {}, "", function(); end)
	
	menu.action(settings, "update suchen", {}, "", function()
		util.restart_script()
	end)

util.keep_running()
