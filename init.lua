debug = false

function arr2str(arr)
--    local result = {}
--    for k,v in pairs(arr) do
--        result[k] = string.char(v) 
--    end
--    return table.concat(result)

  local s = ""
  for i = 1, table.getn(arr) do
    s = s .. string.char(arr[i]) -- '..' create new string. Expensive!!
  end
  return s

end

function dolc(fileName)
    if debug then
        print("Executing ", fileName)
        dofile(fileName .. '.lua')
    else
        if  file.exists(fileName .. '.lua') then
            print('Compiling:', fileName .. '.lua')
            local status, err = pcall(function () node.compile(fileName .. '.lua') end)
            if not status then print('Status', ': ',status,' Error: ',err) end
            file.remove(fileName .. '.lua')
        end
        if file.exists(fileName ..'.lc') then
           local _, _ = pcall(function () dofile(fileName .. '.lc') end)
        else
            print('Cant find ' .. fileName .. ' to exec')
        end
    end
    collectgarbage()
end

function str2hex(str)
    return (str:gsub('.', function (c)
        return string.format('%03u', string.byte(c)) .. " "
    end))
end

--dofile('readConfig.lua')
--dofile('initDisplay.lua')
--dofile('displaySplash.lua')
--dofile('configNetSmart.lua')
--dofile('station.lua')

files = file.list()
initd = {}
for fileName,_ in pairs(files) do
    if fileName:match('init.d/') then
--        print(fileName)
        table.insert(initd,fileName)
    end
end
table.sort(initd)

for _,unit in pairs(initd) do
    print("Running",unit)
    dofile(unit)
end
