--
--local function request_control_once(entity)
--    if not NETWORK.NETWORK_IS_IN_SESSION() then
--        return true
--    end
--    local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
--    NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
--    return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
--end
--
--local function request_control(entity, timeout)
--    if not DOES_ENTITY_EXIST(entity) then
--        return false
--    end
--    local end_time = util.current_time_millis() + (timeout or 500)
--    repeat util.yield_once() until request_control_once(entity) or util.current_time_millis() >= end_time
--    return request_control_once(entity)
--end

local config = {
    boost = 300
}

return {
    name="Boost",
    help="Boost vehicle",
    applicable_to={"VEHICLE"},
    execute=function(target)
        if entities.request_control(target.handle) then
            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(target.handle, 1, 0, config.boost, 0.0, true, true, true, true)
        end
    end,
    config_menu=function(menu_root)
        menu_root:slider("Power", {"contextsetpowerofboost"}, "Set the power of boost", 0, 1000, config.boost, 10, function(value)
            config.boost = value
        end, config.boost)
    end
}