
local maxX      = disp:getWidth()
local maxY      = disp:getHeight()
local progress  = "" 

function arr2str(arr)
    local result = {}
    for k,v in pairs(arr) do
        result[k] = string.char(v) 
    end
    return table.concat(result)
end


local loading = arr2str({183,208,211,224,227,215,218,208})

tmr.alarm(3, 500, tmr.ALARM_AUTO, function()
    disp:firstPage()
    repeat
        disp:setFont(u8g.font_unifont_0_8)
        disp:drawStr(0,20,loading)
        disp:drawStr(0,40,progress)
    until disp:nextPage() == false

    if progress:len() > 7
    then
        progress = ""
    else
        progress = progress .. "."    
    end
end)
