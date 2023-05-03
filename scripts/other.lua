local angleshit = -1
local varone = 1
function onBeatHit()
	varone = varone*-1
	setProperty('iconP1.angle',angleshit*8*varone)
	setProperty('iconP2.angle',angleshit*8*varone)
	setProperty('animatedicon.angle',angleshit*-12)
	doTweenAngle('hr', 'iconP1', 0, 0.3, 'circOut')
	doTweenAngle('hrr', 'iconP2', 0, 0.3, 'circOut')
	doTweenAngle('hrrr', 'animatedicon', 0, 0.8, 'circOut')
end

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.010 then
        setProperty('health', health- 0.010);
    end
end