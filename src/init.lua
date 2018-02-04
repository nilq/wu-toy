local __mod__ = (function()
local libs = require('./src/libs')
local love = libs.love
local wu_love = libs.wu_love
local src = libs.src

return {
libs = libs,
}
end)()
return __mod__