local acutil = require('acutil')
local next = 0

local function timerName()
    local name = 'timer' .. next
    next = next + 1

    return name
end

-- runs in `ms' milliseconds...more or less
local function setTimeout(f, ms)
    local name = timerName()
    local handlerName = 'setTimeout_' .. name
    local timer = ui.GetFrame('bandicam'):CreateOrGetControl('timer', name, 0, 0, 0, 0)
    local count = 0

    timer = tolua.cast(timer, 'ui::CAddOnTimer')
    timer:SetUpdateScript(handlerName)
    
    _G[handlerName] = function()
        count = count + 16.67
        
        if (count >= ms) then
            _G[handlerName] = nil
            timer:Stop()
            f()
        end
    end

    timer:Start(1/60)
    return handlerName
end

-- runs every `ms' milliseconds...more or less
local function setInterval(f, ms)
    local name = timerName()
    local handlerName = 'setInterval_' .. name
    local timer = ui.GetFrame('bandicam'):CreateOrGetControl('timer', name, 0, 0, 0, 0)
    local count = 0

    timer = tolua.cast(timer, 'ui::CAddOnTimer')
    timer:SetUpdateScript(handlerName)
    
    _G[handlerName] = function()
        count = count + 16.67
        
        if (count >= ms) then
            count = 0
            f()
        end
    end

    timer:Start(1/60)
    return handlerName
end

return {
    setTimeout=setTimeout,
    setInterval=setInterval
}
