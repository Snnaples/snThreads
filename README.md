# snThreads



<h1> PARAMS</h1><br>
<b> native = fivem native to call ( https://docs.fivem.net/natives/ ) </b>
<b> interval = interval to call native in miliseconds </b>
<b> native_args = the arguments to the native </b>
<b> condition = function that return bool value that determines whether the thread should run </b>
<b> return_cb = callback to which the return value of the native is passed </b>


SERVER-SIDE EXAMLPE
local thread = threads:create{ native  = ExecuteCommand, interval = 3000, native_args = { 'refresh'}, condition = function() return true  end, return_cb = function(retval)
    print(retval)
end}
thread:init()


CLIENT-SIDE EXAMPLE
local thread = threads:create{ native  = DrawMarker, interval = 0, native_args = {drawmarker-args}, condition = function() return true  end, return_cb = function(retval)
    <b> no return value beacuse DrawMarker doesn't return anything </b>
 end}
thread:init()
