-- =============================================================
-- Copyright Roaming Gamer, LLC. 2009-2015 
-- =============================================================
-- 
-- =============================================================
local mFloor = math.floor

local common = {}

common.pieces = {}
common.decoys = {}

--
-- Game Variables
--
common.maxLevels 	= 2

common.debugEn		= false
common.turretDebug	= true
common.niceGraphics = true
common.loadOther 	= true 
common.loadDangers 	= true 

common.gravityContactMult = 3
common.gravityMag 	= 20 -- Gravity (base) magnitude
common.playerSpeed  = 360
common.jumpMag		= 17 -- Magnitude of jump impulse
common.airForce 	= 22
common.pathSpeed  	= 50

common.startOffsetY = 5

common.levelGrid	= 8 -- Grid is 8 x 8 for demo
common.buttonSize 	= 120
common.blockSize 	= 100 -- 100 --100 --350 --100 --* 0.25
common.playerSize 	= common.blockSize / 2
common.pickupSize 	= common.blockSize / 3
common.monsterSize 	= common.blockSize / 2
common.dangersSize 	= common.blockSize / 2 - 5
common.footSize 	= common.playerSize + 20
common.gapSize  	= 2.5 * common.blockSize --* 0.25
common.decoySize 	= common.blockSize / 3

common.turretSize 				= common.blockSize * 0.8
common.laserSpeed				= 250
common.laserWidth 				= common.blockSize/8
common.turretFireTime 			= 2000
common.turretRotateTime 		= 2000

common.rocketLifetime			= 5000
common.rocketFireTime 			= 2000
common.rocketSpeed				= 150
common.rocketMinFireDistance 	= 1.2 * common.gapSize
common.rocketAcquireDistance 	= 2 * common.gapSize

common.decoyImpulseMag			= 4
common.decoyAngularDamping 		= 0
common.decoyLinearDamping 		= 1

--
-- Helper Variables
--
common.w 				= display.contentWidth
common.h 				= display.contentHeight
common.centerX 			= display.contentCenterX
common.centerY 			= display.contentCenterY
common.fullw			= display.actualContentWidth 
common.fullh			= display.actualContentHeight
common.unusedWidth		= common.fullw - common.w
common.unusedHeight		= common.fullh - common.h
common.left				= 0 - common.unusedWidth/2
common.top 				= 0 - common.unusedHeight/2
common.right 			= common.w + common.unusedWidth/2
common.bottom 			= common.h + common.unusedHeight/2

-- Clean up variables
common.w 				= mFloor(common.w+0.5)
common.h 				= mFloor(common.h+0.5)
common.left				= mFloor(common.left+0.5)
common.top				= mFloor(common.top+0.5)
common.right			= mFloor(common.right+0.5)
common.bottom			= mFloor(common.bottom+0.5)
common.fullw			= mFloor(common.fullw+0.5)
common.fullh			= mFloor(common.fullh+0.5)

-- Determine design orientation
common.orientation  	= ( common.w > common.h ) and "landscape"  or "portrait"
common.isLandscape 		= ( common.w > common.h )
common.isPortrait 		= ( common.h > common.w )

-- Further clean up variables
common.left 			= (common.left>=0) and math.abs(common.left) or common.left
common.top 				= (common.top>=0) and math.abs(common.top) or common.top


--
-- Collision Calculator For Easy Collision Calculations
--
common.myCC = ssk.ccmgr:newCalculator()
common.myCC:addNames( "player", "foot", "platform", "pickup", "monster", "dangers", "bullet", "decoy" )
common.myCC:collidesWith( "player", "platform", "pickup", "monster", "dangers" )
common.myCC:collidesWith( "foot", "platform" )
common.myCC:collidesWith( "bullet", "platform", "player" )
common.myCC:collidesWith( "decoy", "platform", "bullet" )


return common