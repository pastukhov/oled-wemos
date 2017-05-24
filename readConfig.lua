if file.exists("config.json") then
    file.open("config.json","r")
    config = sjson.decode(file.read())
    file.close()
--    print(sjson.encode(config))
else
    print("Upload config.json!")
end
