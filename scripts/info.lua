function onCreate()
    makeLuaSprite("ThingBackGround", "NO U", 0, screenHeight)
    makeGraphic("ThingBackGround", screenWidth / 4, screenHeight * 2, '000000')
    setProperty("ThingBackGround.alpha", 0.5)
    setObjectCamera("ThingBackGround", "hud")
    addLuaSprite("ThingBackGround", true)

    makeLuaText("InfoText", getTextFromFile(currentModDirectory.."/data/"..songName.."/info.txt"), screenWidth / 4, 0, 0)
    setTextSize("InfoText", 30)
    addLuaText("InfoText")
end

function onUpdate()
    setProperty("InfoText.x", getProperty("ThingBackGround.x"))
    setProperty("InfoText.y", getProperty("ThingBackGround.y") + 160)
end

function onTimerCompleted(T)
    if T == "RemoveTheFunni" then
        doTweenY("ThingBackGroundY", "ThingBackGround", screenHeight, 0.7, "backIn")
    end
end

function onSongStart()
    doTweenY("ThingBackGroundY", "ThingBackGround", 0, 0.7, "backOut")
    runTimer("RemoveTheFunni", 5.7)
end