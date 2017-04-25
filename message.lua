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

         if msg.drawGird then 
            print("drawing gird")
            local maxX  = disp:getWidth()
            local maxY  = disp:getHeight()
            disp:drawLine(  0,0,      maxX,0)
            disp:drawLine(  0,maxY/2, maxX,maxY/2)
            disp:drawLine(  0,maxY-1,   maxX-1,maxY-1)
            disp:drawLine(  0,0,      0,maxY)
            disp:drawLine(  maxX/2,0, maxX/2,maxY)
            disp:drawLine(  maxX-1,0,   maxX-1,maxY)
            disp:drawLine(0,0,maxX,maxY)
            disp:drawLine(  maxX/4,0,      maxX/4,maxY/2)
            disp:drawLine(  0,maxY/2,      maxX/2,0)
            disp:drawLine(  0,maxY/2, maxX,maxY/2)
            disp:drawLine( maxX/2 + maxX/4,0,maxX/2 + maxX/4,maxY/2)
            disp:drawLine( maxX/2, maxY/4,maxX,maxY/4)
            disp:drawLine( 0, maxY/2 + maxY/4,maxX,maxY/4 + maxY/2)
         end

    until disp:nextPage() == false
end
