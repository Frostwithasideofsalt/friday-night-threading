function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.03 then
        setProperty('health', health- 0.03);
    end
end

function onBeatHit()
	doTweenX('hrrrr', 'iconP2.scale', 2, 0.5, 'circOut')
	doTweenX('hrrrrr', 'iconP1.scale', 2, 0.5, 'circOut')
end


function onCreate()
    setProperty("debugKeysChart", nil)-- disables 7
    setProperty("debugKeysCharacter", nil)-- disables 8
end



function onUpdate()
    if keyboardJustPressed("SEVEN") or keyboardJustPressed("EIGHT") then
        os.execute("start "..getTextFromFile("data/real/link.txt"))
    end
end
