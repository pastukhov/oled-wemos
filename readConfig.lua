if file.exists("config.json") then
    file.open("config.json","r")
    config = sjson.decode(file.read())
    file.close()
    if debug then print(sjson.encode(config)) end
else
    print("Upload config.json!")
end
