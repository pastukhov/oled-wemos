wifi.setmode(wifi.STATION)
if config then
    wifi.sta.clearconfig()
    wifi.sta.config(config.ssid, config.pwd)
    wifi.sta.autoconnect(1)
    wifi.sta.connect()
    print(config.ssid, config.pwd)
else
    print("Upload config.json!")
end
