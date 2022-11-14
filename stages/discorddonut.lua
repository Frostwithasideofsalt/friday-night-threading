function center(x, y)
	triggerEvent("Camera Follow Pos", tostring(num + x), tostring(num + y))
end

local last1, last2 = "idle", "idle"
local time = 0.4
local truthkey = {
	["singLEFT"] = {x = -20, angle = -30},
	["singDOWN"] = {y = 10, angle = 0},
	["singUP"] = {y = -10, angle = 0},
	["singRIGHT"] = {x = 20, angle = 30},
	["idle"] = {}
}
local movable = {
	"x",
	"y",
	"angle",
}

function onCreate()
	makeLuaSprite("backbackground", "yeti/bg", -1054)
	setObjectOrder("background", 11)
	addLuaSprite("backbackground", true)

	makeLuaSprite("background", "yeti/bg")
	setObjectOrder("background", 10)
	addLuaSprite("background", true)
	
	num = getProperty("background.width") / 2
	position = {num - 140, num - 165, num - 80, num + 40}

	makeAnimatedLuaSprite("yeti", "yeti/yeti", position[1], position[2])
	addAnimationByPrefix("yeti", "yeti", "yeti")
	addAnimationByPrefix("yeti", "angee", "angee")
	addLuaSprite("yeti", true)

	makeAnimatedLuaSprite("yetiWOOHOO", "yeti/yeti", num - 100, num - 170)
	addAnimationByPrefix("yetiWOOHOO", "engaged", "WOOHOO")
	addLuaSprite("yetiWOOHOO", true)
	setProperty("yetiWOOHOO.visible", false)

	makeAnimatedLuaSprite("tux", "yeti/tux", position[3], position[4])
	addAnimationByPrefix("tux", "tux", "tux")
	addAnimationByPrefix("tux", "creep", "creep")
	scaleObject("tux", 0.5, 0.5)
	addLuaSprite("tux", true)
	objectPlayAnimation("tux", "tux")
end

function onStepHit()
	if mustHitSection then
		center(0, 50)
	else
		center(0, -50)
	end
end

function onCreatePost()
	setProperty("boyfriendGroup.visible", false)
	setProperty("gfGroup.visible", false)
	setProperty("dadGroup.visible", false)

	center(-70, 30)

	--close(true)
end

function onEvent(n, v1, v2)
	--debugPrint(n, " : ", v1, " : ", v2)
	if n == "" then
		if v1 == "yeti" and v2 == "WOOHOO" then
			setProperty("yeti.visible", not getProperty("yeti.visible"))
			setProperty("yetiWOOHOO.visible", not getProperty("yetiWOOHOO.visible"))
		else
			objectPlayAnimation(v1, v2)
		end
	end
end

function onBeatHit()
	if getProperty("dad.animation.curAnim.name") == "idle" then
		setProperty("yeti.x", position[1])
		setProperty("yeti.y", position[2])
		setProperty("yeti.angle", 0)
	end
	if getProperty("boyfriend.animation.curAnim.name") == "idle" then
		setProperty("tux.x", position[3])
		setProperty("tux.y", position[4])
		setProperty("tux.angle", 0)
	end
end

function move(char, anim)
	local tn = 0
	if char == "tux" then
		tn = tn + 2
	end
	if truthkey[anim] then
		for i, v in pairs(movable) do
			local e = truthkey[anim][v]
			if e then
				if v == "x" then
					e = e + position[tn + 1]
				elseif v == "y" then
					e = e + position[tn + 2]
				end
				setProperty(char.."."..v, e)
			end
		end
	end
end

function onUpdate()
	if getProperty("dad.animation.curAnim.name") ~= last1 then
		last1 = getProperty("dad.animation.curAnim.name")
		move("yeti", getProperty("dad.animation.curAnim.name"))
	end
	if getProperty("boyfriend.animation.curAnim.name") ~= last1 then
		last1 = getProperty("boyfriend.animation.curAnim.name")
		move("tux", getProperty("boyfriend.animation.curAnim.name"))
	end
end