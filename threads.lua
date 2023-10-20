threads = {}
threads.__index = threads

function threads:create(argcv)
    return setmetatable(argcv, threads)
end

function threads:init()
    self.routine = coroutine.create(function()
    Citizen.CreateThread(function()

        while self.condition() do
	    if (self.yield) then  coroutine.yield() end 
            self.return_cb(self.native(table.unpack(self.native_args)))
            Citizen.Wait(self.interval)
        end
        self.finished()

        end)
    end)
	coroutine.resume(self.routine)
end

function threads:pause()
    self.yield = true 
end

function threads:resume()
    self.yield = false 
	coroutine.resume(self.routine)
end

function threads:destroy()
    self.condition = function () return false end
end


--[[

    -- SERVER-SIDE EXAMLPE
    local thread = threads:create{ native  = ExecuteCommand, interval = 3000, native_args = { 'refresh'}, condition = function() return true  end, return_cb = function(retval)
        print(retval)
    end}
    thread:init()


    -- CLIENT-SIDE EXAMPLE
    local thread = threads:create{ native  = DrawMarker, interval = 0, native_args = {drawmarker-args}, condition = function() return true  end, return_cb = function(retval)
        -- no return value beacuse DrawMarker doesn't return anything
    end}
    thread:init()

]]
