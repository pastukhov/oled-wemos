local sda = 2 -- GPIO14
local scl = 1 -- GPIO12
local sla = 0x3c -- 0x3c or 0x3d
print(i2c.setup(0, sda, scl, i2c.SLOW))
disp = u8g.ssd1306_64x48_i2c(sla,0)
    
disp:firstPage()
repeat
until disp:nextPage() == false
