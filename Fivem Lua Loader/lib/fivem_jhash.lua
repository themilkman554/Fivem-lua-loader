-- ============================================================================
-- FiveM-Specific Jhash to Function Mappings
-- Maps jhash values to global function names for FiveM-only natives
-- Add new FiveM natives here - they'll automatically work with Citizen.InvokeNative
-- ============================================================================

-- Maps jhash -> global function name (as string)
-- The function must exist as a global (defined in network_stubs.lua, native_wrappers.lua, etc.)
local JhashToFunction = {
    -- Network/Resource Functions (from network_stubs.lua)
    [0xE5E9EBBB] = "GetCurrentResourceName",      -- GET_CURRENT_RESOURCE_NAME
    [0xEA11BFBA] = "GetCurrentServerEndpoint",    -- GET_CURRENT_SERVER_ENDPOINT
    [0x4D97BCC7] = "GetPlayerServerId",           -- GET_PLAYER_SERVER_ID
    [0x76A9EE1F] = "LoadResourceFile",            -- LOAD_RESOURCE_FILE (FiveM-only)
    [0xA09E7E7B] = "SaveResourceFile",            -- SAVE_RESOURCE_FILE (FiveM-only)
    
    -- Text Entry Functions (from native_wrappers.lua)
    [0x32CA01C3] = "AddTextEntry",                -- ADD_TEXT_ENTRY
    
    -- Camera Functions (FiveM-only)
    [0x8F57A89D] = "GetCamMatrix",                -- GET_CAM_MATRIX
    [0x2B9D4F50] = "GetGamePool",                 -- GET_GAME_POOL
}

return JhashToFunction
