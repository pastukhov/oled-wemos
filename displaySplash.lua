
local maxX      = disp:getWidth()
local maxY      = disp:getHeight()
local counter   = 32

tmr.alarm(3, 500, tmr.ALARM_AUTO, function()
    second, minute, hour, day, date, month, year = 00,00,00,01,01,01
    ---ds3231.getTime();
    if string.len(minute) == 1 then minute = 0 .. minute end
    if string.len(hour) == 1 then hour = 0 .. hour end

    disp:firstPage()
    repeat
        disp:setFont(u8g.font_6x10)
        disp:drawStr(0,10,string.char(counter))
        if counter < 59 then
            counter = counter +1
        else
            counter = 32
        end
        disp:setFont(u8g.font_6x10)
        disp:drawStr(10,20,'loading')
        disp:setFont(u8g.font_6x10)
        disp:drawStr(9,30,day .. ' ' .. date .. ' ' .. month)

        disp:setFont(u8g.font_6x10)
        disp:drawStr(13,27,hour ..':'..minute)
        
    until disp:nextPage() == false
end)
