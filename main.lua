local __mod__ = (function()
local src = require('./src')



love["graphics"]["setBackgroundColor"](255,200,200)

local window_width = 800

local window_height = 600

local point = {
__construct__ = function(__constructor)
return {
x = __constructor.x,
y = __constructor.y,
}
end
}
local distance = (function(a,b)
do
local dx = a["x"]-(b["x"])

local dy = a["y"]-(b["y"])

dx = dx^2
dy = dy^2
return math["sqrt"](dx+dy)
end
end)

local square = {
__construct__ = function(__constructor)
return {
pos = __constructor.pos,
size = __constructor.size,
speed = __constructor.speed,
color = __constructor.color,
}
end
}
local player = square.__construct__({
pos = point.__construct__({
x = window_width/2-15,
y = window_height/2-15,
})
,
size = point.__construct__({
x = 30,
y = 30,
})
,
color = {
[0] = 200,
[1] = 255,
[2] = 200,
},
speed = 350,
})


local potato = square.__construct__({
pos = point.__construct__({
x = math["random"](0,window_width),
y = math["random"](0,window_height),
})
,
size = point.__construct__({
x = 15,
y = 15,
})
,
speed = 0.5,
color = {
[0] = 200,
[1] = 200,
[2] = 200,
},
})


love["update"] = (function(dt)
do
local dx = 0

local dy = 0

if love["keyboard"]["isDown"]("up") then
dy = dy-player["speed"]*dt
end

if love["keyboard"]["isDown"]("down") then
dy = dy+player["speed"]*dt
end

if love["keyboard"]["isDown"]("left") then
dx = dx-player["speed"]*dt
end

if love["keyboard"]["isDown"]("right") then
dx = dx+player["speed"]*dt
end

player["pos"]["x"] = player["pos"]["x"]+dx

player["pos"]["y"] = player["pos"]["y"]+dy

player["pos"]["x"] = player["pos"]["x"]%window_width

player["pos"]["y"] = player["pos"]["y"]%window_height

if distance(player["pos"],potato["pos"])<(player["size"]["x"]) then
do
potato["pos"]["x"] = math["random"](0,window_width)
potato["pos"]["y"] = math["random"](0,window_height)
player["size"]["x"] = player["size"]["x"]+5

player["size"]["y"] = player["size"]["y"]+5

end
end
end
end)
local cool_square = (function(x,y,size,color)
do
love["graphics"]["setColor"](color[0],color[1],color[2])

love["graphics"]["rectangle"]("fill",x,y,size["x"],size["y"])

love["graphics"]["setColor"](color[0]-50,color[1]-50,color[2]-50)

return love["graphics"]["rectangle"]("line",x,y,size["x"],size["y"])
end
end)

love["draw"] = (function()
do
cool_square(potato["pos"]["x"],potato["pos"]["y"],potato["size"],potato["color"])

return cool_square(player["pos"]["x"],player["pos"]["y"],player["size"],player["color"])
end
end)
return {
src = src,
window_width = window_width,
window_height = window_height,
point = point,
distance = distance,
square = square,
player = player,
potato = potato,
cool_square = cool_square,
}
end)()
return __mod__