return function (data)
    
    local msg = sjson.decode(data)    
    disp:firstPage()
    repeat
        for _, item in pairs(msg) do
            if item.type == "gird" then 
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
            elseif item.type == "text" then 
                if item.font and item.x and item.y and item.text then
                    item.text = item.text:gsub(string.char(194),"")
                    disp:setFont(u8g[item.font])
                    disp:drawStr(item.x,item.y,item.text)
                    if debug then print(str2hex(item.text), item.text) end
                else
                    print("Error, input data is incomplete",item.x,item.y,item.text,item.font)
                end
            elseif item.type == "image" then
                if item.x and item.y and item.w and item.h and arr2str(item.image.data) then
                    disp:drawXBM(item.x, item.y, item.w, item.h, arr2str(item.image.data))
                else
                    print("Error, input data is incomplete",item.x, item.y, item.w, item.h, sjson.encode(item.image.data))
                end
            elseif item.type == "upload" then
                disp:drawStr(0,11,item.name)
                file.open(item.name,"w")
                file.write(item.content)
                file.close()
            end
        end 

    until disp:nextPage() == false
end
