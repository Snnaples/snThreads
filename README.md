# snThreads



<h1> PARAMS</h1><br>
<b> native = fivem native to call ( https://docs.fivem.net/natives/ ) </b><br>
<b> interval = interval to call native in miliseconds </b><br>
<b> native_args = the arguments to the native </b><br>
<b> condition = function that return bool value that determines whether the thread should run </b><br>
<b> return_cb = callback to which the return value of the native is passed </b><br>

<br>


SERVER-SIDE EXAMLPE<br>
local thread = threads:create{ native  = ExecuteCommand, interval = 3000, native_args = { 'refresh'}, condition = function() return true  end, return_cb = function(retval)<br>
    print(retval)<br>
end}<br>
thread:init()<br>


CLIENT-SIDE EXAMPLE<br>
local thread = threads:create{ native  = DrawMarker, interval = 0, native_args = {drawmarker-args}, condition = function() return true  end, return_cb = function(retval)<br>
    <b> no return value beacuse DrawMarker doesn't return anything </b><br>
 end}<br>
thread:init()
