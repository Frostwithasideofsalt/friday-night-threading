

function onCreate()
    setProperty("debugKeysChart", nil)-- disables 7
    setProperty("debugKeysCharacter", nil)-- disables 8
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
