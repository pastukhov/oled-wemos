config.topic = {
                subscribe   =   'oled/' .. node.chipid() ..'/set',
                publish     =   'oled/' .. node.chipid(),
                status      =   'oled/' .. node.chipid() .. '/status'
              }

function connect ()
    client:connect(config.broker, config.port, config.tls, function(conn)
        client:subscribe(config.topic.subscribe,0)
        print ('Connected') 
        client:publish(config.topic.status,sjson.encode({ online = true}),0,1)
        splash:stop()
        reconnect:stop()
    end)
end


reconnect = tmr:create()
reconnect:register(1000, tmr.ALARM_AUTO, function()
    print ('Offline') 
    connect()
end)

getip = tmr.create()
getip:register(1000,tmr.ALARM_AUTO, function()
    print('Waiting for a network')
    if wifi.sta.status() == wifi.STA_GOTIP then
        print('Got a network')
        connect()
        getip:stop()
    end
end)

if client then
    client:close()
    client = nil
end

client = mqtt.Client(node.chipid(), 120, config.mqttlogin, config.mqttpassword)

client:lwt(config.topic.status , sjson.encode({online = false}), 0, 1)

client:on('offline',
  function()
    reconnect:start()
  end)

client:on('message', function(conn, topic, data)
    local msg = sjson.decode(data)
    disp:firstPage()
    repeat
        for _, item in pairs(msg) do
            dofile(item.type .. '.lua')(item)
        end 
    until disp:nextPage() == false
end)

getip:start()
