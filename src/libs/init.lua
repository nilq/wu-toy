local __mod__ = (function()
local wu_love = require('././src/libs/wu_love')
local src = wu_love.src
local love = wu_love.love

return {
wu_love = wu_love,
}
end)()
return __mod__