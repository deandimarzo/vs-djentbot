function start(song)
    -- djentMode "magnet" drags all notes into a single column
    -- djentMode "swirly" rotates notes and receptors around a single point like a cyclone
    -- djentMode "sideways" rotates the receptors 90deg so they sit on the right side of the screen

    -- djentLerp = "in" puts the current mode into a transitional lerp INTO the effect, "out" puts it out, and "none" makes the effect happen normally

    djentMode = "none"
    djentLerp = "none"

    lerpVal = 1 -- initialize the lerp Value at 0.
    lerpTime = 50 -- Time for each transition to take
    lerpClock = -1

end

function slerp(pos1, pos2, perc)
    
    slerp_perc = perc ^ 3
    
    return (1-slerp_perc)*pos1 + slerp_perc*pos2 -- Linear Interpolation
end


function update (elapsed)

    local currentBeat = (songPos / 1000)*(bpm/60)
    local targetBeat = math.floor(((songPos - lerpTime) / 1000)*(bpm/60))


    -- Actual modchart goes here:
    if (targetBeat == 48) then
        djentMode = "magnet"
        djentLerp = "in"    
    end
    if (targetBeat == 56) then
        djentLerp = "out"    
    end

    
    
    -- lerp behavior
    if (djentLerp == "in") then
        if (lerpClock == -1) then
            lerpClock = lerpTime
            djentLerp = "none"
            lerpVal = 1
        else 
            lerpVal = 1 - (lerpClock / lerpTime)
            lerpClock = lerpClock - 1
        end
        
        print(lerpClock)
        
    end
    
    if (djentLerp == "out") then
        if (lerpClock == -1) then
            lerpClock = lerpTime
            djentMode = "none"
               djentLerp = "none" 
            lerpVal = 1
        else 
            lerpVal = (lerpClock / lerpTime)
            lerpClock = lerpClock - 1
        end
        print(lerpClock)   
    end

    -- Swirly mode
    if djentMode == "swirly" then
        for i=0,7 do
            if (i > 3) then
                fromX = _G['defaultStrum'..i..'X']
                fromY = _G['defaultStrum'..i..'Y']
                toX =_G['defaultStrum5X'] + ((256) * math.sin((currentBeat/4 + i*0.25) * math.pi))
                toY = _G['defaultStrum5Y'] + ((32) * math.cos((currentBeat/4 + i*0.25) * math.pi))
                
                setActorX(slerp(fromX, toX, lerpVal), i)
                setActorY(slerp(fromY, toY, lerpVal), i)
            end
        end
    end

    -- magnet mode
    if djentMode == "magnet" then
        for i=0,7 do
            if (i > 3) then
                fromX = _G['defaultStrum'..i..'X']
                fromY = _G['defaultStrum'..i..'Y']
                toX = _G['defaultStrum5X']
                toY = _G['defaultStrum5Y']
                
                setActorX(slerp(fromX, toX, lerpVal), i)
                setActorY(slerp(fromY, toY, lerpVal), i)
            end
        end
    end
    


end
