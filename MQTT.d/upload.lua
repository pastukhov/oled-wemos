return function (item)
    disp:drawStr(0,11,item.name)
    file.open(item.name,"w")
    file.write(item.content)
    file.close()
end