
function arr2str(arr)
    local result = {}
    for k,v in pairs(arr) do
        result[k] = string.char(v) 
    end
    return table.concat(result)
end

function connect ()
    mqtt:connect('home.nayg.ru', 8883, 1, function(conn)
        mqtt:subscribe('oled/events/+',0)
        tmr.stop(1) -- stop connecting
        tmr.stop(3) -- stop splash
        print ("Connected") 
        mqtt:publish('oled/status/'..node.chipid(),cjson.encode({status = 'online'}),0,0)
        
    end)
end



mqtt = mqtt.Client(node.chipid(), 120)

mqtt:lwt('oled/status/'..node.chipid(), cjson.encode({status = 'offline'}), 0, 0)

mqtt:on('offline', function(con) 
                    tmr.alarm(1, 1000, tmr.ALARM_AUTO, function()
                                                        print ("Offline") 
                                                        connect()
                                                       end)
                    end)


mqtt:on("message", function(conn, topic, data)
--    tmr.stop(1)
    local start = tmr.now()
            if topic:match('message$') then
                dolc('message',data)
            elseif topic:match('image$') then
                dolc('image',data)
            end

--    print(node.heap(),'bytes',tmr.now() - start, 'miliseconds', topic)
    
--    mqtt:publish('oled/status',cjson.encode({tstamp = tmr.time(), data = {memory = node.heap(),miliseconds = tmr.now() - start, topic = topic }}),0,0)
    data = nil
    topic =nil
         
    collectgarbage()
end)

tmr.alarm(2,1000,tmr.ALARM_AUTO, function() 
    print('Waiting for a network')
    if wifi.sta.status() == wifi.STA_GOTIP then 
        print('Got a network')
        tmr.stop(2)
        connect()
    end
end)

