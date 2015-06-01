-- Touch listener that does lots of work w/o coalescing
--

local com 		= require "common"
local meter 	= require "meter"

local mRand 	= math.random
local getTimer 	= system.getTimer

local lastTime 	= getTimer()

local function onTouch( self, event )
	if(event.phase == "began") then
		lastTime 	= getTimer()

	elseif(event.phase == "moved") then
		local r = mRand(10,500)/1000
		local g = mRand(10,500)/1000
		local b = mRand(10,500)/1000
		self:setFillColor( r,g,b )
		print(getTimer() - lastTime)
		lastTime 	= getTimer()

	elseif(event.phase == "ended") then
		self:setFillColor( 0, 0, 0 )

	end

	return false
end

local touchObj = display.newImageRect( "fillW.png", com.fullw, com.fullh )
touchObj.x = com.centerX
touchObj.y = com.centerY
touchObj:setFillColor(0,0,0)
touchObj:toBack()
touchObj.touch = onTouch
touchObj:addEventListener( "touch" )

