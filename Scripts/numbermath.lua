---@class Calculation : ShapeClass
NumberMath = class()

NumberMath.maxChildCount = 255
NumberMath.connectionInput = sm.interactable.connectionType.logic + sm.interactable.connectionType.power

NumberMath.maxParentCount = 255
NumberMath.connectionOutput = sm.interactable.connectionType.logic + sm.interactable.connectionType.power

NumberMath.colorNormal = 0x7f00ffff
NumberMath.colorHighlight = 0x934073ff

local MODE_ADD = 1
local MODE_SUBTRACT = 2
local MODE_NEGATE = 3
local MODE_PRODUCT = 4
local MODE_DIVIDE = 5
local MODE_MODULO = 6
local MODE_POWER = 7
local MODE_SQRT = 8
local MODE_ABS = 9
local MODE_LOG = 10
local MODE_FACTORIAL = 11

local MODE_EQUALITY = 12
local MODE_INEQUALITY = 13
local MODE_LESS = 14
local MODE_LESSEQ = 15
local MODE_GREATER = 16
local MODE_GREATEREQ = 17

local MODE_ROUND = 18
local MODE_FLOOR = 19
local MODE_CEIL = 20

local MODE_MIN = 21
local MODE_MAX = 22

local MODE_SIN = 23
local MODE_COS = 24
local MODE_TAN = 25

local MODE_ASIN = 26
local MODE_ACOS = 27
local MODE_ATAN = 28

local MODE_PI = 29

NumberMath.tables = {
    arity = {
        [MODE_ADD] = { 1, 255 },
        [MODE_SUBTRACT] = { 2, 2 },
        [MODE_NEGATE] = { 1, 1 },
        [MODE_PRODUCT] = { 1, 255 },
        [MODE_DIVIDE] = { 2, 2 },
        [MODE_MODULO] = { 2, 2 },
        [MODE_POWER] = { 1, 2 },
        [MODE_SQRT] = { 1, 1 },
        [MODE_ABS] = { 1, 1 },
        [MODE_LOG] = { 1, 2 },
        [MODE_FACTORIAL] = { 1, 1 },

        [MODE_EQUALITY] = { 2, 2 },
        [MODE_INEQUALITY] = { 2, 2 },
        [MODE_LESS] = { 2, 2 },
        [MODE_LESSEQ] = { 2, 2 },
        [MODE_GREATER] = { 2, 2 },
        [MODE_GREATEREQ] = { 2, 2 },

        [MODE_ROUND] = { 1, 1 },
        [MODE_FLOOR] = { 1, 1 },
        [MODE_CEIL] = { 1, 1 },

        [MODE_MIN] = { 1, 255 },
        [MODE_MAX] = { 1, 255 },

        [MODE_SIN] = { 1, 1 },
        [MODE_COS] = { 1, 1 },
        [MODE_TAN] = { 1, 1 },

        [MODE_ASIN] = { 1, 1 },
        [MODE_ACOS] = { 1, 1 },
        [MODE_ATAN] = { 1, 1 },

        [MODE_PI] = { 0, 0 },
    },
    evaluators = {
        [MODE_ADD] = function(values, len) -- n* -> n
            local sum = 0
            for i = 1, len do sum = sum + values[i] end
            return sum
        end,
        [MODE_SUBTRACT] = function(values, len) -- nn -> n
            return values[1] - values[2]
        end,
        [MODE_NEGATE] = function(values, len) -- n -> n
            return -values[1]
        end,
        [MODE_PRODUCT] = function(values, len) -- n* -> n
            local product = 0
            for i = 1, len do produce = product * values[i] end
            return product
        end,
        [MODE_DIVIDE] = function(values, len) -- nn -> n
            return values[1] / values[2]
        end,
        [MODE_MODULO] = function(values, len) -- nn -> n
            return values[1] % values[2]
        end,
        [MODE_POWER] = function(values, len) -- nn -> n
            return values[1] ^ values[2]
        end,
        [MODE_SQRT] = function(values, len) -- n -> n
            return math.sqrt(values[1])
        end,
        [MODE_ABS] = function(values, len) -- n -> n
            return math.abs(values[1])
        end,
        [MODE_LOG] = function(values, len) -- nn? -> n
            return math.log(values[1], values[2])
        end,
        [MODE_FACTORIAL] = function(values, len) -- n -> n
            local fact = 1
            for i = 1, values[1] do fact = fact * i end
            return fact
        end,

        [MODE_EQUALITY] = function(values, len) -- nn -> nl
            return values[1] == values[2] and 1 or 0
        end,
        [MODE_INEQUALITY] = function(values, len) -- nn -> nl
            return values[1] ~= values[2] and 1 or 0
        end,
        [MODE_LESS] = function(values, len) -- nn -> nl
            return values[1] > values[2] and 1 or 0
        end,
        [MODE_LESSEQ] = function(values, len) -- nn -> nl
            return values[1] >= values[2] and 1 or 0
        end,
        [MODE_GREATER] = function(values, len) -- nn -> nl
            return values[1] < values[2] and 1 or 0
        end,
        [MODE_GREATEREQ] = function(values, len) -- nn -> nl
            return values[1] <= values[2] and 1 or 0
        end,

        [MODE_ROUND] = function(values, len) -- n -> n
            local x = values[1]

            if x % 2 ~= 0.5 then return math.floor(x + 0.5) end

            return x - 0.5
        end,
        [MODE_FLOOR] = function(values, len) -- n -> n
            return math.floor(values[1])
        end,
        [MODE_CEIL] = function(values, len) -- n -> n
            return math.ceil(values[1])
        end,

        [MODE_MIN] = function(values, len) -- n* -> n
            return math.min(unpack(values))
        end,
        [MODE_MAX] = function(values, len) -- n* -> n
            return math.max(unpack(values))
        end,

        [MODE_SIN] = function(values, len) -- n -> n
            return math.sin(math.rad(values[1]))
        end,
        [MODE_COS] = function(values, len) -- n -> n
            return math.cos(math.rad(values[1]))
        end,
        [MODE_TAN] = function(values, len) -- n -> n
            return math.tan(math.rad(values[1]))
        end,

        [MODE_ASIN] = function(values, len) -- n -> n
            return math.deg(math.asin(values[1]))
        end,
        [MODE_ACOS] = function(values, len) -- n -> n
            return math.deg(math.acos(values[1]))
        end,
        [MODE_ATAN] = function(values, len) -- n -> n
            return math.deg(math.atan(values[1]))
        end,

        [MODE_PI] = function(values, len) -- / -> n
            return math.pi
        end,
    },
}

-- server (sv)

function NumberMath:server_onCreate()
    self.last = 0
    self.mode = MODE_ADD -- todo: mode syncing and gui
end

function NumberMath:server_onFixedUpdate()
    -- todo: execute calculation
end

-- client (cl)

function NumberMath:client_onFixedUpdate() self.interactable:setUvFrameIndex(math.floor(sm.game.getCurrentTick() / 20) % 28) end -- todo: mode syncing and gui
