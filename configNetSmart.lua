wifi.setmode(wifi.STATION)
if config then
    wifi.sta.clearconfig()
    wifi.sta.config(config.ssid, config.pwd)
    wifi.sta.autoconnect(1)
    wifi.sta.connect()
    if debug then print(config.ssid, config.pwd) end
else
    print("Upload config.json!")
end
