return function (item)
    if item.font and item.x and item.y and item.text then
        item.text = item.text:gsub(string.char(194),"")
        disp:setFont(u8g[item.font])
        disp:drawStr(item.x,item.y,item.text)
        if debug then print(item.text) end
    else
        print("Error, input data is incomplete",item.x,item.y,item.text,item.font)
    end 
end