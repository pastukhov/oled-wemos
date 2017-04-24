return function (data)
--    print(data)
    local msg = sjson.decode(data)    
    disp:firstPage()
    repeat
         disp:setFont(u8g[msg.time.font])
         disp:drawStr(msg.time.x,msg.time.y,msg.time.text)

         disp:setFont(u8g[msg.temperature.font])
         disp:drawStr(msg.temperature.x,msg.temperature.y,msg.temperature.text)

         disp:setFont(u8g[msg.forecast.font])
         disp:drawStr(msg.forecast.x,msg.forecast.y,msg.forecast.text)
         
    until disp:nextPage() == false
end
