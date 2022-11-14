function onStepHit()
	--local accuracy = tostring(math.ceil(rating * 100))
	if botPlay == true then
		String2 = getProperty("botplayTxt.text")
	else
		String2 = getProperty("scoreTxt.text")
	end
	changePresence("Playing "..songName.." on "..difficultyName.." difficulty.", String2, "smallImageKey", hasStartTimestamp, endTimestamp)
end

function onEvent(n)
	if n == "PresenceUpdate" then
		onUpdatePost()
	end
end