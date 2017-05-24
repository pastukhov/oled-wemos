function arr2str(arr)
    local result = {}
    for k,v in pairs(arr) do
        result[k] = string.char(v) 
    end
    return table.concat(result)
end

function dolc(fileName, ...)
    if debug then
        print("Executing ", fileName)
        if arg.n > 0 then
            local _, _ = pcall(function () dofile(fileName .. '.lua')(unpack(arg)) end)
        else
            local _, _ = pcall(function () dofile(fileName .. '.lua') end)
        end
    else
        if  file.open(fileName .. '.lua') then
            file.close()
            print('Compiling:', fileName .. '.lua')
            local status, err = pcall(function () node.compile(fileName .. '.lua') end)
            if not status then print('Status', ': ',status,' Error: ',err) end
            file.remove(fileName .. '.lua')
        end
        if file.open(fileName ..'.lc') then
            file.close()
            if arg.n > 0 then
                local _, _ = pcall(function () dofile(fileName .. '.lc')(unpack(arg)) end)
            else
                local _, _ = pcall(function () dofile(fileName .. '.lc') end)
            end
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

debug = false
dolc('readConfig')
dolc('initDisplay')
--dolc('initTime')
--dolc('setLocale')
dolc('displaySplash')
dolc('configNetSmart')
dolc('station')

