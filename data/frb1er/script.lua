

function onCreate()
    health = getProperty('health')	
    setProperty("debugKeysChart", nil)-- disables 7
    setProperty("debugKeysCharacter", nil)-- disables 8
    setProperty('health', 0.01);
end

function onBeatHit()
	doTweenX('hrrrr', 'iconP2.scale', 0.4, 0.5, 'circOut')
	doTweenX('hrrrrr', 'iconP1.scale', 0.4, 0.5, 'circOut')
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.2 then
        setProperty('health', health- 0.02);
    end
end

function onCreatePost()
    debugPrint(songName)
    debugPrint(difficulty, " : ", difficultyName)
end

function onUpdate()
    if keyboardJustPressed("SEVEN") or keyboardJustPressed("EIGHT") then
            debugPrint("frb1er")
            loadSong("frb1er", -1)
    end
end
