-- ============================================================================
-- FiveM Vector3 Compatibility Layer
-- FiveM's vector3 supports table.unpack() and # operator, Cherax's V3 doesn't.
-- This creates a compatible wrapper type.
-- ============================================================================

local M = {}

-- Create a metatable for FiveM-compatible vector3
local vector3_mt = {
    __index = function(self, key)
        if key == "x" then return rawget(self, 1)
        elseif key == "y" then return rawget(self, 2)
        elseif key == "z" then return rawget(self, 3)
        end
        return nil
    end,
    __newindex = function(self, key, value)
        if key == "x" then rawset(self, 1, value)
        elseif key == "y" then rawset(self, 2, value)
        elseif key == "z" then rawset(self, 3, value)
        else rawset(self, key, value)
        end
    end,
    __len = function() return 3 end,
    __tostring = function(self)
        return string.format("vector3(%f, %f, %f)", self[1], self[2], self[3])
    end,
    __add = function(a, b)
        if type(b) == "number" then
            return vector3(a[1] + b, a[2] + b, a[3] + b)
        else
            return vector3(a[1] + b[1], a[2] + b[2], a[3] + b[3])
        end
    end,
    __sub = function(a, b)
        if type(b) == "number" then
            return vector3(a[1] - b, a[2] - b, a[3] - b)
        else
            return vector3(a[1] - b[1], a[2] - b[2], a[3] - b[3])
        end
    end,
    __mul = function(a, b)
        if type(b) == "number" then
            return vector3(a[1] * b, a[2] * b, a[3] * b)
        elseif type(a) == "number" then
            return vector3(a * b[1], a * b[2], a * b[3])
        else
            return vector3(a[1] * b[1], a[2] * b[2], a[3] * b[3])
        end
    end,
    __div = function(a, b)
        if type(b) == "number" then
            return vector3(a[1] / b, a[2] / b, a[3] / b)
        else
            return vector3(a[1] / b[1], a[2] / b[2], a[3] / b[3])
        end
    end,
    __unm = function(a)
        return vector3(-a[1], -a[2], -a[3])
    end,
    __eq = function(a, b)
        return a[1] == b[1] and a[2] == b[2] and a[3] == b[3]
    end
}

-- Create a new FiveM-compatible vector3
function vector3(x, y, z)
    local v = {x or 0, y or 0, z or 0}
    setmetatable(v, vector3_mt)
    return v
end

-- Export to global
_G.vector3 = vector3

-- Helper to convert Cherax V3 to FiveM vector3
local function v3ToVector3(v3)
    if v3 == nil then return vector3(0, 0, 0) end
    return vector3(v3.x, v3.y, v3.z)
end

M.vector3 = vector3
M.v3ToVector3 = v3ToVector3

-- Export to global so native_wrappers.lua can access it
_G.vector3Lib = M

-- Override table.unpack to handle Cherax's rage::Vector3 objects
-- FiveM scripts often do: x,y,z = table.unpack(GetEntityCoords(entity))
-- Cherax returns Vector3 userdata which doesn't work with standard table.unpack
local originalUnpack = table.unpack or unpack
table.unpack = function(t, i, j)
    -- Handle nil gracefully - return 0, 0, 0 to prevent crash
    if t == nil then
        return 0, 0, 0
    end
    -- Check if it's a Cherax Vector3 (has x,y,z but isn't a regular table)
    if type(t) == "userdata" or (type(t) == "table" and t.x ~= nil and t.y ~= nil and t.z ~= nil and rawget(t, 1) == nil) then
        -- It's a Vector3-like object, extract x,y,z
        return t.x, t.y, t.z
    end
    -- Otherwise use original unpack
    return originalUnpack(t, i, j)
end

-- Also handle regular unpack if it exists
if unpack then
    unpack = table.unpack
end

return M
