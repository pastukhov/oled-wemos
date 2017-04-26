return function (data)
    
    local msg = sjson.decode(data)    
    disp:firstPage()
    repeat
        for _, string in pairs(msg) do
            if string.type == "gird" then 
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
            elseif string.type == "text" then 
                disp:setFont(u8g[string.font])
                disp:drawStr(string.x,string.y,string.text)
            elseif string.type == "image" then
                disp:drawXBM(string.x, string.y, string.w, string.h, arr2str(string.image.data))
            end
        end 

    until disp:nextPage() == false
end
