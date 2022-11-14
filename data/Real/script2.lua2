function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.02 then
        setProperty('health', health- 0.02);
    end
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
