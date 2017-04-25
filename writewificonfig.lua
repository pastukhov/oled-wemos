wificonfig = {
    ssid = "ssid",
    pwd = "password"
}

file.open("wificonfig.json","w")
file.write(sjson.encode(wificonfig))
file.close()