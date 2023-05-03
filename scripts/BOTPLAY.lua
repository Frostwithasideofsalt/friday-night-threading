local past = false

function randomize()
	local Table = stringSplit(getTextFromFile("data/BotPlaySlander.txt"), getTextFromFile("donttouch.txt"))
	setProperty("botplayTxt.text", Table[getRandomInt(1, #Table)])
end

function onCreatePost()
	randomize()
end

function onUpdate()
	if mustHitSection ~= past then
		mustHitSection = past
		randomize()
		triggerEvent("PresenceUpdate")
	end
end

function noteHit()
    if botPlay then
        playSound("JUICY")
    end
end

function opponentNoteHit()
    noteHit()
end

function goodNoteHit()
    noteHit()
end