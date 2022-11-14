local paused, fakepaused = false, false
local pausetime = 0

local Number = 1

local textsize = 50

local Buttons = {
	"resume",
	"restart",
	--"real",
	"exit"
}

local ButtonNames = {
	"Resume",
	"Restart Song",
	--"Get Real",
	"Exit to Menu"
}

function setSongPosition(pos)
	setPropertyFromClass("Conductor", "songPosition", pos)
	setPropertyFromClass("flixel.FlxG", "sound.music.time", pos)
	setProperty("vocals.time", pos)
end

function onCreate()
	--addHaxeLibrary("CoolUtil")
	for i, v in pairs(Buttons) do
		makeLuaText(v, tostring(ButtonNames[i]), screenWidth - 200, 200,  200 + ((textsize + 10) * i))
		setObjectCamera(v, "other")
		setTextSize(v, textsize)
		addLuaText(v)
		setProperty(v..".autoSize", false)
		setProperty(v..".alignment", "left")
		setProperty(v..".alpha", 0)
	end

	makeLuaText("songnametext", songName, screenWidth, 0, screenHeight - textsize)
	setObjectCamera("songnametext", "other")
	setTextSize("songnametext", textsize)
	addLuaText("songnametext")
	setProperty("songnametext"..".autoSize", false)
	setProperty("songnametext"..".alignment", "right")
	setProperty("songnametext"..".alpha", 0)

	makeLuaText("songdifficultytext", difficultyName, screenWidth, 0, screenHeight - (textsize * 1.5))
	setObjectCamera("songdifficultytext", "other")
	setTextSize("songdifficultytext", textsize / 2)
	addLuaText("songdifficultytext")
	setProperty("songdifficultytext"..".autoSize", false)
	setProperty("songdifficultytext"..".alignment", "right")
	setProperty("songdifficultytext"..".alpha", 0)

	makeLuaText("songblueballedtext", "Deaths: "..tostring(getPropertyFromClass("PlayState", "deathCounter")), screenWidth, 0, screenHeight - (textsize * 2.5))
	setObjectCamera("songblueballedtext", "other")
	setTextSize("songblueballedtext", textsize / 2)
	addLuaText("songblueballedtext")
	setProperty("songblueballedtext"..".autoSize", false)
	setProperty("songblueballedtext"..".alignment", "right")
	setProperty("songblueballedtext"..".alpha", 0)

	Update()
end

function Pause()
	doTweenAlpha("GameAlpha0", "camGame", 0.5, 0.5, "linear")
	doTweenAlpha("HUDAlpha", "camHUD", 0.5, 0.5, "linear")

	doTweenAlpha("NameAlpha", "songnametext", 1, 0.5, "linear")
	doTweenAlpha("DiffAlpha", "songdifficultytext", 1, 0.5, "linear")
	doTweenAlpha("BluBalAlpha", "songblueballedtext", 1, 0.5, "linear")

	for i, v in pairs(Buttons) do
		doTweenAlpha(v.."Alpha", v, 1, 0.5, "linear")
	end
	--debugPrint("Paused")
end

function UnPause()
	cancelTween("GameAlpha0")
	doTweenAlpha("GameAlpha", "camGame", 1, 0.5, "linear")
	doTweenAlpha("HUDAlpha", "camHUD", 1, 0.5, "linear")

	doTweenAlpha("NameAlpha", "songnametext", 0, 0.5, "linear")
	doTweenAlpha("DiffAlpha", "songdifficultytext", 0, 0.5, "linear")
	doTweenAlpha("BluBalAlpha", "songblueballedtext", 0, 0.5, "linear")

	for i, v in pairs(Buttons) do
		doTweenAlpha(v.."Alpha", v, 0, 0.5, "linear")
	end
	--debugPrint("Unpaused")
end

function Update(Num)
	if type(Num) == "number" then
		Number = Number + Num
		if Number < 1 then-- around the pole
			Number = #Buttons
		elseif Number > #Buttons then
			Number = 1
		end
	end
	
	for i, v in pairs(Buttons) do
		if i == Number then
			setProperty(v..".color", getColorFromHex("ffffff"))
		else
			setProperty(v..".color", getColorFromHex("555555"))
		end
	end
end

function onUpdate()
	if paused then 
		if keyJustPressed("up") then
			Update(-1)
			playSound("scrollMenu")
			--debugPrint(Number)
		end
		if keyJustPressed("down") then
			Update(1)
			playSound("scrollMenu")
			--debugPrint(Number)
		end
	end
end

function onUpdatePost()
	if paused then
		setSongPosition(pausetime)
		setPropertyFromClass("flixel.FlxG", "sound.music.volume", 0)
		setProperty("vocals.volume", 0)
	--[[elseif pausetime > 0 then
		setPropertyFromClass("flixel.FlxG", "sound.music.volume", 1)
		setProperty("vocals.volume", 1)]]
	end
end

function Select(Num)
	if Num == 1 then
		UnPause()
	end
	if Num == 2 then
		loadSong(songName, difficulty)
	end
	--[[if Num == 3 then
		os.execute("start https://discord.gg/brga8NfGJ6")
	end]]
	if Num == 4 - 1 then
		exitSong()
	end
end

function onPause()
	pausetime = getSongPosition() -- needs to be set first to avoid restarting
	fakepaused = not fakepaused
	if fakepaused then
		Pause()
		paused = fakepaused
		--Update()
	else
		Select(Number)
	end
	return Function_Stop
end

function onTweenCompleted(T)
	if string.find(T, "GameAlpha") and fakepaused == false then
		paused = fakepaused
		callOnLuas("onResume", {})
		setPropertyFromClass("flixel.FlxG", "sound.music.volume", 1)
		setProperty("vocals.volume", 1)
	end
	if T == "GameAlpha0" then
		Update()
	end
	
end

function onResume()

end