wificonfig = {
    ssid = "03-prod",
    pwd = "mwwemzu7"
}

--print(sjson.encode(wificonfig))
file.open("wificonfig.json","w")
file.write(sjson.encode(wificonfig))
file.close()