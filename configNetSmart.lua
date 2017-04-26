wifi.setmode(wifi.STATION)
if file.exists("wificonfig.json") then
    file.open("wificonfig.json","r")
    wificonfig = sjson.decode(file.read())
    file.close()
    wifi.sta.clearconfig()
    wifi.sta.config(wificonfig.ssid, wificonfig.pwd)
    wifi.sta.autoconnect(1)
    wifi.sta.connect()
--    print(wificonfig.ssid, wificonfig.pwd)
else
    
end