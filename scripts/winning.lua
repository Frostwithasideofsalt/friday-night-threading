Can = false
Can2 = false

local icons = {
    tyler2 = "fard",
    ["Rod-joke"] = "bod",
    bf = "sex",
    marqies = "marq",	
    harold = "sus",
    ["marqies-peter"] = "marpet",
    tuxstare = "stare"
}

function onCreatePost()
    local String = icons[dadName]
    Can = String ~= nil

    local String2 = icons[boyfriendName]
    Can2 = String2 ~= nil

    if Can == true then
        makeLuaSprite("WinningDad", "icons/Winning/"..String, 0, 0)
        setObjectCamera("WinningDad", "HUD")
        setObjectOrder("WinningDad", getObjectOrder("iconP2"))
        addLuaSprite("WinningDad", true)
    end
    if Can2 == true then
        makeLuaSprite("WinningBF", "icons/Winning/"..String2, 0, 0)
        setObjectCamera("WinningBF", "HUD")
        setObjectOrder("WinningBF", getObjectOrder("iconP1"))
        addLuaSprite("WinningBF", true)
    end
end

function onUpdate()
	if Can == true then
		if getProperty("health") < 0.52 then
			setProperty("WinningDad.visible", true)
			setProperty("iconP2.visible", false)
			setProperty("WinningDad.x", getProperty("iconP2.x"))
			setProperty("WinningDad.y", getProperty("iconP2.y"))
			setProperty("WinningDad.angle", getProperty("iconP2.angle"))
			scaleObject("WinningDad", getProperty("iconP2.scale.x"), getProperty("iconP2.scale.y"))
		else
			setProperty("WinningDad.visible", false)
			setProperty("iconP2.visible", true)
		end
	end
	if Can2 == true then
		if getProperty("health") > 1.48 then
			setProperty("WinningBF.visible", true)
			setProperty("iconP1.visible", false)
			setProperty("WinningBF.x", getProperty("iconP1.x"))
			setProperty("WinningBF.y", getProperty("iconP1.y"))
			setProperty("WinningBF.angle", getProperty("iconP1.angle"))
			scaleObject("WinningBF", 0 - getProperty("iconP1.scale.x"), getProperty("iconP1.scale.y"))
		else
			setProperty("WinningBF.visible", false)
			setProperty("iconP1.visible", true)
		end
	end
end

function onEvent(N)
	if N == "Change Character" then
		onCreatePost()
	end
end